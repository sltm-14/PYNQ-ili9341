library verilog;
use verilog.vl_types.all;
entity reset is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_reset_ena     : in     vl_logic;
        i_reset_val     : in     vl_logic;
        o_reset_sent    : out    vl_logic;
        o_reset         : out    vl_logic
    );
end reset;
