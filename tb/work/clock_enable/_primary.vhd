library verilog;
use verilog.vl_types.all;
entity clock_enable is
    port(
        Clk_100M        : in     vl_logic;
        pb_1            : in     vl_logic;
        slow_clk_en     : out    vl_logic
    );
end clock_enable;
