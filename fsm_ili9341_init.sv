module fsm_ili9341_init#(
    parameter DW = 8
)(
	input clk,
	input rst,
	input ena,

	output          cs,
	output          dc,
	output          sclk
	output          reset,
	output [DW-1:0] data,
	output          load,
	output          done,
	output          shift_ena


);
	localparam HIGH = 1;
	localparam LOW  = 0;

	reg [4:0] count_comm = 5'b1_0111;
	reg [4:0] count_wait = 5'b1_0111;

	typedef enum logic [3:0] {INIT,RST_A,RST_B,RST_C,CS_INI,COMM_DATA,CS_END,WAIT_15MS,WAIT} state_t;
	state_t state;

	always @(edge clk)begin
        if (clk_en)
            sclk = clk;
        else
            sclk = 1'b0;
    end

	always @(posedge clk, negedge rst)begin
		if (rst) begin
			cs        = HIGH;
			dc        = HIGH;
			reset;
			data;
			load      = LOW;
			done      = LOW;
			shift_ena = LOW;
		end

		 case(state)
		 	INIT:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = HIGH;
		 	end

		 	RST_A:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = HIGH;
		 	end

		 	RST_B:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = LOW;
		 	end

		 	RST_C:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = HIGH;
		 	end

		 	CS_INI:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = HIGH;
		 	end

		 	COMM_DATA:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = 0;
		 	end

		 	CS_END:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = HIGH;
		 	end

		 	WAIT_15MS:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = 0;
		 	end

		 	WAIT:begin
				data    = 8'b0000_0000;
				comm    = 0;
				send    = 0;
				rst_ili = 0;
		 	end

		 endcase


	end

    always @(posedge clk or negedge rst) begin
        if(rst)
            count <= 5'b0111;
        else if (shift_en)
            count <= count - 1;
        else
            count <= 5'b0111;
    end

endmodule 