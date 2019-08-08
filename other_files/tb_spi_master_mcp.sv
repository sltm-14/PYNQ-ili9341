//
// module tb_spi_master_mcp();
//
// 	logic clk;
// 	logic rst;
//
// 	logic        init_btn;
//     logic        write_btn;
//     logic  [7:0] data;
// 	logic        miso;
//
// 	logic  [1:0] state_leds,
// 	logic mosi;
// 	logic sclk;
// 	logic ss;
//
//
//
// 	spi_master_mcp SPI (
// 		.clk(clk),
// 		.rst(rst),
//
//     	.init_btn(init_btn),
//     	.write_btn(write_btn),
//         .data(data),
// 		.miso(miso),
//
// 		.mosi(mosi),
// 		.sclk(sclk),
// 		.cs(ss),
// 		.state_leds(state_leds)
// 	);
//
// 	initial begin
//
// 		clk = 0;
// 		rst = 0;
//
// 		data    = 8'h32;
// 		miso    = 1;
//
// 		   write_btn = 0;
//
// 		   init_btn  = 0;
//         #2 init_btn  = 1;
//         #2 init_btn  = 0;
//
//         # 70;
//
//         #2 write_btn = 1;
//         #2 write_btn = 0;
//
//         #170;
// 	end
//
//     always begin
//         #1 clk = ~clk;
//     end
//
// endmodule
