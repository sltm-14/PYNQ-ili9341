
module top_spi_master(
    input  clk, 
    input  rst,

    input        miso, 
    input        init_btn,
    input        write_btn,
    input [7:0]  data,

  //  output       rst_ili,
    output       mosi, 
    output       sclk,
    output       dc,
    output       cs
);
    wire shift_en_w;
    wire load_W;
    wire done_w;
    wire send_w;
    wire clk_10MHZ_w;
    wire [7:0] address_w;
    wire [7:0] register_w;
    wire [7:0] data_w;


    spi_write WRITE(
        .clk       (clk),
        .rst       (rst),

        .init_btn  (init_btn),
        .write_btn (write_btn),
        .idle      (done_w),
        .data_i    (data),

        .address   (address_w),
        .register  (register_w),
        .data      (data_w), 
        .send      (send_w)
    );
    
    spi_ctrl CTRL(
        .clk      (clk),
        .rst      (rst),

        .send     (send_w),

        .shift_en (shift_en_w),
        .done     (done_w),
		.load     (load_w),
        .sclk     (sclk),
        .cs       (cs)
    );

    spi_shift SHIFT(
        .clk      (clk), 
        .rst      (rst), 

        .shift_en (shift_en_w), 
        .load     (load_w), 
        .lsb      (miso), 
        .data     (), 

        .msb      (mosi)
    );

endmodule
