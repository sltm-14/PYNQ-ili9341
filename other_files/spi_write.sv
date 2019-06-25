module spi_write(
	input        clk,
	input        rst,

	input        init_btn,
	input        write_btn,
	input        idle,
	input  [7:0] data_i,

	output logic [7:0] address,
    output logic [7:0] register,
    output logic [7:0] data, 
	output             send
);

	logic [7:0] address_r;
    logic [7:0] register_r;
    logic [7:0] data_r;


	always @(posedge clk, negedge rst)begin
		if ( init_btn && idle ) begin
			address_r  <= 8'h40;
			register_r <= 8'h00;
			data_r     <= 8'h00;
		end 

		else if ( write_btn && idle ) begin
			address_r  <= 8'h40;
			register_r <= 8'h12;
			data_r     <= data_i;
		end 

		else if (!idle) begin
			address_r  <= address_r;
			register_r <= register_r;
			data_r     <= data_r;
		end

		else begin
			address_r  <= 8'h00;
			register_r <= 8'h00;
			data_r     <= 8'h00;
		end

	end

	assign address  = address_r;
	assign register = register_r;
	assign data     = data_r;

	assign send     = init_btn || write_btn;

endmodule