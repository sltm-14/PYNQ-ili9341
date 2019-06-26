library verilog;
use verilog.vl_types.all;
entity spi_shift is
    generic(
        DW              : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        shift_en        : in     vl_logic;
        load            : in     vl_logic;
        miso            : in     vl_logic;
        data            : in     vl_logic_vector;
        mosi            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DW : constant is 1;
end spi_shift;
