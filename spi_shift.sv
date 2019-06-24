
module spi_shift
#(
    parameter DW = 8
)(
    input           clk, 
    input           rst,
      
    input           shift_en,
    input           load, 
    input           miso,
    input  [DW-1:0] data,

    output          mosi
);
	reg [DW:0] data_r = 0;

    always @(posedge clk or negedge rst) begin
        if (rst)
			data_r = 8'b0000_0000;
		else if(load)
            data_r = { data,1'b0};
        else if (shift_en)
            data_r = {data_r[DW-1:0], miso};
        else
            data_r = data_r;
    end

    assign mosi = data_r[DW];

endmodule
