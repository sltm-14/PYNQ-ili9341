`ifndef SPI_SHIFT_SV
    `define SPI_SHIFT_SV

module spi_shift
import pkg_ili9341::*;
#(
    parameter DW = 8
)(
    input           clk,
    input           rst,

    input           i_shift_en,
    input           i_load,
    input           i_miso,
    input  [DW-1:0] i_data,
    input           i_dc,
    input           i_cs,

    output          o_mosi,
    output          o_dc,
    output          o_cs
);

 /*----------------------------------- REGISTERS ------------------------------------*/

	logic [DW:0] r_data  = 9'b1_1111_1111;
    logic        r_dc    = 1'b1;
    logic        r_cs    = 1'b1;

    logic        rc_dc   = 1'b1;
    logic        rc_cs   = 1'b1;


    always @( posedge clk, negedge rst ) begin

        if ( !rst )begin
			r_data <= 9'b1_1111_1111;
            r_dc   <= 1'b1;
            r_cs   <= 1'b1;

            rc_dc  <= 1'b1;
            rc_cs  <= 1'b1;
        end

		else if( i_load )begin
            r_data <= { 1'b1, i_data};
            rc_dc  <= i_dc;
            rc_cs  <= i_cs;

            r_dc   <= r_dc;
            r_cs   <= r_cs;
        end

        else if ( !i_shift_en )begin
            r_data <= { 1'b1, r_data[DW-1:0] };
            r_cs   <= rc_cs;
            r_dc   <= rc_dc;

            rc_dc  <= rc_dc;
            rc_cs  <= rc_cs;
        end

        else begin
            r_data <= { r_data[DW-1:0], i_miso };
            r_dc   <= rc_dc;
            r_cs   <= rc_cs;

            rc_dc  <= rc_dc;
            rc_cs  <= rc_cs;
        end

    end

    assign o_mosi = r_data[DW];
    assign o_dc   = r_dc;
    assign o_cs   = r_cs;

endmodule
`endif
