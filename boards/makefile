top ?= $(shell dirname $(realpath $(filter %makefile, $(MAKEFILE_LIST))))
platform ?= Pynq-Z1
ip_config ?= $(top)/ip_config.tcl
overlay_name := resizer
design_name := resizer

design_folder := $(platform)/$(design_name)/bitstream

all: block_design bitstream check_timing
	@echo
	@tput setaf 2 ; echo "Built $(overlay_name) successfully!"; tput sgr0;
	@echo

block_design:
	cd $(design_folder); vivado -mode batch -source $(overlay_name).tcl -tclargs $(ip_config) -notrace

bitstream:
	cd $(design_folder); vivado -mode batch -source build_bitstream.tcl -notrace

check_timing:
	cd $(design_folder); vivado -mode batch -source check_$(overlay_name).tcl -notrace

clean:
	cd $(design_folder); rm -rf $(overlay_name) *.jou *.log NA
