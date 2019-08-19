module tb_spi_master
import pkg_ili9341::*;
();

    logic  clk;
    logic  rst;

    logic  miso;
    logic  init_btn;

    logic  [1:0] state_leds;
    logic  reset;
    logic  mosi;
    logic  sclk;
    logic  dc;
    logic  cs;

    logic led;
    logic o_miso;

	top_spi_master TB(
    	.clk       (clk),
    	.rst       (rst),

    	.miso      (miso),
    	.init_btn  (init_btn),

    	.reset     (reset),
    	.mosi      (mosi),
    	.sclk      (sclk),
    	.dc        (dc),
    	.cs        (cs),
		.state_leds(state_leds),

        .led(led),
        .o_miso(o_miso)
	);

	always begin
	    # 1 clk <= ~clk;
	end

    initial begin
        init_btn = 0;
        miso     = 1;
        clk      = 1;   #3;

        rst      = 1;   #2;
        rst      = 0;   #4;
        rst      = 1;   #10;

        init_btn = 1;   #10;
    end

endmodule
