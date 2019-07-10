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
	input  i_resets_sent,
	input  i_command_sent,

	output o_reset_ini_ena,
	output o_send_comm_ena,
	output o_command
);
  /*------------------------------------- STATES -------------------------------------*/

  typedef enum logic [2:0] {IDLE,RESET,INIT,LOOP} state_t;
  state_t    state = IDLE;

  /*----------------------------------- REGISTERS ------------------------------------*/

  logic r_send_comm_ena;
  logic r_reset_ini_ena;
  logic r_command;

  /*---------------------------------- FSM STATES ------------------------------------*/

	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state <= IDLE;
		end

		else begin
			case(state)
			 	IDLE:begin
			 		if (i_ena_btn) begin
			 			state <= RESET;
			 		end
			 		else begin
			 			state <= IDLE;
			 		end
			 	end

			 	RESET:begin
          if (i_resets_sent) begin
			 		    state <= INIT;
          end
          else begin
              state <= RESET;
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

			 	LOOP:begin
				      state <= LOOP;
			 	end

			 	default: begin
			 	   state <= IDLE;
			 	end

			endcase
		end
	end

  /*---------------------------------- FSM OUTPUTS -----------------------------------*/

	always @( * )begin
		if (!rst) begin
      r_send_comm_ena = OFF;
      r_reset_ini_ena = OFF;
      r_command       = OFF;
		end

		else begin
			case(state)
			 	IDLE:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena = OFF;
          r_command       = OFF;
			 	end

			 	RESET:begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena = ON;
          r_command       = OFF;
			 	end

			 	INIT:begin
          r_send_comm_ena = ON;
          r_reset_ini_ena = OFF;
          r_command       = INI_COMM;
			 	end

			 	LOOP:begin
          r_send_comm_ena = ON;
          r_reset_ini_ena = OFF;
          r_command       = LOOP_COMM;
			 	end

			 	default: begin
          r_send_comm_ena = OFF;
          r_reset_ini_ena = OFF;
          r_command       = OFF;
			 	end

			endcase
		end
	end

  /*-------------------------------- OUTPUTS ASSIGNATION ---------------------------------*/

  assign o_send_comm_ena = r_send_comm_ena;
  assign o_reset_ini_ena = r_reset_ini_ena;
  assign o_command       = r_command;

endmodule
`endif
