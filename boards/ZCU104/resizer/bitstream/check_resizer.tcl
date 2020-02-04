set overlay_name "resizer"
set design_name "resizer"

set config_file_path  [lindex $argv 0]
source $config_file_path

set fd [open $::config_ip_project_dir/${overlay_name}.runs/impl_1/${design_name}_wrapper_timing_summary_routed.rpt r]
set timing_met 0
while { [gets $fd line] >= 0 } {
    if [string match {All user specified timing constraints are met.} $line]  {
        set timing_met 1
        break
    }
}
if {$timing_met == 0} {
    puts "ERROR: ${overlay_name} bitstream generation does not meet timing."
    exit 1
}
puts "Timing constraints are met."
