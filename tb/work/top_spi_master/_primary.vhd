library verilog;
use verilog.vl_types.all;
entity top_spi_master is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        miso            : in     vl_logic;
        init_btn        : in     vl_logic;
        reset           : out    vl_logic;
        mosi            : out    vl_logic;
        sclk            : out    vl_logic;
        dc              : out    vl_logic;
        cs              : out    vl_logic
    );
end top_spi_master;
