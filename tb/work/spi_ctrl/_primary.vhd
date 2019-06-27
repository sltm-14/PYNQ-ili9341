library verilog;
use verilog.vl_types.all;
entity spi_ctrl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        send            : in     vl_logic;
        shift_dis       : out    vl_logic;
        shift_en        : out    vl_logic;
        done            : out    vl_logic;
        load            : out    vl_logic;
        sclk            : out    vl_logic
    );
end spi_ctrl;
