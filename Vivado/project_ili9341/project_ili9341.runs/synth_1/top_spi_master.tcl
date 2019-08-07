# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Carem/ILI9341/ILI9341/Pynq-ili9341/Vivado/project_ili9341/project_ili9341.cache/wt [current_project]
set_property parent.project_path C:/Carem/ILI9341/ILI9341/Pynq-ili9341/Vivado/project_ili9341/project_ili9341.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_output_repo c:/Carem/ILI9341/ILI9341/Pynq-ili9341/Vivado/project_ili9341/project_ili9341.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/clk_divider.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/pkg_ili9341.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/ili_ctrl.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/pkg_loop.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/reset.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/reset_init.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/send_command.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/spi_ctrl.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/spi_shift.sv
  C:/Carem/ILI9341/ILI9341/Pynq-ili9341/src/top_spi_master.sv
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Carem/ILI9341/ILI9341/Pynq-ili9341/Vivado/project_ili9341/project_ili9341.srcs/constrs_1/imports/BOARD_PYNQ_Z2/pynq-z2_v1.0.xdc
set_property used_in_implementation false [get_files C:/Carem/ILI9341/ILI9341/Pynq-ili9341/Vivado/project_ili9341/project_ili9341.srcs/constrs_1/imports/BOARD_PYNQ_Z2/pynq-z2_v1.0.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top_spi_master -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_spi_master.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_spi_master_utilization_synth.rpt -pb top_spi_master_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
