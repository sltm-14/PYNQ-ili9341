`ifndef ILI_INIT_CTRL_SV
    `define ILI_INIT_CTRL_SV

module ili_init_ctrl
(
	input  clk,
	input  rst,

	input  i_send_comm_ena,
	input  i_command_sent,
  input  i_commands,
  input  i_shift_dis,

	output o_comm_array_sent,
	output o_send,
  output o_data,
  output o_dc,
  output o_cs

);

  typedef enum logic [2:0] {IDLE,COMMAND,WAIT,DONE} state_t;
  state_t state = IDLE;

	localparam INI_COMMS = 7'b10_1111;
	localparam CN_C      = $clog2(INI_COMMS);

	localparam CYCL8     = 3'b111;
	localparam CN_8      = $clog2(CYCL8);

	logic [CN_C-1:0]  cnt_comm = INI_COMMS;
	logic [CN_8-1:0]  cnt_8    = CYCL8;

	logic  r_comm_ena;
	logic  r_8_ena;

  logic r_comm_array_sent = LOW;
	logic r_send            = LOW;
  logic r_data            = NO_DATA;
	logic r_cs              = HIGH;
	logic r_dc              = HIGH;

  always @( posedge clk, negedge rst ) begin
    if(!rst)
        cnt_comm <= INI_COMMS;
    else if ( sent )
        cnt_comm <= cnt_comm - 1;
    else
        cnt_comm <= cnt_comm;
  end

  always @( posedge clk, negedge rst ) begin
    if(!rst)
      cnt_8 <= CYCL8;
    else if ( r_8_ena )
      cnt_8 <= cnt_8 - 1;
    else
      cnt_8 <= CYCL8;
  end

	always @( posedge clk, negedge rst )begin
		if (!rst) begin
			state <= INIT;
		end

		else begin
			case(state)
			 	IDLE:begin
			 		if ( i_send_comm_ena ) begin
			 			state <= COMMAND;
			 		end
			 		else begin
			 			state <= IDLE;
			 		end
			 	end

			 	COMMAND:begin
			 		if ( sent ) begin
			 			state <= WAIT;
			 		end
			 		else begin
			 			state <= COMMAND;
			 		end
			 	end

			 	WAIT:begin
					if      ( cnt_comm < COMM_INIT  && !cnt_8 ) begin
			 			state <= COMMAND;
			 		end
			 		else if ( cnt_comm == 0 ) begin
			 			state <= DONE;
			 		end
			 		else begin
			 			state <= WAIT;
			 		end
			 	end

        DONE:begin
          status <= IDLE;
        end

			 	default: begin
			 	   state <= IDLE;
			 	end

			endcase
		end
	end


	always @( * )begin
		if (!rst) begin
      r_comm_array_sent = LOW;
    	r_send            = LOW;
    	r_cs              = HIGH;
    	r_dc              = HIGH;
		end

		else begin
			case(state)
			 	IDLE:begin
          r_comm_array_sent = LOW;
        	r_send            = LOW;
        	r_cs              = HIGH;
        	r_dc              = HIGH;
			 	end

			 	COMM_DATA:begin
					r_comm_ena = ON;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = OFF;

					r_reset    = HIGH;
					r_send     = HIGH;
					r_data     = ini_commands[cnt_comm-1];
					r_cs       = LOW;
					r_dc       = ini_commands[cnt_comm-1][8];
			 	end

			 	WAIT:begin
					r_comm_ena = OFF;
					r_rst_ena  = OFF;
					r_15_ena   = OFF;
					r_8_ena    = ON;

					r_reset    = HIGH;
					r_send     = LOW;
					r_data     = NO_DATA;
					r_cs       = LOW;
					r_dc       = ini_commands[cnt_comm][8];;
			 	end

			 	default: begin
          r_comm_ena = OFF;
          r_rst_ena  = OFF;
          r_15_ena   = OFF;
          r_8_ena    = OFF;

          r_reset    = HIGH;
          r_send     = LOW;
          r_data     = NO_DATA;
          r_cs       = HIGH;
          r_dc       = HIGH;
			 	end

			endcase
		end
	end

	assign reset = r_reset;
	assign send  = r_send;
	assign data  = r_data;
	assign cs    = r_cs;
	assign dc    = r_dc;


endmodule
`endif
