library verilog;
use verilog.vl_types.all;
entity debounce_better_version is
    port(
        pb_1            : in     vl_logic;
        clk             : in     vl_logic;
        pb_out          : out    vl_logic
    );
end debounce_better_version;
