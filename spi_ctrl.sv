
module spi_ctrl(
    input  clk, 
    input  rst,
    input  send,

    output logic shift_en, 
    output logic done, 
    output logic load,
    output logic sclk
);

    typedef enum logic [1:0] {INIT,LOAD,SHIFT} state_t;

    state_t state;

        
    reg [4:0] count = 5'b1_0111;
    reg       clk_en;

    always @(edge clk)begin
        if (clk_en)
            sclk = clk;
        else
            sclk = 1'b0;
    end


    always @(posedge clk or negedge rst) begin
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
                if(count == 5'b0_00000)
                    state = INIT;
                else
                    state = state;
            end

            
            default : begin
                state = INIT;
            end
        endcase
    end

    always @(*) begin
        case(state)
            INIT : begin
                shift_en = 1'b0;
                load     = 1'b0;
                done     = 1'b1;

                clk_en   = 1'b0;
            end
            
            LOAD : begin
                shift_en = 1'b0;
                load     = 1'b1;
                done     = 1'b0;

                clk_en   = 1'b0;
            end
            
            
            SHIFT : begin
                shift_en = 1'b1;
                load     = 1'b0;
                done     = 1'b0;

                clk_en   = 1'b1;
            end
            
            
            default : begin
                shift_en = 1'b0;
                load     = 1'b0;
                done     = 1'b0;

                clk_en   = 1'b0;
            end
        endcase
    end

    always @(*)begin
        if (clk_en)
            sclk = clk;
        else
            sclk = 1'b0;
    end
    
    always @(posedge clk or negedge rst) begin
        if(rst)
            count <= 5'b0111;
        else if (shift_en)
            count <= count - 1;
        else
            count <= 5'b0111;
    end

endmodule
