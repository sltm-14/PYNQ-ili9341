`ifndef ILI_INIT_CTRL_SV
    `define ILI_INIT_CTRL_SV
    
module ili_init_ctrl
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input           clk,
	input           rst,

	input           ena,

	output          cs,
	output          dc,
	output          reset,
	output [DW-1:0] data,
	output          send

);

	localparam NO_DATA = 8'b0000_0000;
	localparam HIGH    = 1'b1;
	localparam LOW     = 1'b0;

	typedef enum logic [3:0] {INIT,RST_A,RST_B,RST_C,CS_INI,COMM,DATA,CS_END,WAIT_15MS,WAIT} state_t;
	state_t    state;

	logic r_RstCntEna;

	always @(posedge clk, negedge rst)begin
		if (rst) begin
			reset <= HIGH;
			send  <= LOW;
			data  <= NO_DATA;
			cs    <= HIGH;
			dc    <= HIGH;
		end

		else begin
			case(state)
			 	INIT:begin
			 		if (ena) begin
			 			state <= RST_A;
			 		end
			 		else begin
			 			state <= INIT;
			 		end

					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	RST_A:begin

			 		state <= WAIT_15MS;


					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	RST_B:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	RST_C:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	CS_INI:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	COMM_DATA:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	CS_END:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	WAIT_15MS:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			 	WAIT:begin
					reset <= HIGH;
					send  <= LOW;
					data  <= NO_DATA;
					cs    <= HIGH;
					dc    <= HIGH;
			 	end

			endcase
		end
	end

	localparma INI_COMMS = 6'b10_01111;
	localparam CN_C      = $clog2(INI_COMMS);

	reg [CN_C-1:0] cnt_comm = INI_COMMS;

	always @(posedge clk or negedge rst) begin
        if(rst)
            cnt_comm <= INI_COMMS;
        else if (shift_en)
            cnt_comm <= cnt_comm - 1;
        else
            cnt_comm <= INI_COMMS;
    end


	localparma RSTS  = 2'b11;
	localparam CN_R  = $clog2(RSTS);

	reg [CN_R-1:0] cnt_rst  = RSTS

    always @(posedge clk or negedge rst) begin
        if(rst)
            cnt_rst <= RSTS;
        else if (shift_en)
            cnt_rst <= cnt_rst - 1;
        else
            cnt_rst <= RSTS;
    end

endmodule 
`endif