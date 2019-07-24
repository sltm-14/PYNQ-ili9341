`ifndef pkg_loop
`define pkg_loop

package pkg_loop;

  /*-------------------------------------------------------------------- PARAMETERS ----------------------------------------------------------------------*/


  localparam COMM_LOOP = 11;

  logic [9:0] loop_commands [COMM_LOOP-1:0] = {

      {LOW, LOW,  8'h2A},
      {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'hf0},
      {LOW, LOW,  8'h2B},
      {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h00}, {LOW, HIGH, 8'h01}, {LOW, HIGH, 8'h40},
      {LOW, LOW,  8'h2C}
  };

endpackage
`endif
