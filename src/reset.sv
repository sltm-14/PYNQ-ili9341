`ifndef RESET_SV
`define RESET_SV

module reset
import pkg_ili9341::*;
(
    input  clk,
    input  rst,

    input  i_reset_ena,
    input  i_reset_val,

    output o_reset_sent,
    output o_reset
);
  /*------------------------------------- STATES -------------------------------------*/

	typedef enum logic [2:0] {IDLE,RESET,WAIT,DONE} state_t;
	state_t state = IDLE;

  /*----------------------------------- PARAMETERS -----------------------------------*/

	localparam MS15  = 60_000;
	localparam CN_15 = $clog2(MS15);

  /*----------------------------------- REGISTERS ------------------------------------*/

    logic [CN_15-1:0] cnt_15        = MS15;
    logic             r_reset       = HIGH;
    logic             r_reset_sent  = OFF;
    logic             r_15_ena      = OFF;

  /*---------------------------------- WAIT COUNTER ----------------------------------*/

    always @( posedge clk, negedge rst ) begin
        if(!rst)
            cnt_15 <= MS15;
        else if (r_15_ena)
            cnt_15 <= cnt_15 - 1;
        else
            cnt_15 <= MS15;
    end

  /*---------------------------------- FSM STATES ------------------------------------*/

    always @( posedge clk, negedge rst )begin
        if (!rst) begin
            state <= IDLE;
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
                state <= WAIT;
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

  /*---------------------------------- FSM OUTPUTS -----------------------------------*/

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

                    r_reset_sent = LOW;
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

  /*-------------------------------- OUTPUTS ASSIGNATION ---------------------------------*/

  assign o_reset_sent = r_reset_sent;
  assign o_reset      = r_reset;

endmodule
`endif
