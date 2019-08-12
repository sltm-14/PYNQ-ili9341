`ifndef TOP_SPI_MASTER_SV
    `define TOP_SPI_MASTER_SV

module top_spi_master
import pkg_ili9341::*;
(
    input  clk,
    input  rst,

    input   miso,
    input   init_btn,

    output  [1:0] state_leds,
    output  reset,
    output  mosi,
    output  sclk,
    output  dc,
    output  cs
);

  st_top_wires wires;


    clk_divider CLK_DIV(
        .rst        (rst),
        .i_clk      (clk),

        .o_clk      (wires.clk)
    );

    ili_ctrl ILI_CTRL(
    	.clk               (wires.clk),
    	.rst               (rst),

        .i_ena_btn         (init_btn),
        .i_resets_sent     (wires.resets_sent),
        .i_command_sent    (wires.comm_array_sent),

        .o_state_leds      (state_leds),
        .o_reset_ini_ena   (wires.reset_ini_ena),
        .o_send_comm_ena   (wires.send_comm_ena),
        .o_command         (wires.command)
    );

    reset_init RST_INIT(
    	.clk               (wires.clk),
    	.rst               (rst),

        .i_reset_init_ena  (wires.reset_ini_ena),
        .i_reset_sent      (wires.reset_sent),

        .o_reset_ena       (wires.reset_ena),
        .o_reset_val       (wires.reset_val),
        .o_resets_sent     (wires.resets_sent)
    );

    reset RST(
    	.clk               (wires.clk),
    	.rst               (rst),

        .i_reset_ena       (wires.reset_ena),
        .i_reset_val       (wires.reset_val),

        .o_reset_sent      (wires.reset_sent),
        .o_reset           (reset)
    );

    send_command SEND_COMM(
        .clk               (wires.clk),
        .rst               (rst),

        .i_send_comm_ena   (wires.send_comm_ena),
        .i_command_sent    (wires.command_sent),
        .i_command         (wires.command),

        .o_comm_array_sent (wires.comm_array_sent),
        .o_send            (wires.send),
        .o_data            (wires.data),
        .o_dc              (wires.dc),
        .o_cs              (wires.cs)
    );

    spi_ctrl SPI_CTRL(
        .clk             (wires.clk),
        .rst             (rst),

        .send            (wires.send),

        .shift_en        (wires.shift_en),
        .done            (wires.command_sent),
        .load            (wires.load),
        .sclk            (sclk)
    );

    spi_shift SHIFT(
        .clk              (wires.clk),
        .rst              (rst),

        .i_shift_en       (wires.shift_en),
        .i_load           (wires.load),
        .i_data           (wires.data),
        .i_dc             (wires.dc),
        .i_cs             (wires.cs),
        .i_miso           (miso),

        .o_mosi           (mosi),
        .o_dc             (dc),
        .o_cs             (cs)
    );

endmodule
`endif
