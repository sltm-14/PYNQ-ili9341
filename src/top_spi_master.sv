
module top_spi_master(
    input  clk, 
    input  rst,

    input   miso, 
    input   init_btn,

    output  reset,
    output  mosi, 
    output  sclk,
    output  dc,
    output  cs
);
    wire w_send;
    wire w_shift_ena;
    wire w_done;
    wire w_load;
    wire w_shift_dis;

    wire [7:0] w_data;


    ili_init_ctrl ILI_INIT(
        .clk       (clk),
        .rst       (rst),

        .ena       (init_btn),
        .sent      (w_done),
        .shift_dis (w_shift_dis),

        .cs        (cs),
        .dc        (dc),
        .reset     (reset),
        .data      (w_data), 
        .send      (w_send)
    );
    
    spi_ctrl CTRL(
        .clk       (clk),
        .rst       (rst),
 
        .send      (w_send),

        .shift_dis (w_shift_dis),
        .shift_en  (w_shift_ena),
        .done      (w_done),
        .load      (w_load),
        .sclk      (sclk)
    );

    spi_shift SHIFT(
        .clk      (clk), 
        .rst      (rst), 

        .shift_en (w_shift_ena), 
        .load     (w_load), 
        .miso     (miso), 
        .data     (w_data), 

        .mosi     (mosi)
    );

endmodule
