library verilog;
use verilog.vl_types.all;
entity send_command is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_send_comm_ena : in     vl_logic;
        i_command_sent  : in     vl_logic;
        i_command       : in     vl_logic;
        o_comm_array_sent: out    vl_logic;
        o_send          : out    vl_logic;
        o_data          : out    vl_logic_vector;
        o_dc            : out    vl_logic;
        o_cs            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end send_command;
