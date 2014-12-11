

#load function arguments passed from Matlab
set  file_name ""
append file_name ".metadata/configuration_parameters_matlab_interface.dat"
set fp [open $file_name r]
set file_data [read $fp]
close $fp
set data [split $file_data "\n"]

set r_project_name [lindex $data 1]

set new_num_input_vectors [lindex $data 3]
set new_num_output_vectors [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 1]]
set new_input_vectors {}
set new_input_vectors_length {}
set new_input_vectors_type {}
set new_input_vectors_integer_length {}
set new_input_vectors_fraction_length {}
set new_output_vectors {}
set new_output_vectors_length {}
set new_output_vectors_type {}
set new_output_vectors_integer_length {}
set new_output_vectors_fraction_length {}

for {set i 0} {$i < $new_num_input_vectors} {incr i} {
	lappend new_input_vectors [lindex $data [expr 4 + ($i * 5)]]
	lappend new_input_vectors_length [lindex $data [expr 5 + ($i * 5)]]
	lappend new_input_vectors_type [lindex $data [expr 6 + ($i * 5)]]
	lappend new_input_vectors_integer_length [lindex $data [expr 7 + ($i * 5)]]
	lappend new_input_vectors_fraction_length [lindex $data [expr 8 + ($i * 5)]]
}
for {set i 0} {$i < $new_num_output_vectors} {incr i} {
	lappend new_output_vectors [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 2 + ($i * 5)]]
	lappend new_output_vectors_length [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 3 + ($i * 5)]]
	lappend new_output_vectors_type [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 4 + ($i * 5)]]
	lappend new_output_vectors_integer_length [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 5 + ($i * 5)]]
	lappend new_output_vectors_fraction_length [lindex $data [expr ($new_num_input_vectors * 5) + 4 + 6 + ($i * 5)]]
}

set new_fclk [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 2]] 
set new_FPGA_name [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 4]] 
set new_board_name [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 6]] 
set new_type_eth [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 8]] 
set new_mem_base_address [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 10]] 
set new_num_test [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 12]] 
set new_type_test [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 14]] 
set new_type_template [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 16]]
set new_type_design_flow [lindex $data [expr ($new_num_input_vectors * 5) + ($new_num_output_vectors * 5) + 5 + 18]]


	set  file_name ""
	append file_name ".metadata/" $r_project_name "_configuration_parameters.dat"
	
	if {$r_project_name == {}} {
	
			error " -E- NO project name specified. Use the -usage option for more details."
			
		} else {
	
		if {[file exists $file_name] == 0} { 

			set tmp_error ""
			append tmp_error "-E- " $r_project_name " does NOT exist. Use the -usage option for more details."
			error $tmp_error
			
		} else {



		set  file_name ""
		append file_name ".metadata/" $r_project_name "_configuration_parameters.dat"
		set fp [open $file_name r]
		set file_data [read $fp]
		close $fp
		set data [split $file_data "\n"]


		set old_num_input_vectors [lindex $data 3]
		set old_num_output_vectors [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 1]]
		set old_input_vectors {}
		set old_input_vectors_length {}
		set old_input_vectors_type {}
		set old_input_vectors_integer_length {}
		set old_input_vectors_fraction_length {}
		set old_output_vectors {}
		set old_output_vectors_length {}
		set old_output_vectors_type {}
		set old_output_vectors_integer_length {}
		set old_output_vectors_fraction_length {}

		for {set i 0} {$i < $old_num_input_vectors} {incr i} {
			lappend old_input_vectors [lindex $data [expr 4 + ($i * 5)]]
			lappend old_input_vectors_length [lindex $data [expr 5 + ($i * 5)]]
			lappend old_input_vectors_type [lindex $data [expr 6 + ($i * 5)]]
			lappend old_input_vectors_integer_length [lindex $data [expr 7 + ($i * 5)]]
			lappend old_input_vectors_fraction_length [lindex $data [expr 8 + ($i * 5)]]
		}
		for {set i 0} {$i < $old_num_output_vectors} {incr i} {
			lappend old_output_vectors [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 2 + ($i * 5)]]
			lappend old_output_vectors_length [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 3 + ($i * 5)]]
			lappend old_output_vectors_type [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 4 + ($i * 5)]]
			lappend old_output_vectors_integer_length [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 5 + ($i * 5)]]
			lappend old_output_vectors_fraction_length [lindex $data [expr ($old_num_input_vectors * 5) + 4 + 6 + ($i * 5)]]
		}

		set old_fclk [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 2]] 
		set old_FPGA_name [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 4]] 
		set old_board_name [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 6]] 
		set old_type_eth [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 8]] 
		set old_mem_base_address [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 10]] 
		set old_num_test [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 12]] 
		set old_type_test [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 14]] 
		set old_type_template [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 16]]
		set old_type_design_flow [lindex $data [expr ($old_num_input_vectors * 5) + ($old_num_output_vectors * 5) + 5 + 18]]

			# update configuration parameters
			set m 0
			foreach i $old_input_vectors_type {
				if {$i==1} {
					set old_input_vectors_type [lreplace $old_input_vectors_type $m $m "fix"]
				} else {
					set old_input_vectors_type [lreplace $old_input_vectors_type $m $m "float"]
				}
				incr m
			}
			set m 0
			foreach i $old_output_vectors_type {
				if {$i==1} {
					set old_output_vectors_type [lreplace $old_output_vectors_type $m $m "fix"]
				} else {
					set old_output_vectors_type [lreplace $old_output_vectors_type $m $m "float"]
				}
				incr m
			}
					
			# update configuration parameters
			set m 0
			foreach i $new_input_vectors_type {
				if {$i==1} {
					set new_input_vectors_type [lreplace $new_input_vectors_type $m $m "fix"]
				} else {
					set new_input_vectors_type [lreplace $new_input_vectors_type $m $m "float"]
				}
				incr m
			}
			set m 0
			foreach i $new_output_vectors_type {
				if {$i==1} {
					set new_output_vectors_type [lreplace $new_output_vectors_type $m $m "fix"]
				} else {
					set new_output_vectors_type [lreplace $new_output_vectors_type $m $m "float"]
				}
				incr m
			}

		 
			
		
			if {$old_type_eth==0} {
				set type_eth "udp"
			} elseif {$old_type_eth==1} {
				set type_eth "tcp"
			}
			
			
			
			
			if {$new_FPGA_name == {}} {
				set FPGA_name $old_FPGA_name
			} else {
				set FPGA_name $new_FPGA_name
			}
			if {$new_fclk == {}} {
				set fclk $old_fclk
			} else {
				set fclk $new_fclk
			}
			
			set m 0
			foreach i $new_input_vectors {
				set position [lsearch -exact $old_input_vectors $i]
				puts $position
				if {$position !=-1} {
					set old_input_vectors [lreplace $old_input_vectors $position $position $i]
					set old_input_vectors_length [lreplace $old_input_vectors_length $position $position [lindex $new_input_vectors_length $m]]
					set old_input_vectors_type [lreplace $old_input_vectors_type $position $position [lindex $new_input_vectors_type $m]]
					set old_input_vectors_integer_length [lreplace $old_input_vectors_integer_length $position $position [lindex $new_input_vectors_integer_length $m]]
					set old_input_vectors_fraction_length [lreplace $old_input_vectors_fraction_length $position $position [lindex $new_input_vectors_fraction_length $m]]	
				} else {
				
					set tmp_error ""
					append tmp_error " -E- NO input vector " $i " found. Use the -usage option for more details."
					error $tmp_error

				}
				
				incr m
			}
			set m 0
			foreach i $new_output_vectors {
				set position [lsearch -exact $old_output_vectors $i]
				if {$position !=-1} {
					set old_output_vectors [lreplace $old_output_vectors $position $position $i]
					set old_output_vectors_length [lreplace $old_output_vectors_length $position $position [lindex $new_output_vectors_length $m]]
					set old_output_vectors_type [lreplace $old_output_vectors_type $position $position [lindex $new_output_vectors_type $m]]
					set old_output_vectors_integer_length [lreplace $old_output_vectors_integer_length $position $position [lindex $new_output_vectors_integer_length $m]]
					set old_output_vectors_fraction_length [lreplace $old_output_vectors_fraction_length $position $position [lindex $new_output_vectors_fraction_length $m]]	
				} else {
				
					set tmp_error ""
					append tmp_error " -E- NO output vector " $i " found. Use the -usage option for more details."
					error $tmp_error
				}
				incr m
			}
			
			set input_vectors $old_input_vectors 
			set input_vectors_length $old_input_vectors_length 
			set input_vectors_type $old_input_vectors_type 
			set input_vectors_integer_length $old_input_vectors_integer_length 
			set input_vectors_fraction_length $old_input_vectors_fraction_length 
			set output_vectors $old_output_vectors
			set output_vectors_length $old_output_vectors_length 
			set output_vectors_type $old_output_vectors_type 
			set output_vectors_integer_length $old_output_vectors_integer_length 
			set output_vectors_fraction_length $old_output_vectors_fraction_length 
			
			set board_name $old_board_name 
			
			set mem_base_address $old_mem_base_address 
			set num_test $old_num_test 
			set type_test $old_type_test
			set type_design_flow $old_type_design_flow
			set type_template $old_type_template



			set str_fix "fix"
			set str_float "float"
			
			set count_is_float 0
			set count_is_fix 0
			foreach i $input_vectors_type {
				if {$i==$str_fix} {
					incr count_is_fix
				} else {
					incr count_is_float
				}
			}
			foreach i $output_vectors_type {
				if {$i==$str_fix} {
					incr count_is_fix
				} else {
					incr count_is_float
				}
			}
		
			if {$count_is_fix==[expr $old_num_input_vectors+$old_num_output_vectors] || $count_is_float==[expr $old_num_input_vectors+$old_num_output_vectors]} {

				set type_design_flow "matlab"
				tclapp::icl::protoip::make_template::make_project_configuration_parameters_dat $r_project_name $input_vectors $input_vectors_length $input_vectors_type $input_vectors_integer_length $input_vectors_fraction_length $output_vectors $output_vectors_length $output_vectors_type $output_vectors_integer_length $output_vectors_fraction_length $fclk $FPGA_name $board_name $type_eth $mem_base_address $num_test $type_test $type_template $type_design_flow
				tclapp::icl::protoip::ip_design_build -project_name $r_project_name
				
			} else {
			
				puts " -E- Inputs and Outputs must be either fixed-point or floating-point. Use the -usage option for more details."
				
			}
		}
	}

exit