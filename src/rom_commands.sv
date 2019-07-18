
module rom16x4 (
  input clk,
  input  [3:0] addr,

  output [3:0] data
  );

  reg [9:0] rom [$:0];

  always @(negedge clk) begin
    data <= rom[addr];
  end

  initial begin
      rom[0]   = {LOW, LOW,  8'hCB};
      rom[1]   = {LOW, HIGH, 8'h39};
      rom[2]   = {LOW, HIGH, 8'h2C};
      rom[3]   = {LOW, HIGH, 8'h00};
      rom[4]   = {LOW, HIGH, 8'h34};
      rom[5]   = {LOW, HIGH, 8'h02};
      rom[6]   = {LOW, LOW,  8'hCF};
      rom[7]   = {LOW, HIGH, 8'h00};

      /* Power control */
      rom[8]   = {LOW, HIGH, 8'hC1};
      rom[9]   = {LOW, HIGH, 8'h30};
      rom[10]  = {LOW, LOW,  8'hE8};
      rom[11]  = {LOW, HIGH, 8'h85};
      rom[12]  = {LOW, HIGH, 8'h00};
      rom[13]  = {LOW, HIGH, 8'h78};
      rom[14]  = {LOW, LOW,  8'hEA};
      rom[15]  = {LOW, HIGH, 8'h00};
      rom[16]  = {LOW, HIGH, 8'h00};
      rom[16]  = {LOW, LOW,  8'hED};
      rom[18]  = {LOW, HIGH, 8'h64};
      rom[19]  = {LOW, HIGH, 8'h03};
      rom[20]  = {LOW, HIGH, 8'h12};
      rom[21]  = {LOW, HIGH, 8'h81};
      rom[22]  = {LOW, LOW,  8'hF7};
      rom[23]  = {LOW, HIGH, 8'h20};
      rom[24]  = {LOW, LOW,  8'hC0};
      rom[25]  = {LOW, HIGH, 8'h23};
      rom[26]  = {LOW, LOW,  8'hC1};
      rom[27]  = {LOW, HIGH, 8'h10};

      /* VCOM */
      rom[27]  = {LOW, LOW,  8'hC5}, {LOW, HIGH, 8'h3E}, {LOW, HIGH, 8'h28}, {LOW, LOW,  8'hC7}, {LOW, HIGH, 8'h86}, {LOW, LOW,  8'h36},
      {LOW, HIGH, 8'h48},

      /* Memory Access Control */
      {LOW, LOW,  8'h3A}, {LOW, HIGH, 8'h55},

      /* Frame Rate */
      {LOW, LOW,  8'hB1}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h18}, {LOW, LOW,  8'hB6}, {LOW, HIGH, 8'h08}, {LOW, HIGH, 8'h82},
      {LOW, HIGH, 8'h27}, {LOW, LOW,  8'h11},	{LOW, HIGH, 8'h29}, {LOW, LOW,  8'h2C},

      /* Ignore */
      {LOW, LOW,  8'hFF}
   end

endmodule
