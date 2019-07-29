onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/clk
add wave -noupdate -divider INPUTS
add wave -noupdate -color White /tb_spi_master/TB/init_btn
add wave -noupdate -color White /tb_spi_master/TB/miso
add wave -noupdate -divider OUTPUTS
add wave -noupdate -color {Light Blue} /tb_spi_master/TB/reset
add wave -noupdate -color {Light Blue} /tb_spi_master/TB/mosi
add wave -noupdate -color {Light Blue} /tb_spi_master/TB/sclk
add wave -noupdate -color {Light Blue} /tb_spi_master/TB/dc
add wave -noupdate -color {Light Blue} /tb_spi_master/TB/cs
add wave -noupdate -divider ILI_INIT
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/clk
add wave -noupdate -color White /tb_spi_master/TB/ILI_CTRL/i_ena_btn
add wave -noupdate -color White /tb_spi_master/TB/ILI_CTRL/i_resets_sent
add wave -noupdate -color White /tb_spi_master/TB/ILI_CTRL/i_command_sent
add wave -noupdate -color {Cornflower Blue} /tb_spi_master/TB/ILI_CTRL/state
add wave -noupdate -color Coral /tb_spi_master/TB/ILI_CTRL/o_reset_ini_ena
add wave -noupdate -color Coral /tb_spi_master/TB/ILI_CTRL/o_send_comm_ena
add wave -noupdate -color Coral -radix hexadecimal /tb_spi_master/TB/ILI_CTRL/o_command
add wave -noupdate -divider SEND_COMM
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/SEND_COMM/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/SEND_COMM/clk
add wave -noupdate -color White /tb_spi_master/TB/SEND_COMM/i_send_comm_ena
add wave -noupdate -color White /tb_spi_master/TB/SEND_COMM/i_command_sent
add wave -noupdate -color White /tb_spi_master/TB/SEND_COMM/i_command
add wave -noupdate -color White /tb_spi_master/TB/SEND_COMM/i_shift_dis
add wave -noupdate -color {Cornflower Blue} /tb_spi_master/TB/SEND_COMM/state
add wave -noupdate -color Khaki -radix unsigned /tb_spi_master/TB/SEND_COMM/cnt_comm
add wave -noupdate -color Khaki -radix unsigned /tb_spi_master/TB/SEND_COMM/cnt_8
add wave -noupdate -color Tan /tb_spi_master/TB/SEND_COMM/r_8_ena
add wave -noupdate -color Coral /tb_spi_master/TB/SEND_COMM/o_comm_array_sent
add wave -noupdate -color Coral /tb_spi_master/TB/SEND_COMM/o_send
add wave -noupdate -color Coral -radix hexadecimal /tb_spi_master/TB/SEND_COMM/o_data
add wave -noupdate -color Coral /tb_spi_master/TB/SEND_COMM/o_dc
add wave -noupdate -color Coral /tb_spi_master/TB/SEND_COMM/o_cs
add wave -noupdate -divider CTRL
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/clk
add wave -noupdate -color White /tb_spi_master/TB/CTRL/send
add wave -noupdate -color {Cornflower Blue} /tb_spi_master/TB/CTRL/state
add wave -noupdate -color Khaki -radix unsigned /tb_spi_master/TB/CTRL/count
add wave -noupdate -color Tan /tb_spi_master/TB/CTRL/clk_en
add wave -noupdate -color Coral /tb_spi_master/TB/CTRL/shift_dis
add wave -noupdate -color Coral /tb_spi_master/TB/CTRL/shift_en
add wave -noupdate -color Coral /tb_spi_master/TB/CTRL/done
add wave -noupdate -color Coral /tb_spi_master/TB/CTRL/load
add wave -noupdate -color Coral /tb_spi_master/TB/CTRL/sclk
add wave -noupdate -divider SHIFTER
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/clk
add wave -noupdate -color White /tb_spi_master/TB/SHIFT/shift_en
add wave -noupdate -color White /tb_spi_master/TB/SHIFT/load
add wave -noupdate -color White /tb_spi_master/TB/SHIFT/miso
add wave -noupdate -color White -radix unsigned /tb_spi_master/TB/SHIFT/data
add wave -noupdate -color Khaki -radix hexadecimal /tb_spi_master/TB/SHIFT/data_r
add wave -noupdate -color Coral /tb_spi_master/TB/SHIFT/mosi
add wave -noupdate -divider RST_INIT
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/RST_INIT/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/RST_INIT/clk
add wave -noupdate -color White /tb_spi_master/TB/RST_INIT/i_reset_init_ena
add wave -noupdate -color White /tb_spi_master/TB/RST_INIT/i_reset_sent
add wave -noupdate -color {Cornflower Blue} /tb_spi_master/TB/RST_INIT/state
add wave -noupdate -color Coral /tb_spi_master/TB/RST_INIT/o_reset_ena
add wave -noupdate -color Coral /tb_spi_master/TB/RST_INIT/o_reset_val
add wave -noupdate -color Coral /tb_spi_master/TB/RST_INIT/o_resets_sent
add wave -noupdate -divider RST
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/RST/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/RST/clk
add wave -noupdate -color White /tb_spi_master/TB/RST/i_reset_ena
add wave -noupdate -color White /tb_spi_master/TB/RST/i_reset_val
add wave -noupdate -color {Cornflower Blue} /tb_spi_master/TB/RST/state
add wave -noupdate -color Khaki -radix unsigned /tb_spi_master/TB/RST/cnt_15
add wave -noupdate -color Tan /tb_spi_master/TB/RST/r_15_ena
add wave -noupdate -color Coral /tb_spi_master/TB/RST/o_reset_sent
add wave -noupdate -color Coral /tb_spi_master/TB/RST/o_reset
add wave -noupdate -divider CLK_DIV
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/CLK_DIV/rst
add wave -noupdate -color {Yellow Green} /tb_spi_master/TB/CLK_DIV/i_clk
add wave -noupdate -color Khaki -radix unsigned /tb_spi_master/TB/CLK_DIV/counter
add wave -noupdate -color Coral /tb_spi_master/TB/CLK_DIV/o_clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {722749 ps} 0}
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
WaveRestoreZoom {722673 ps} {722825 ps}
