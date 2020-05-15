variable config_ip_repo
variable config_ip_vlnv
variable config_ip_bytes_in
variable config_ip_bytes_out
variable config_ip_axis_name_in
variable config_ip_axis_name_out
variable config_ip_clk_name
variable config_ip_nrst_name
variable config_ip_use_axilite
variable config_ip_axilite_name
variable config_ip_project_dir
variable config_output_products_dir
variable config_remote_cache
variable config_util_report_filename
variable config_ip_fclk

# for arguments involving paths below: use absolute paths or relative to the
# platform/overlay/bitstream folder
# where to create the project
set config_ip_project_dir ./resizer
# IP repositories that the project depends on
set config_ip_repo ../../../ip
# where the produced bitfile and .hwh file will be placed
set config_output_products_dir ./
# where the synth util XML report will be written
set config_util_report_filename "synth_report.xml"

# non-path arguments
# VLNV of the IP block
set config_ip_vlnv xilinx.com:hls:resize_accel:1.0
# width of the AXI stream into the IP, in bytes
set config_ip_bytes_in 3
# width of the AXI stream out of the IP, in bytes
set config_ip_bytes_out 3
# the name of the input AXI stream interface
set config_ip_axis_name_in src
# the name of the output AXI stream interface
set config_ip_axis_name_out dst
# the name of the clock signal
set config_ip_clk_name ap_clk
# the name of the active-low reset signal
set config_ip_nrst_name ap_rst_n
# whether the IP needs an AXI Lite interface for control
set config_ip_use_axilite 1
# name of AXI Lite interface
set config_ip_axilite_name "s_axi_AXILiteS"
# Vivado OOC IP cache
set config_remote_cache ""
# clock frequency
set config_ip_fclk 100.0
