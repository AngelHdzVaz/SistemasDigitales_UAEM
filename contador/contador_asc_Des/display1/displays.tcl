
########## Tcl recorder starts at 12/08/18 13:21:01 ##########

set version "2.0"
set proj_dir "C:/ispLEVER_Classic2_0/proyectos/display1"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"displays.vhd\" -o \"displays.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:21:01 ###########


########## Tcl recorder starts at 12/08/18 13:21:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"displays.vhd\" -o \"displays.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:21:11 ###########


########## Tcl recorder starts at 12/08/18 13:21:15 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: displays.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:21:15 ###########


########## Tcl recorder starts at 12/08/18 13:21:32 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:21:32 ###########


########## Tcl recorder starts at 12/08/18 13:22:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:22:51 ###########


########## Tcl recorder starts at 12/08/18 13:22:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:22:54 ###########


########## Tcl recorder starts at 12/08/18 13:22:59 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:22:59 ###########


########## Tcl recorder starts at 12/08/18 13:23:14 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:23:14 ###########


########## Tcl recorder starts at 12/08/18 13:23:25 ##########

# Commands to make the Process: 
# Chip Report
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:23:25 ###########


########## Tcl recorder starts at 12/08/18 13:23:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:23:41 ###########


########## Tcl recorder starts at 12/08/18 13:23:46 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:23:46 ###########


########## Tcl recorder starts at 12/08/18 13:24:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:24:40 ###########


########## Tcl recorder starts at 12/08/18 13:24:54 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:24:54 ###########


########## Tcl recorder starts at 12/08/18 13:26:33 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:26:33 ###########


########## Tcl recorder starts at 12/08/18 13:35:35 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:35:35 ###########


########## Tcl recorder starts at 12/08/18 13:36:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:36:32 ###########


########## Tcl recorder starts at 12/08/18 13:36:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:36:41 ###########


########## Tcl recorder starts at 12/08/18 13:37:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:37:47 ###########


########## Tcl recorder starts at 12/08/18 13:37:52 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:37:52 ###########


########## Tcl recorder starts at 12/08/18 13:38:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:38:46 ###########


########## Tcl recorder starts at 12/08/18 13:38:56 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:38:56 ###########


########## Tcl recorder starts at 12/08/18 13:39:12 ##########

# Commands to make the Process: 
# Signal Cross Reference
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:39:12 ###########


########## Tcl recorder starts at 12/08/18 13:39:16 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:39:16 ###########


########## Tcl recorder starts at 12/08/18 13:39:42 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:39:42 ###########


########## Tcl recorder starts at 12/08/18 13:42:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:42:38 ###########


########## Tcl recorder starts at 12/08/18 13:43:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:43:35 ###########


########## Tcl recorder starts at 12/08/18 13:43:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:43:40 ###########


########## Tcl recorder starts at 12/08/18 13:43:57 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:43:57 ###########


########## Tcl recorder starts at 12/08/18 13:51:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:51:55 ###########


########## Tcl recorder starts at 12/08/18 13:51:59 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:51:59 ###########


########## Tcl recorder starts at 12/08/18 13:52:15 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:52:15 ###########


########## Tcl recorder starts at 12/08/18 13:53:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:53:27 ###########


########## Tcl recorder starts at 12/08/18 13:53:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:53:39 ###########


########## Tcl recorder starts at 12/08/18 13:53:43 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:53:43 ###########


########## Tcl recorder starts at 12/08/18 13:53:59 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:53:59 ###########


########## Tcl recorder starts at 12/08/18 13:54:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:54:43 ###########


########## Tcl recorder starts at 12/08/18 13:54:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:54:49 ###########


########## Tcl recorder starts at 12/08/18 13:55:44 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:55:44 ###########


########## Tcl recorder starts at 12/08/18 13:56:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:56:09 ###########


########## Tcl recorder starts at 12/08/18 13:56:10 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:56:10 ###########


########## Tcl recorder starts at 12/08/18 13:56:28 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:56:28 ###########


########## Tcl recorder starts at 12/08/18 13:59:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:59:39 ###########


########## Tcl recorder starts at 12/08/18 14:00:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:00:53 ###########


########## Tcl recorder starts at 12/08/18 14:00:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"display.vhd\" -o \"display.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:00:55 ###########


########## Tcl recorder starts at 12/08/18 14:01:04 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: displays.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: display.vhd
OUTPUT_FILE_NAME: displays
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e displays -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete displays.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj displays -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:01:04 ###########


########## Tcl recorder starts at 12/08/18 14:01:33 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"displays.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"displays.bl1\" -o \"displays.bl2\" -omod displays -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" displays.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" displays.bl3 -pla -o displays.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" displays.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" displays.tt3 -dev p22v10g -o displays.jed -ivec NoInput.tmv -rep displays.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj displays -if displays.jed -j2s -log displays.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:01:33 ###########

