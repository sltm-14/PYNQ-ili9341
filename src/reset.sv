`ifndef ILI_INIT_CTRL_SV
    `define ILI_INIT_CTRL_SV

module ili_init_ctrl
import pkg_ili9341::*;
(
	input  clk,
	input  rst,

	input  i_reset_ena,
  input  i_reset_val,

  output o_reset_sent,
  output o_reset
);

	typedef enum logic [2:0] {IDLE,RESET,WAIT,DONE} state_t;
	state_t state = IDLE;

	localparam MS15  = 4'b1111;
	localparam CN_15 = $clog2(MS15);

	logic [CN_15-1:0] cnt_15 = MS15;

	logic r_reset = HIGH;

  always @( posedge clk, negedge rst ) begin
    if(!rst)
      cnt_15 <= MS15;
    else if (r_15_ena)
      cnt_15 <= cnt_15 - 1;
    else
      cnt_15 <= MS15;
  end

	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state = INIT;
		end

		else begin
			case(state)
			 	IDLE:begin
			 		if (i_reset_ena) begin
			 			state <= RESET;
			 		end
			 		else begin
			 			state <= IDLE;
			 		end
			 	end

			 	RESET:begin
			 		state <= WAIT_15MS;
			 	end

			 	WAIT:begin
			 		if ( !cnt_15 ) begin
			 			state <= DONE;
			 		end
			 		else begin
			 			state <= WAIT;
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


	always @( * )begin
		if (!rst) begin
      r_15_ena     = OFF;

      r_reset_sent = LOW;
      r_reset      = HIGH;
		end

		else begin
			case(state)
			 	IDLE:begin
          r_15_ena     = OFF;

          r_reset_sent = LOW;
					r_reset      = HIGH;
			 	end

			 	RESET:begin
          r_15_ena     = OFF;

          o_reset_sent = LOW;
					r_reset      = i_reset_val;
			 	end

			 	WAIT:begin
					r_15_ena     = ON;

          r_reset_sent = LOW;
          r_reset      = r_reset;
			 	end

        DONE: begin
          r_15_ena     = OFF;

          r_reset_sent = HIGH;
          r_reset      = HIGH;
        end

			endcase
		end
	end

  assign o_reset_sent = r_reset_sent;
  assign o_reset      = r_reset;

endmodule
`endif
