library verilog;
use verilog.vl_types.all;
entity my_dff_en is
    port(
        DFF_CLOCK       : in     vl_logic;
        clock_enable    : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end my_dff_en;
