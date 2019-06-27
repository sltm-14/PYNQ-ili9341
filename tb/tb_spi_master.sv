module tb_spi_master
import pkg_ili9341::*;
();

    logic  clk; 
    logic  rst;

    logic  miso; 
    logic  init_btn;

    logic  reset;
    logic  mosi; 
    logic  sclk;
    logic  dc;
    logic  cs;

	top_spi_master TB(
    	.clk       (clk), 
    	.rst       (rst),

    	.miso      (miso), 
    	.init_btn  (init_btn),

    	.reset     (reset),
    	.mosi      (mosi), 
    	.sclk      (sclk),
    	.dc        (dc),
    	.cs        (cs)
	);

	always begin
	    #1 clk <= ~clk;
	end


	initial begin
		init_btn = 0;
		miso     = 0;   
	    clk      = 1;   #3;

	    rst      = 1;   #2;
		rst      = 0;   #2;
	    rst      = 1;   #10;

	    init_btn = 1;   #2;
	    init_btn = 0;   

	end

endmodule 