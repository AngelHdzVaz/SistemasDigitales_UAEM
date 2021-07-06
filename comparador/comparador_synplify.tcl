#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file c:/users/emanu/onedrive/documentos/sistemas digitales/vhdl/comparador\comparador_synplify.tcl
#-- Written on Thu May 09 17:32:43 2019


#device options
set_option -technology NoPkgName

#compilation/mapping options

#map options

#simulation options
set_option -write_verilog false
set_option -write_vhdl false

#timing analysis options
set_option -synthesis_onoff_pragma false

#-- add_file options
add_file -vhdl -lib work "comparador.vhd"

#-- top module name
set_option -top_module comparador

#-- set result format/file last
project -result_file "comparador.edi"

#-- error message log file
project -log_file comparador.srf

#-- run Synplify with 'arrange VHDL file'
project -run
