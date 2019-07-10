`ifndef RESET_INIT_SV
    `define RESET_INIT_SV

module reset_init
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input  clk,
	input  rst,

	input   i_reset_init_ena,
  input   i_reset_sent,

	output  o_reset_ena,
	output  o_reset_val,
	output  o_resets_sent
);
  /*------------------------------------- STATES -------------------------------------*/

  typedef enum logic [3:0] {IDLE,RESET_H1,RESET_L,RESET_H2,DONE} state_t;
  state_t state ;

  /*----------------------------------- REGISTERS ------------------------------------*/

  logic  r_reset_ena;
  logic  r_reset_val;
  logic  r_resets_sent;

  /*---------------------------------- FSM STATES ------------------------------------*/

  always @( posedge clk, negedge rst )begin
    if (!rst) begin
      state <= IDLE;
    end

    else begin
      case(state)
        IDLE:begin
          if (i_reset_init_ena) begin
            state <= RESET_H1;
          end
          else begin
            state <= IDLE;
          end
        end

        RESET_H1:begin
          if ( i_reset_sent ) begin
            state <= RESET_L;
          end
          else begin
            state <= RESET_H1;
          end
        end

        RESET_L:begin
          if ( i_reset_sent ) begin
            state <= RESET_H2;
          end
          else begin
            state <= RESET_L;
          end
        end

        RESET_H2:begin
          if ( i_reset_sent ) begin
            state <= DONE;
          end
          else begin
            state <= RESET_H2;
          end
        end

        DONE: begin
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
      r_reset_ena   = LOW;
      r_reset_val   = HIGH;
      r_resets_sent = LOW;
		end

		else begin
			case(state)
			 	IDLE:begin
          r_reset_ena   = LOW;
          r_reset_val   = HIGH;
          r_resets_sent = LOW;
			 	end

        RESET_H1:begin
          r_reset_ena   = HIGH;
          r_reset_val   = HIGH;
          r_resets_sent = LOW;
        end

        RESET_L:begin
          r_reset_ena   = HIGH;
          r_reset_val   = LOW;
          r_resets_sent = LOW;
        end

        RESET_H2:begin
          r_reset_ena   = HIGH;
          r_reset_val   = HIGH;
          r_resets_sent = LOW;
        end

        DONE: begin
          r_reset_ena   = LOW;
          r_reset_val   = HIGH;
          r_resets_sent = HIGH;
        end

        default: begin
          r_reset_ena   = LOW;
          r_reset_val   = HIGH;
          r_resets_sent = LOW;
        end

			endcase
		end
	end

  /*-------------------------------- OUTPUTS ASSIGNATION ---------------------------------*/

  assign  o_reset_ena   = r_reset_ena;
  assign  o_reset_val   = r_reset_val;
  assign  o_resets_sent = r_resets_sent;

endmodule
`endif
