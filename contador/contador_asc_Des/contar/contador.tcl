
########## Tcl recorder starts at 12/08/18 10:57:02 ##########

set version "2.0"
set proj_dir "C:/ispLEVER_Classic2_0/proyectos/contar"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 10:57:02 ###########


########## Tcl recorder starts at 12/08/18 11:01:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:01:37 ###########


########## Tcl recorder starts at 12/08/18 11:02:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"../contador/contador.vhd\" -o \"contador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:02:02 ###########


########## Tcl recorder starts at 12/08/18 11:04:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:04:27 ###########


########## Tcl recorder starts at 12/08/18 11:04:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:04:37 ###########


########## Tcl recorder starts at 12/08/18 11:06:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:06:05 ###########


########## Tcl recorder starts at 12/08/18 11:06:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:06:27 ###########


########## Tcl recorder starts at 12/08/18 11:06:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:06:49 ###########


########## Tcl recorder starts at 12/08/18 11:06:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:06:56 ###########


########## Tcl recorder starts at 12/08/18 11:08:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:08:29 ###########


########## Tcl recorder starts at 12/08/18 11:11:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:11:45 ###########


########## Tcl recorder starts at 12/08/18 11:11:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v1.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v1
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v1
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v1
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v1 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v1.edi\" -out \"contador_v1.bl0\" -err automake.err -log \"contador_v1.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:11:49 ###########


########## Tcl recorder starts at 12/08/18 11:17:29 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador_v1.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador_v1.bl1\" -o \"contador.bl2\" -omod contador_v1 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:17:29 ###########


########## Tcl recorder starts at 12/08/18 11:33:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:33:21 ###########


########## Tcl recorder starts at 12/08/18 11:33:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:33:40 ###########


########## Tcl recorder starts at 12/08/18 11:33:43 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v1.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v1.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v1
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v1
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v1
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v1 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v1.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v1.edi\" -out \"contador_v1.bl0\" -err automake.err -log \"contador_v1.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:33:43 ###########


########## Tcl recorder starts at 12/08/18 11:34:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:34:10 ###########


########## Tcl recorder starts at 12/08/18 11:34:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:34:22 ###########


########## Tcl recorder starts at 12/08/18 11:34:27 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:34:27 ###########


########## Tcl recorder starts at 12/08/18 11:53:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:53:45 ###########


########## Tcl recorder starts at 12/08/18 11:56:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:56:50 ###########


########## Tcl recorder starts at 12/08/18 11:57:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:57:23 ###########


########## Tcl recorder starts at 12/08/18 11:57:28 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:57:28 ###########


########## Tcl recorder starts at 12/08/18 11:58:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:58:03 ###########


########## Tcl recorder starts at 12/08/18 11:58:17 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 11:58:17 ###########


########## Tcl recorder starts at 12/08/18 12:00:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:00:07 ###########


########## Tcl recorder starts at 12/08/18 12:00:09 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:00:09 ###########


########## Tcl recorder starts at 12/08/18 12:00:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:00:46 ###########


########## Tcl recorder starts at 12/08/18 12:00:48 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:00:48 ###########


########## Tcl recorder starts at 12/08/18 12:01:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:01:09 ###########


########## Tcl recorder starts at 12/08/18 12:01:12 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:01:12 ###########


########## Tcl recorder starts at 12/08/18 12:01:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:01:45 ###########


########## Tcl recorder starts at 12/08/18 12:01:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:01:49 ###########


########## Tcl recorder starts at 12/08/18 12:02:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:02:37 ###########


########## Tcl recorder starts at 12/08/18 12:10:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:10:28 ###########


########## Tcl recorder starts at 12/08/18 12:12:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:12:22 ###########


########## Tcl recorder starts at 12/08/18 12:12:27 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:12:27 ###########


########## Tcl recorder starts at 12/08/18 12:12:56 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:12:56 ###########


########## Tcl recorder starts at 12/08/18 12:13:03 ##########

# Commands to make the Process: 
# Chip Report
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:13:03 ###########


########## Tcl recorder starts at 12/08/18 12:13:05 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:13:05 ###########


########## Tcl recorder starts at 12/08/18 12:13:23 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:13:23 ###########


########## Tcl recorder starts at 12/08/18 12:15:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:15:32 ###########


########## Tcl recorder starts at 12/08/18 12:15:37 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:15:37 ###########


########## Tcl recorder starts at 12/08/18 12:16:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:16:26 ###########


########## Tcl recorder starts at 12/08/18 12:22:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:22:18 ###########


########## Tcl recorder starts at 12/08/18 12:22:24 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:22:24 ###########


########## Tcl recorder starts at 12/08/18 12:23:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:23:13 ###########


########## Tcl recorder starts at 12/08/18 12:23:17 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:23:17 ###########


########## Tcl recorder starts at 12/08/18 12:25:44 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:25:44 ###########


########## Tcl recorder starts at 12/08/18 12:25:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:25:49 ###########


########## Tcl recorder starts at 12/08/18 12:27:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:27:37 ###########


########## Tcl recorder starts at 12/08/18 12:27:39 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:27:39 ###########


########## Tcl recorder starts at 12/08/18 12:28:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:28:12 ###########


########## Tcl recorder starts at 12/08/18 12:28:13 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:28:13 ###########


########## Tcl recorder starts at 12/08/18 12:28:42 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:28:42 ###########


########## Tcl recorder starts at 12/08/18 12:39:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:39:16 ###########


########## Tcl recorder starts at 12/08/18 12:39:19 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:39:19 ###########


########## Tcl recorder starts at 12/08/18 12:39:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:39:54 ###########


########## Tcl recorder starts at 12/08/18 12:39:55 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:39:55 ###########


########## Tcl recorder starts at 12/08/18 12:40:11 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:40:11 ###########


########## Tcl recorder starts at 12/08/18 12:40:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:40:40 ###########


########## Tcl recorder starts at 12/08/18 12:40:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:40:50 ###########


########## Tcl recorder starts at 12/08/18 12:41:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:41:04 ###########


########## Tcl recorder starts at 12/08/18 12:41:22 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:41:22 ###########


########## Tcl recorder starts at 12/08/18 12:41:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:41:43 ###########


########## Tcl recorder starts at 12/08/18 12:41:45 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:41:45 ###########


########## Tcl recorder starts at 12/08/18 12:43:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:43:40 ###########


########## Tcl recorder starts at 12/08/18 12:43:44 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:43:44 ###########


########## Tcl recorder starts at 12/08/18 12:44:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:44:31 ###########


########## Tcl recorder starts at 12/08/18 12:44:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:44:55 ###########


########## Tcl recorder starts at 12/08/18 12:44:57 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v2.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v2
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v2
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v2
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v2 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v2.edi\" -out \"contador_v2.bl0\" -err automake.err -log \"contador_v2.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:44:57 ###########


########## Tcl recorder starts at 12/08/18 12:45:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:45:28 ###########


########## Tcl recorder starts at 12/08/18 12:45:34 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v2.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v2
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v2
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v2
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v2 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v2.edi\" -out \"contador_v2.bl0\" -err automake.err -log \"contador_v2.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:45:34 ###########


########## Tcl recorder starts at 12/08/18 12:46:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:46:13 ###########


########## Tcl recorder starts at 12/08/18 12:46:15 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v2.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v2
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v2
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v2
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v2 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v2.edi\" -out \"contador_v2.bl0\" -err automake.err -log \"contador_v2.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:46:15 ###########


########## Tcl recorder starts at 12/08/18 12:46:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:46:59 ###########


########## Tcl recorder starts at 12/08/18 12:47:01 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador_v2.cmd w} rspFile] {
	puts stderr "Cannot create response file contador_v2.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador_v2
WORKING_PATH: \"$proj_dir\"
MODULE: contador_v2
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador_v2
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador_v2 -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador_v2.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador_v2.edi\" -out \"contador_v2.bl0\" -err automake.err -log \"contador_v2.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:47:01 ###########


########## Tcl recorder starts at 12/08/18 12:47:53 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador_v2.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador_v2.bl1\" -o \"contador.bl2\" -omod contador_v2 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:47:53 ###########


########## Tcl recorder starts at 12/08/18 12:48:02 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:48:02 ###########


########## Tcl recorder starts at 12/08/18 12:53:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:53:53 ###########


########## Tcl recorder starts at 12/08/18 12:53:57 ##########

# Commands to make the Process: 
# Compiled Equations
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"contador.bl0\" -o \"contador.eq0\" -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:53:57 ###########


########## Tcl recorder starts at 12/08/18 12:54:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:54:45 ###########


########## Tcl recorder starts at 12/08/18 12:54:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:54:49 ###########


########## Tcl recorder starts at 12/08/18 12:55:36 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:55:36 ###########


########## Tcl recorder starts at 12/08/18 12:56:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:56:14 ###########


########## Tcl recorder starts at 12/08/18 12:57:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:57:21 ###########


########## Tcl recorder starts at 12/08/18 12:57:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:57:25 ###########


########## Tcl recorder starts at 12/08/18 12:57:30 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:57:30 ###########


########## Tcl recorder starts at 12/08/18 12:59:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:59:40 ###########


########## Tcl recorder starts at 12/08/18 12:59:42 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 12:59:42 ###########


########## Tcl recorder starts at 12/08/18 13:00:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:00:18 ###########


########## Tcl recorder starts at 12/08/18 13:03:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:03:52 ###########


########## Tcl recorder starts at 12/08/18 13:03:55 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:03:55 ###########


########## Tcl recorder starts at 12/08/18 13:05:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:05:36 ###########


########## Tcl recorder starts at 12/08/18 13:05:40 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:05:40 ###########


########## Tcl recorder starts at 12/08/18 13:05:56 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:05:56 ###########


########## Tcl recorder starts at 12/08/18 13:08:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:08:19 ###########


########## Tcl recorder starts at 12/08/18 13:08:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:08:23 ###########


########## Tcl recorder starts at 12/08/18 13:08:40 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:08:40 ###########


########## Tcl recorder starts at 12/08/18 13:09:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"codificador.vhd\" -o \"codificador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:09:57 ###########


########## Tcl recorder starts at 12/08/18 13:11:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"codificador.vhd\" -o \"codificador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:11:36 ###########


########## Tcl recorder starts at 12/08/18 13:13:06 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"codificador.vhd\" -o \"codificador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:13:06 ###########


########## Tcl recorder starts at 12/08/18 13:17:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"codificador.vhd\" -o \"codificador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:17:53 ###########


########## Tcl recorder starts at 12/08/18 13:18:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"codificador.vhd\" -o \"codificador.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:18:22 ###########


########## Tcl recorder starts at 12/08/18 13:18:28 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open displays.cmd w} rspFile] {
	puts stderr "Cannot create response file displays.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: displays
WORKING_PATH: \"$proj_dir\"
MODULE: displays
VHDL_FILE_LIST: codificador.vhd
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"displays.edi\" -out \"displays.bl0\" -err automake.err -log \"displays.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:18:28 ###########


########## Tcl recorder starts at 12/08/18 13:18:53 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:18:53 ###########


########## Tcl recorder starts at 12/08/18 13:31:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:31:35 ###########


########## Tcl recorder starts at 12/08/18 13:31:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:31:54 ###########


########## Tcl recorder starts at 12/08/18 13:33:08 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:33:08 ###########


########## Tcl recorder starts at 12/08/18 13:33:11 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:33:11 ###########


########## Tcl recorder starts at 12/08/18 13:33:29 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:33:29 ###########


########## Tcl recorder starts at 12/08/18 13:34:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:34:25 ###########


########## Tcl recorder starts at 12/08/18 13:34:37 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:34:37 ###########


########## Tcl recorder starts at 12/08/18 13:34:52 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 13:34:52 ###########


########## Tcl recorder starts at 12/08/18 14:35:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:35:03 ###########


########## Tcl recorder starts at 12/08/18 14:35:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:35:48 ###########


########## Tcl recorder starts at 12/08/18 14:36:12 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:36:12 ###########


########## Tcl recorder starts at 12/08/18 14:36:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:36:23 ###########


########## Tcl recorder starts at 12/08/18 14:39:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:39:03 ###########


########## Tcl recorder starts at 12/08/18 14:41:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:41:11 ###########


########## Tcl recorder starts at 12/08/18 14:41:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:41:45 ###########


########## Tcl recorder starts at 12/08/18 14:41:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:41:49 ###########


########## Tcl recorder starts at 12/08/18 14:42:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:42:55 ###########


########## Tcl recorder starts at 12/08/18 14:43:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:43:40 ###########


########## Tcl recorder starts at 12/08/18 14:43:43 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open cont_updown.cmd w} rspFile] {
	puts stderr "Cannot create response file cont_updown.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: cont_updown
WORKING_PATH: \"$proj_dir\"
MODULE: cont_updown
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: cont_updown
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e cont_updown -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete cont_updown.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"cont_updown.edi\" -out \"cont_updown.bl0\" -err automake.err -log \"cont_updown.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:43:43 ###########


########## Tcl recorder starts at 12/08/18 14:44:18 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"cont_updown.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"cont_updown.bl1\" -o \"contador.bl2\" -omod cont_updown -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:44:18 ###########


########## Tcl recorder starts at 12/08/18 14:44:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:44:47 ###########


########## Tcl recorder starts at 12/08/18 14:44:50 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:44:50 ###########


########## Tcl recorder starts at 12/08/18 14:45:15 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:45:15 ###########


########## Tcl recorder starts at 12/08/18 14:45:25 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:45:25 ###########


########## Tcl recorder starts at 12/08/18 14:46:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:46:27 ###########


########## Tcl recorder starts at 12/08/18 14:48:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:48:16 ###########


########## Tcl recorder starts at 12/08/18 14:48:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:48:21 ###########


########## Tcl recorder starts at 12/08/18 14:48:27 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:48:27 ###########


########## Tcl recorder starts at 12/08/18 14:48:44 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:48:44 ###########


########## Tcl recorder starts at 12/08/18 14:50:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:50:58 ###########


########## Tcl recorder starts at 12/08/18 14:51:01 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:51:01 ###########


########## Tcl recorder starts at 12/08/18 14:51:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:51:41 ###########


########## Tcl recorder starts at 12/08/18 14:51:43 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:51:43 ###########


########## Tcl recorder starts at 12/08/18 14:52:03 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:52:03 ###########


########## Tcl recorder starts at 12/08/18 14:53:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:53:13 ###########


########## Tcl recorder starts at 12/08/18 14:53:23 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:53:23 ###########


########## Tcl recorder starts at 12/08/18 14:54:18 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:54:18 ###########


########## Tcl recorder starts at 12/08/18 14:55:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:55:35 ###########


########## Tcl recorder starts at 12/08/18 14:55:39 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:55:39 ###########


########## Tcl recorder starts at 12/08/18 14:57:53 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 14:57:53 ###########


########## Tcl recorder starts at 12/08/18 15:07:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:07:34 ###########


########## Tcl recorder starts at 12/08/18 15:07:38 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:07:38 ###########


########## Tcl recorder starts at 12/08/18 15:07:59 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:07:59 ###########


########## Tcl recorder starts at 12/08/18 15:11:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:11:02 ###########


########## Tcl recorder starts at 12/08/18 15:11:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:11:42 ###########


########## Tcl recorder starts at 12/08/18 15:11:51 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:11:51 ###########


########## Tcl recorder starts at 12/08/18 15:12:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:12:26 ###########


########## Tcl recorder starts at 12/08/18 15:12:35 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:12:35 ###########


########## Tcl recorder starts at 12/08/18 15:13:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:13:40 ###########


########## Tcl recorder starts at 12/08/18 15:13:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:13:58 ###########


########## Tcl recorder starts at 12/08/18 15:14:09 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:14:09 ###########


########## Tcl recorder starts at 12/08/18 15:16:24 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:16:24 ###########


########## Tcl recorder starts at 12/08/18 15:27:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:27:21 ###########


########## Tcl recorder starts at 12/08/18 15:27:25 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:27:25 ###########


########## Tcl recorder starts at 12/08/18 15:47:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:47:28 ###########


########## Tcl recorder starts at 12/08/18 15:47:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:47:42 ###########


########## Tcl recorder starts at 12/08/18 15:48:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:48:03 ###########


########## Tcl recorder starts at 12/08/18 15:50:03 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:50:03 ###########


########## Tcl recorder starts at 12/08/18 15:50:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:50:58 ###########


########## Tcl recorder starts at 12/08/18 15:51:21 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:51:21 ###########


########## Tcl recorder starts at 12/08/18 15:51:40 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:51:40 ###########


########## Tcl recorder starts at 12/08/18 15:53:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:53:45 ###########


########## Tcl recorder starts at 12/08/18 15:54:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:54:03 ###########


########## Tcl recorder starts at 12/08/18 15:54:08 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:54:08 ###########


########## Tcl recorder starts at 12/08/18 15:54:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:54:43 ###########


########## Tcl recorder starts at 12/08/18 15:54:45 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:54:45 ###########


########## Tcl recorder starts at 12/08/18 15:55:07 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 15:55:07 ###########


########## Tcl recorder starts at 12/08/18 16:07:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:07:43 ###########


########## Tcl recorder starts at 12/08/18 16:07:49 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:07:49 ###########


########## Tcl recorder starts at 12/08/18 16:08:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:08:24 ###########


########## Tcl recorder starts at 12/08/18 16:08:26 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:08:26 ###########


########## Tcl recorder starts at 12/08/18 16:08:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:08:49 ###########


########## Tcl recorder starts at 12/08/18 16:08:55 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:08:55 ###########


########## Tcl recorder starts at 12/08/18 16:09:23 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:09:23 ###########


########## Tcl recorder starts at 12/08/18 16:10:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:10:14 ###########


########## Tcl recorder starts at 12/08/18 16:10:22 ##########

# Commands to make the Process: 
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:10:22 ###########


########## Tcl recorder starts at 12/08/18 16:10:43 ##########

# Commands to make the Process: 
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:10:43 ###########


########## Tcl recorder starts at 12/08/18 16:13:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:13:30 ###########


########## Tcl recorder starts at 12/08/18 16:14:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:14:41 ###########


########## Tcl recorder starts at 12/08/18 16:14:44 ##########

# Commands to make the Process: 
# Create Fuse Map
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/08/18 16:14:44 ###########


########## Tcl recorder starts at 05/27/19 08:49:46 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:49:46 ###########


########## Tcl recorder starts at 05/27/19 08:51:22 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:51:22 ###########


########## Tcl recorder starts at 05/27/19 08:51:30 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
# Compile EDIF File
if [catch {open contador.cmd w} rspFile] {
	puts stderr "Cannot create response file contador.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: contador.sty
PROJECT: contador
WORKING_PATH: \"$proj_dir\"
MODULE: contador
VHDL_FILE_LIST: contar.vhd
OUTPUT_FILE_NAME: contador
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e contador -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete contador.cmd
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"contador.edi\" -out \"contador.bl0\" -err automake.err -log \"contador.log\" -prj contador -lib \"$install_dir/ispcpld/dat/mach.edn\" -cvt YES -net_Vcc VCC -net_GND GND -nbx -dse -tlw"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:51:30 ###########


########## Tcl recorder starts at 05/27/19 08:52:15 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
# Create Fuse Map
if [runCmd "\"$cpld_bin/iblifopt\" \"contador.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"contador.bl1\" -o \"contador.bl2\" -omod contador -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" contador.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" contador.bl3 -pla -o contador.tt2 -dev p22v10g -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" contador.tt2 -dev p22v10g -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" contador.tt3 -dev p22v10g -o contador.jed -ivec NoInput.tmv -rep contador.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj contador -if contador.jed -j2s -log contador.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:52:15 ###########


########## Tcl recorder starts at 05/27/19 08:52:22 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
# Linked Equations
if [runCmd "\"$cpld_bin/blif2eqn\" \"contador.bl2\" -o \"contador.eq2\" -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:52:22 ###########


########## Tcl recorder starts at 05/27/19 08:52:50 ##########

set version "2.0"
set proj_dir "C:/Users/USUARIO/Desktop/escuela 2019/Sistemas/programas/contador/contador_asc_Des/contar"
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
if [runCmd "\"$cpld_bin/vhd2jhd\" \"contar.vhd\" -o \"contar.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/27/19 08:52:50 ###########

