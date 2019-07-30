`ifndef SPI_CTRL_SV
    `define SPI_CTRL_SV

module spi_ctrl
import pkg_ili9341::*;
(
    input  clk,
    input  rst,

    input  send,

    output logic shift_en,
    output logic done,
    output logic load,
    output logic sclk
);

  /*------------------------------------- STATES -------------------------------------*/

    typedef enum logic [2:0] {INIT,LOAD,SHIFT,DONE} state_t;
    state_t state;

    /*----------------------------------- REGISTERS ------------------------------------*/

    logic [3:0] count   = 4'b0111;
    logic       r_sclk  = 1'b0;
    logic       clk_en;

    always @( * )begin
        if (clk_en)
            r_sclk = ~clk;
        else
            r_sclk = 1'b0;
    end

    assign sclk = r_sclk;

    always @( posedge clk, negedge rst ) begin
        if(!rst)
            count <= 3'b111;
        else if (shift_en)
            count <= count - 1;
        else
            count <= 3'b111;
    end

    always @(posedge clk, negedge rst) begin

        if (!rst) begin
            state <= INIT;
        end

        else begin
            case(state)
                INIT : begin
                    if(send)
                        state <= LOAD;
                    else
                        state <= state;
                end

                LOAD : begin
                    state <= SHIFT;
                end

                SHIFT : begin
                    if(count == 5'b0_0001)
                        state <= DONE;
                    else
                        state <= state;
                end

                DONE : begin
                    state <= INIT;
                end


                default : begin
                    state <= INIT;
                end
            endcase
        end
    end

    always @(*) begin

        case(state)
            INIT : begin
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b0;
            end

            LOAD : begin
                shift_en  = 1'b0;
                load      = 1'b1;
                done      = 1'b0;

                clk_en    = 1'b0;
            end

            SHIFT : begin
                shift_en  = 1'b1;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b1;
            end

            DONE : begin
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b1;

                clk_en    = 1'b1;
            end

            default : begin
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b0;
            end
        endcase
    end

endmodule
`endif
