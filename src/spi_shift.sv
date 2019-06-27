
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
	reg [DW:0] data_r = 9'b1_1111_1111;

    always @( posedge clk, negedge rst ) begin
        if (!rst)
			data_r = 9'b1_1111_1111;
		else if(load)
            data_r = { data, miso };
        else if ( shift_en )
            data_r = { data_r[DW-1:0], miso };
        else
            data_r = data_r;
    end

    assign mosi = shift_en? data_r[DW] : 1'b1;

endmodule
