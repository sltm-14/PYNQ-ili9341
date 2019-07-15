`ifndef SEND_COMMAND_SV
    `define SEND_COMMAND_SV

module send_command
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input  clk,
	input  rst,

	input           i_send_comm_ena,
	input           i_command_sent,
  input           i_command,
  input           i_shift_dis,

	output          o_comm_array_sent,
	output          o_send,
  output [DW-1:0] o_data,
  output          o_dc,
  output          o_cs
);

  /*------------------------------------- STATES -------------------------------------*/

  typedef enum logic [2:0] {IDLE,COMMAND,WAIT,DONE} state_t;
  state_t state = IDLE;

  /*----------------------------------- PARAMETERS -----------------------------------*/


	localparam CN_C      = COMM_LOOP > COMM_INIT ?  $clog2(COMM_LOOP) : $clog2(COMM_INIT);

	localparam CYCL8     = 3'b111;
	localparam CN_8      = $clog2(CYCL8);

  /*----------------------------------- REGISTERS ------------------------------------*/

	logic [CN_C-1:0] cnt_comm = COMM_INIT - 1'b1;

	logic [CN_8-1:0] cnt_8    = CYCL8;

	logic          r_8_ena           = LOW;

  logic          r_comm_array_sent = LOW;
	logic          r_send            = LOW;
  logic [DW-1:0] r_data            = NO_DATA;
	logic          r_cs              = HIGH;
	logic          r_dc              = HIGH;

  /*------------------------------ INIT COMMAND COUNTER ------------------------------*/

  always @( posedge clk, negedge rst ) begin
    if(!rst)
        cnt_comm <= COMM_INIT ;
    else if ( i_command_sent )
        cnt_comm <= cnt_comm - 1;
    else if (DONE == state)
      cnt_comm <= COMM_LOOP;
    else
        cnt_comm <= cnt_comm;
  end

  /*---------------------------------- WAIT COUNTER ----------------------------------*/

  always @( posedge clk, negedge rst ) begin
    if(!rst)
      cnt_8 <= CYCL8;
    else if ( r_8_ena )
      cnt_8 <= cnt_8 - 1;
    else
      cnt_8 <= CYCL8;
  end

  /*---------------------------------- FSM STATES ------------------------------------*/

	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state <= IDLE;
		end

		else begin
			case(state)
			 	IDLE:begin
			 		if ( i_send_comm_ena ) begin
			 			state <= COMMAND;
			 		end
			 		else begin
			 			state <= IDLE;
			 		end
			 	end

			 	COMMAND:begin
			 		if ( i_command_sent ) begin
			 			state <= WAIT;
			 		end
			 		else begin
			 			state <= COMMAND;
			 		end
			 	end

			 	WAIT:begin
					if ( cnt_comm < COMM_INIT  && !cnt_8 ) begin
            if ( cnt_comm == 1 ) begin
  			 			state <= DONE;
            end
            else begin
			 			  state <= COMMAND;
            end
			 		end
			 		else begin
			 			state <= WAIT;
			 		end
			 	end

        DONE:begin
          state <= IDLE;
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
      r_8_ena           = LOW;

      r_comm_array_sent = LOW;
    	r_send            = LOW;
      r_data            = NO_DATA;
    	r_dc              = HIGH;
    	r_cs              = HIGH;
		end

		else begin
			case(state)
			 	IDLE:begin
          r_8_ena           = LOW;

          r_comm_array_sent = LOW;
        	r_send            = LOW;
          r_data            = NO_DATA;
        	r_dc              = HIGH;
        	r_cs              = HIGH;
			 	end

			 	COMMAND:begin
          r_8_ena           = LOW;

          r_comm_array_sent = LOW;
        	r_send            = HIGH;
          r_data            = ( i_command == INI_COMM ) ? ini_commands[cnt_comm - 1]    : loop_commands[cnt_comm - 1];
          r_dc              = ( i_command == INI_COMM ) ? ini_commands[cnt_comm - 1][8] : loop_commands[cnt_comm - 1][8];
        	r_cs              = ( i_command == INI_COMM ) ? ini_commands[cnt_comm - 1][9] : loop_commands[cnt_comm - 1][9];
			 	end

			 	WAIT:begin
          r_8_ena           = HIGH;

          r_comm_array_sent = LOW;
        	r_send            = LOW;
          r_data            = NO_DATA;
          r_dc              = ( i_command == INI_COMM )? ini_commands[cnt_comm - 1][8] : loop_commands[cnt_comm - 1][8];
        	r_cs              = ( i_command == INI_COMM )? ini_commands[cnt_comm - 1][9] : loop_commands[cnt_comm - 1][9];
			 	end

        DONE:begin
          r_8_ena           = LOW;

          r_comm_array_sent = HIGH;
        	r_send            = LOW;
          r_data            = NO_DATA;
        	r_dc              = HIGH;
        	r_cs              = HIGH;
        end

			 	default: begin
          r_8_ena           = LOW;

          r_comm_array_sent = LOW;
        	r_send            = LOW;
          r_data            = NO_DATA;
          r_dc              = HIGH;
        	r_cs              = HIGH;
			 	end

			endcase
		end
	end

  /*-------------------------------- OUTPUTS ASSIGNATION ---------------------------------*/

  assign o_comm_array_sent = r_comm_array_sent;
	assign o_send            = r_send;
  assign o_data            = r_data;
  assign o_dc              = r_dc;
  assign o_cs              = r_cs;

endmodule
`endif
