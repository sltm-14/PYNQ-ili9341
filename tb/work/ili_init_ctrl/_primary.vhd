library verilog;
use verilog.vl_types.all;
entity ili_init_ctrl is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ena             : in     vl_logic;
        sent            : in     vl_logic;
        cs              : out    vl_logic;
        dc              : out    vl_logic;
        reset           : out    vl_logic;
        data            : out    vl_logic_vector;
        send            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end ili_init_ctrl;
