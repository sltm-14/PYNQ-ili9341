library verilog;
use verilog.vl_types.all;
entity reset_init is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_reset_init_ena: in     vl_logic;
        i_reset_sent    : in     vl_logic;
        o_reset_ena     : out    vl_logic;
        o_reset_val     : out    vl_logic;
        o_resets_sent   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end reset_init;
