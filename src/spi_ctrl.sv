
module spi_ctrl(
    input  clk, 
    input  rst,
    
    input  send,

    output logic shift_dis, 
    output logic shift_en, 
    output logic done, 
    output logic load,
    output logic sclk
);

    typedef enum logic [2:0] {INIT,LOAD,SHIFT,DONE} state_t;

    state_t state;


        
    logic [3:0] count = 4'b0111;
    logic       clk_en;

    logic       r_sclk  = 1'b0;

    always @( edge clk )begin
        if (clk_en)
            r_sclk = ~r_sclk;
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
            state = INIT;
        end
        else
        case(state)
            INIT : begin                
                if(send)
                    state = LOAD;
                else
                    state = state;
            end
            
            LOAD : begin
                state = SHIFT;
            end
            
            SHIFT : begin
                if(count == 5'b0_0001)
                    state = DONE;
                else
                    state = state;
            end

            DONE : begin
                state = INIT;
            end

            
            default : begin
                state = INIT;
            end
        endcase
    end

    always @(*) begin

        case(state)
            INIT : begin
                shift_dis = 1'b1;
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b0;
            end
            
            LOAD : begin
                shift_dis = 1'b0;
                shift_en  = 1'b0;
                load      = 1'b1;
                done      = 1'b0;

                clk_en    = 1'b0;
            end
            
            
            SHIFT : begin
                shift_dis = 1'b0;
                shift_en  = 1'b1;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b1;
            end

            DONE : begin
                shift_dis = 1'b0;
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b1;

                clk_en    = 1'b1;
            end
            
            
            default : begin
                shift_dis = 1'b0;
                shift_en  = 1'b0;
                load      = 1'b0;
                done      = 1'b0;

                clk_en    = 1'b0;
            end
        endcase
    end
    


endmodule
