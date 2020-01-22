variable config_ip_repo
variable config_ip_vlnv
variable config_ip_bytes_in
variable config_ip_bytes_out

# IP repositories; use absolute paths or relative to the
# platform/overlay/bitstream folder
set config_ip_repo ../../../ip
# VLNV of the IP block
set config_ip_vlnv xilinx.com:hls:resize_accel:1.0
# width of the AXI stream into the IP, in bytes
set config_ip_bytes_in 3
# width of the AXI stream out of the IP, in bytes
set config_ip_bytes_out 3
