`ifndef PKG_ILI9341_SV
`define PKG_ILI9341_SV

package pkg_ili9341;

	reg[8:0] ini_commands [0:46] = '{

		{1'b0, 8'hCB}, 

		/* Idle */
		{1'b1, 8'h39}, 
		/* Memory Write */
		{1'b1, 8'h2C}, {1'b1, 8'h00}, 
		{1'b1, 8'h34}, {1'b1, 8'h02}, 

		{1'b0, 8'hCF}, 
		/* Nop */
		{1'b1, 8'h00}, 
		/* Power control */
		{1'b1, 8'hC1}, 
		{1'b1, 8'h30}, 

		{1'b0, 8'hE8},

		{1'b1, 8'h85}, {1'b1, 8'h00},
		{1'b1, 8'h78}, 

		{1'b0, 8'hEA}, 

		{1'b1, 8'h00}, {1'b1, 8'h00}, 

		{1'b0, 8'hED}, 

		{1'b1, 8'h64}, {1'b1, 8'h03}, 
		{1'b1, 8'h12}, {1'b1, 8'h81},

		{1'b0, 8'hF7}, 

		{1'b1, 8'h20}, 

		{1'b0, 8'hC0},

		{1'b1, 8'h23}, 

		{1'b0, 8'hC1},

		{1'b1, 8'h10}, 

		// VCOM
		{1'b0, 8'hC5}, 

		{1'b1, 8'h3E}, {1'b1, 8'h28}, 

		{1'b0, 8'hC7}, 

		{1'b1, 8'h86},

		{1'b0, 8'h36}, 

		{1'b1, 8'h48},

		// Memory Access Control
		{1'b0, 8'h3A}, {1'b1, 8'h55},

		// Frame Rate
		{1'b0, 8'hB1}, 

		{1'b1, 8'h00}, {1'b1, 8'h18},

		{1'b0, 8'hB6}, 

		{1'b1, 8'h08}, {1'b1, 8'h82}, 
		{1'b1, 8'h27},
		
		{1'b0, 8'h11}, 

		{1'b1, 8'h29},
		{1'b0, 8'h2C} // Start  Memory-Write
	};

endpackage
`endif