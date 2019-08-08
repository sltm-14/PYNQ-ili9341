library verilog;
use verilog.vl_types.all;
entity spi_shift is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_shift_en      : in     vl_logic;
        i_load          : in     vl_logic;
        i_miso          : in     vl_logic;
        i_data          : in     vl_logic_vector;
        i_dc            : in     vl_logic;
        i_cs            : in     vl_logic;
        o_mosi          : out    vl_logic;
        o_dc            : out    vl_logic;
        o_cs            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end spi_shift;
