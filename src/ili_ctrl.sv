`ifndef ILI_CTRL_SV
    `define ILI_CTRL_SV

module ili_ctrl
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input  clk,
	input  rst,

	input  i_ena_btn,
	input  i_reset_done,
	input  i_command_sent,

	output          o_reset_ini_ena,
	output          o_send_comm_ena,
	output [DW-1:0] o_command

);
  logic          r_send_comm_ena;
  logic          r_reset_ini_ena;
  logic [DW-1:0] r_command;

	typedef enum logic [2:0] {IDLE,RESET,INIT,LOOP} state_t;
	state_t    state ;

	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state <= INIT;
		end

		else begin
			case(state)
			 	INIT:begin
			 		if (i_ena_btn) begin
			 			state <= RST_A;
			 		end
			 		else begin
			 			state <= INIT;
			 		end
			 	end

			 	RESET:begin
          if (i_reset_done) begin
			 		    state <= INIT;
          end
          else begin
              state <= INIT;
          end
          end
			 	end

			 	INIT:begin
          if (i_command_sent)begin
				      state <= LOOP;
          end
          else begin
              state <= INIT;
          end
          end
			 	end

			 	LOOP:begin
				      state <= LOOP;
			 	end

			 	default: begin
			 	   state <= INIT;
			 	end

			endcase
		end
	end


	always @( * )begin
		if (!rst) begin
      r_send_comm_ena = OFF;
      r_reset_ini_ena     = OFF;
      r_command       = OFF;
		end

		else begin
			case(state)
			 	INIT:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena     = OFF;
          r_command       = OFF;
			 	end

			 	RESET:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena     = OFF;
          r_command       = OFF;
			 	end

			 	INIT:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena     = OFF;
          r_command       = OFF;
			 	end

			 	LOOP:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena     = OFF;
          r_command       = OFF;
			 	end

			 	default: begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena     = OFF;
          r_command       = OFF;
			 	end

			endcase
		end
	end

  assign o_send_comm_ena = r_send_comm_ena;
  assign o_reset_ini_ena = r_reset_ini_ena;
  assign o_command       = r_command;

endmodule
`endif
