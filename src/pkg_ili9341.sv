`ifndef PKG_ILI9341_SV
`define PKG_ILI9341_SV

package pkg_ili9341;

		/*/*-------------------------------------------------------------------- PARAMETERS --------------------------------------------------------------------*/

	localparam COMM_INIT = 48;
	localparam COMM_LOOP = 3;
	localparam NO_DATA   = 8'b0000_0000;

	localparam HIGH      = 1'b1;
	localparam LOW       = 1'b0;

	localparam ON        = 1'b1;
	localparam OFF       = 1'b0;

	localparam INI_COMM  = 1'b1;
	localparam LOOP_COMM = 1'b0;

	/*----------------------------------------------------------------- INIT COMMANDS ARRAY -----------------------------------------------------------------*/

	logic[9:0] ini_commands [COMM_INIT-1:0] = '{

						/* Idle */  /* Memory Write */                                                                      /* Nop */
						{LOW, LOW,  8'hCB}, {LOW, HIGH, 8'h39}, {LOW, HIGH, 8'h2C}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h34}, {LOW, HIGH, 8'h02},
						{LOW, LOW,  8'hCF}, {LOW, HIGH, 8'h00},

						/* Power control */
						{LOW, HIGH, 8'hC1}, {LOW, HIGH, 8'h30}, {LOW, LOW,  8'hE8}, {LOW, HIGH, 8'h85}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h78},
						{LOW, LOW,  8'hEA}, {LOW, HIGH, 8'h00},	{LOW, HIGH, 8'h00}, {LOW, LOW,  8'hED}, {LOW, HIGH, 8'h64}, {LOW, HIGH, 8'h03},
						{LOW, HIGH, 8'h12}, {LOW, HIGH, 8'h81}, {LOW, LOW,  8'hF7}, {LOW, HIGH, 8'h20},	{LOW, LOW,  8'hC0}, {LOW, HIGH, 8'h23},
						{LOW, LOW,  8'hC1}, {LOW, HIGH, 8'h10},

						/* VCOM */
						{LOW, LOW,  8'hC5}, {LOW, HIGH, 8'h3E}, {LOW, HIGH, 8'h28}, {LOW, LOW,  8'hC7}, {LOW, HIGH, 8'h86}, {LOW, LOW,  8'h36},
						{LOW, HIGH, 8'h48},

						/* Memory Access Control */
						{LOW, LOW,  8'h3A}, {LOW, HIGH, 8'h55},

						/* Frame Rate */
						{LOW, LOW,  8'hB1}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h18}, {LOW, LOW,  8'hB6}, {LOW, HIGH, 8'h08}, {LOW, HIGH, 8'h82},
						{LOW, HIGH, 8'h27}, {LOW, LOW,  8'h11},	{LOW, HIGH, 8'h29}, {LOW, LOW,  8'h2C}, // Start  Memory-Write

						{LOW, LOW,  8'hFF} // Ignore
	};

	/*----------------------------------------------------------------- LOOP COMMANDS ARRAY -----------------------------------------------------------------*/

	logic [9:0] loop_commands [COMM_LOOP-1:0] = '{
						{HIGH, HIGH, 8'hAA}, {HIGH, HIGH, 8'h00}, {HIGH, HIGH, 8'hAA}
	};

	/*------------------------------------------------------------------ TOP WIRES STRUCT -------------------------------------------------------------------*/

	typedef struct{
			logic       resets_sent;
			logic       command_sent;
			logic       reset_ini_ena;
			logic       send_comm_ena;
			logic       command;
			logic       reset_sent;
			logic       reset_ena;
			logic       reset_val;
			logic       comm_array_sent;
			logic       shift_dis;
			logic       send;
			logic       shift_en;
			logic       done;
			logic       load;
			logic [7:0] data;
	} st_top_wires;

endpackage
`endif
