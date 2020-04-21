set overlay_name "resizer"
set design_name "resizer"

set config_file_path  [lindex $argv 0]
source $config_file_path

# open block design
open_project $::config_ip_project_dir/${overlay_name}.xpr
open_bd_design $::config_ip_project_dir/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd

# set up cache
if {$::config_remote_cache != ""} {
  config_ip_cache -import_from_project -use_cache_location $::config_remote_cache
}

# Add top wrapper
make_wrapper -files [get_files $::config_ip_project_dir/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse $::config_ip_project_dir/${overlay_name}.srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.v
set_property top ${design_name}_wrapper [current_fileset]
# import_files -fileset constrs_1 -norecurse ./vivado/constraints/${overlay_name}.xdc
update_compile_order -fileset sources_1

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# add hardware definition file for microblaze projects
# file mkdir ./${overlay_name}/${overlay_name}.sdk
# write_hwdef -force  -file ./${overlay_name}/${overlay_name}.sdk/${overlay_name}.hdf
# file copy -force ./${overlay_name}/${overlay_name}.sdk/${overlay_name}.hdf .

# move and rename bitstream to final location
file copy -force $::config_ip_project_dir/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit $::config_output_products_dir/${overlay_name}.bit

# copy hwh files
file copy -force $::config_ip_project_dir/${overlay_name}.srcs/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh $::config_output_products_dir/${overlay_name}.hwh

# save report
open_run synth_1 -name synth_1
report_utilization -hierarchical -hierarchical_depth 4 -file $::config_util_report_filename -format xml
