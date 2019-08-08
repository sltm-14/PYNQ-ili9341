library verilog;
use verilog.vl_types.all;
entity ili_ctrl is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_ena_btn       : in     vl_logic;
        i_resets_sent   : in     vl_logic;
        i_command_sent  : in     vl_logic;
        o_state_leds    : out    vl_logic_vector(1 downto 0);
        o_reset_ini_ena : out    vl_logic;
        o_send_comm_ena : out    vl_logic;
        o_command       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end ili_ctrl;
