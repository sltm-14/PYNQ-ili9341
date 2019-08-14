`ifndef ILI_CTRL_SV
    `define ILI_CTRL_SV

module ili_ctrl
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
	input  clk,
	input  rst,

	input        i_ena_btn,
	input        i_resets_sent,
	input        i_command_sent,

    output [1:0] o_state_leds,
	output       o_reset_ini_ena,
	output       o_send_comm_ena,
	output       o_command
);
  /*------------------------------------- STATES -------------------------------------*/

  typedef enum logic [1:0] {IDLE,RESET,INIT,LOOP} state_t;
  state_t    state = IDLE;

  logic [1:0] state_leds;



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
            state_leds      = 2'b00;
        end

        else begin

            case(state)

                IDLE:begin
                    r_send_comm_ena = OFF;
                    r_reset_ini_ena = OFF;
                    r_command       = OFF;
                    state_leds      = 2'b00;
                end

                RESET:begin
                    r_send_comm_ena = OFF;
                    r_reset_ini_ena = ON;
                    r_command       = OFF;
                    state_leds      = 2'b10;
                end

                INIT:begin
                    r_send_comm_ena = ON;
                    r_reset_ini_ena = OFF;
                    r_command       = INI_COMM;
                    state_leds      = 2'b01;
                end

                LOOP:begin
                    r_send_comm_ena = ON;
                    r_reset_ini_ena = OFF;
                    r_command       = LOOP_COMM;
                    state_leds      = 2'b11;
                end

                default: begin
                    r_send_comm_ena = OFF;
                    r_reset_ini_ena = OFF;
                    r_command       = OFF;
                    state_leds     = 2'b00;
                end

            endcase
        end
    end

  /*-------------------------------- OUTPUTS ASSIGNATION ---------------------------------*/

    assign o_send_comm_ena = r_send_comm_ena;
    assign o_reset_ini_ena = r_reset_ini_ena;
    assign o_command       = r_command;
    assign o_state_leds    = state_leds;

endmodule
`endif
