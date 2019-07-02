onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_spi_master/TB/clk
add wave -noupdate /tb_spi_master/TB/rst
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_spi_master/TB/init_btn
add wave -noupdate /tb_spi_master/TB/miso
add wave -noupdate -divider OUTPUTS
add wave -noupdate -color Gold /tb_spi_master/TB/reset
add wave -noupdate -color Gold /tb_spi_master/TB/sclk
add wave -noupdate -color Gold /tb_spi_master/TB/mosi
add wave -noupdate -color Gold /tb_spi_master/TB/dc
add wave -noupdate -color Gold /tb_spi_master/TB/cs
add wave -noupdate -divider ILI_INIT
add wave -noupdate /tb_spi_master/TB/ILI_INIT/clk
add wave -noupdate /tb_spi_master/TB/ILI_INIT/rst
add wave -noupdate /tb_spi_master/TB/ILI_INIT/ena
add wave -noupdate /tb_spi_master/TB/ILI_INIT/sent
add wave -noupdate /tb_spi_master/TB/ILI_INIT/r_comm_ena
add wave -noupdate -radix unsigned /tb_spi_master/TB/ILI_INIT/cnt_comm
add wave -noupdate /tb_spi_master/TB/ILI_INIT/r_rst_ena
add wave -noupdate -radix unsigned /tb_spi_master/TB/ILI_INIT/cnt_rst
add wave -noupdate /tb_spi_master/TB/ILI_INIT/r_15_ena
add wave -noupdate -radix unsigned /tb_spi_master/TB/ILI_INIT/cnt_15
add wave -noupdate /tb_spi_master/TB/ILI_INIT/r_8_ena
add wave -noupdate -radix unsigned /tb_spi_master/TB/ILI_INIT/cnt_8
add wave -noupdate /tb_spi_master/TB/ILI_INIT/state
add wave -noupdate /tb_spi_master/TB/ILI_INIT/cs
add wave -noupdate /tb_spi_master/TB/ILI_INIT/dc
add wave -noupdate /tb_spi_master/TB/ILI_INIT/reset
add wave -noupdate -radix hexadecimal /tb_spi_master/TB/ILI_INIT/data
add wave -noupdate /tb_spi_master/TB/ILI_INIT/send
add wave -noupdate -divider CTRL
add wave -noupdate /tb_spi_master/TB/CTRL/clk
add wave -noupdate /tb_spi_master/TB/CTRL/rst
add wave -noupdate /tb_spi_master/TB/CTRL/send
add wave -noupdate /tb_spi_master/TB/CTRL/state
add wave -noupdate -radix unsigned /tb_spi_master/TB/CTRL/count
add wave -noupdate /tb_spi_master/TB/CTRL/clk_en
add wave -noupdate /tb_spi_master/TB/CTRL/shift_en
add wave -noupdate /tb_spi_master/TB/CTRL/done
add wave -noupdate /tb_spi_master/TB/CTRL/load
add wave -noupdate /tb_spi_master/TB/CTRL/sclk
add wave -noupdate -divider SHIFTER
add wave -noupdate /tb_spi_master/TB/SHIFT/clk
add wave -noupdate /tb_spi_master/TB/SHIFT/rst
add wave -noupdate /tb_spi_master/TB/SHIFT/shift_en
add wave -noupdate -radix hexadecimal /tb_spi_master/TB/SHIFT/data_r
add wave -noupdate /tb_spi_master/TB/SHIFT/load
add wave -noupdate /tb_spi_master/TB/SHIFT/miso
add wave -noupdate -radix unsigned /tb_spi_master/TB/SHIFT/data
add wave -noupdate /tb_spi_master/TB/SHIFT/mosi
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {126 ps} 0}
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
WaveRestoreZoom {98 ps} {190 ps}
