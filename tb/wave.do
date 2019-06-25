onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_spi_master_mcp/SPI/clk
add wave -noupdate /tb_spi_master_mcp/SPI/rst
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_spi_master_mcp/SPI/miso
add wave -noupdate /tb_spi_master_mcp/SPI/init_btn
add wave -noupdate /tb_spi_master_mcp/SPI/write_btn
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/data
add wave -noupdate -divider WRITE
add wave -noupdate /tb_spi_master_mcp/SPI/WRITE/init_btn
add wave -noupdate /tb_spi_master_mcp/SPI/WRITE/write_btn
add wave -noupdate /tb_spi_master_mcp/SPI/WRITE/idle
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/WRITE/data_i
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/WRITE/address
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/WRITE/register
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/WRITE/data
add wave -noupdate /tb_spi_master_mcp/SPI/WRITE/send
add wave -noupdate -divider CTRL
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/send
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/state
add wave -noupdate -radix unsigned /tb_spi_master_mcp/SPI/CTRL/count
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/shift_en
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/done
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/cs
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/load
add wave -noupdate /tb_spi_master_mcp/SPI/CTRL/sclk
add wave -noupdate -divider SHIFTER
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/clk
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/rst
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/shift_en
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/load
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/lsb
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/SHIFT/data
add wave -noupdate /tb_spi_master_mcp/SPI/SHIFT/msb
add wave -noupdate -radix hexadecimal /tb_spi_master_mcp/SPI/SHIFT/data_r
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_spi_master_mcp/SPI/mosi
add wave -noupdate /tb_spi_master_mcp/SPI/sclk
add wave -noupdate /tb_spi_master_mcp/SPI/cs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {147 ps}
