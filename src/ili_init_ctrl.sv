`ifndef ILI_INIT_CTRL_SV
    `define ILI_INIT_CTRL_SV
    
module ili_init_ctrl
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input  clk,
	input  rst,

	input  ena,
	input  sent,
	input  shift_dis,

	output logic          cs,
	output logic          dc,
	output logic          reset,
	output logic [DW-1:0] data,
	output logic          send

);

	typedef enum logic [3:0] {INIT,RST_A,RST_B,RST_C,CS_INI,COMM_DATA,CS_END,WAIT_15MS,WAIT} state_t;
	state_t    state ;

	localparam INI_COMMS = 7'b10_1111;
	localparam CN_C      = $clog2(INI_COMMS);

	localparam RSTS      = 2'b11;
	localparam CN_R      = $clog2(RSTS);

	localparam MS15      = 4'b1111;
	localparam CN_15     = $clog2(MS15);

	localparam CYCL8     = 3'b111;
	localparam CN_8      = $clog2(CYCL8);

	logic [CN_C-1:0]  cnt_comm = INI_COMMS;
	logic [CN_R-1:0]  cnt_rst  = RSTS;
	logic [CN_15-1:0] cnt_15   = MS15;
	logic [CN_8-1:0]  cnt_8    = CYCL8;

	logic  r_comm_ena;
	logic  r_rst_ena;
	logic  r_15_ena;
	logic  r_8_ena;
	
	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state = INIT;
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
			 	end

			 	RST_A:begin
			 		state <= WAIT_15MS;
			 	end

			 	RST_B:begin
					state <= WAIT_15MS;
			 	end

			 	RST_C:begin
					state <= WAIT_15MS;
			 	end

			 	CS_INI:begin
					state <= COMM_DATA;
			 	end

			 	COMM_DATA:begin
			 		if ( sent ) begin
			 			state <= WAIT;
			 		end 
			 		else begin
			 			state <= COMM_DATA;
			 		end
			 	end

			 	CS_END:begin
					state <= INIT;
			 	end

			 	WAIT_15MS:begin
			 		if     ( 2'b10 == cnt_rst  && !cnt_15 ) begin
			 			state <= RST_B; 
			 		end
			 		else if( 2'b01 == cnt_rst && !cnt_15 ) begin
			 			state <= RST_C;
			 		end
			 		else if( 2'b00 == cnt_rst && !cnt_15 ) begin
			 			state <= CS_INI;
			 		end
			 		else begin
			 			state <= WAIT_15MS;
			 		end
			 	end

			 	WAIT:begin
					if      ( cnt_comm < COMM_INIT  && !cnt_8 ) begin
			 			state <= COMM_DATA;
			 		end 
			 		else if ( cnt_comm == COMM_INIT ) begin
			 			state <= CS_END;
			 		end
			 		else begin
			 			state <= WAIT;
			 		end
			 	end

			endcase
		end
	end


	always @( * )begin
		if (!rst) begin
			r_comm_ena = OFF;
			r_rst_ena  = OFF;
			r_15_ena   = OFF;
			r_8_ena   = OFF;

			reset = HIGH;
			send  = LOW;
			data  = NO_DATA;
			cs    = HIGH;
			dc    = HIGH;
		end

		else begin
			case(state)
			 	INIT:begin
			 		r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	RST_A:begin
					r_comm_ena = OFF;
					r_rst_ena  = ON;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	RST_B:begin
					r_comm_ena = OFF;
					r_rst_ena  = ON;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = LOW;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	RST_C:begin
					r_comm_ena = OFF;
					r_rst_ena  = ON;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	CS_INI:begin
					r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = LOW;
					dc         = HIGH;
			 	end

			 	COMM_DATA:begin
					r_comm_ena = ON;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = HIGH;
					data       = ini_commands[cnt_comm-1];
					cs         = LOW;
					dc         = ini_commands[cnt_comm-1][8];
			 	end

			 	CS_END:begin
					r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	WAIT_15MS:begin
					r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = ON;
					r_8_ena    = OFF;

					reset      = reset;
					send       = LOW;
					data       = NO_DATA;
					cs         = HIGH;
					dc         = HIGH;
			 	end

			 	WAIT:begin
					r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = ON;

					reset      = HIGH;
					send       = LOW;
					data       = NO_DATA;
					cs         = LOW;
					dc         = ini_commands[cnt_comm][8];;
			 	end

			endcase
		end
	end


	
	always @( posedge clk, negedge rst ) begin
        if(!rst)
            cnt_comm <= INI_COMMS;
        else if ( sent )
            cnt_comm <= cnt_comm - 1;
        else
            cnt_comm <= cnt_comm;
    end


    always @( posedge clk, negedge rst ) begin
        if(!rst)
            cnt_8 <= CYCL8;
        else if ( r_8_ena )
            cnt_8 <= cnt_8 - 1;
        else
            cnt_8 <= CYCL8;
    end
	
		
    always @( posedge clk, negedge rst ) begin
        if(!rst)
            cnt_rst <= RSTS;
        else if (r_rst_ena)
            cnt_rst <= cnt_rst - 1;
        else
            cnt_rst <= cnt_rst;
    end


    always @( posedge clk, negedge rst ) begin
        if(!rst)
            cnt_15 <= MS15;
        else if (r_15_ena)
            cnt_15 <= cnt_15 - 1;
        else
            cnt_15 <= MS15;
    end

endmodule 
`endif