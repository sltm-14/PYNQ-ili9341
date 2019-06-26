library verilog;
use verilog.vl_types.all;
entity clk_divider is
    generic(
        FRECUENCY_IN    : integer := 125000000;
        FRECUENCY_OUT   : integer := 10000000;
        COUNT_LENGTH    : vl_notype
    );
    port(
        i_rst           : in     vl_logic;
        i_clk_FPGA      : in     vl_logic;
        o_clk           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FRECUENCY_IN : constant is 1;
    attribute mti_svvh_generic_type of FRECUENCY_OUT : constant is 1;
    attribute mti_svvh_generic_type of COUNT_LENGTH : constant is 3;
end clk_divider;
