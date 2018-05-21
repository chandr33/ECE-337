onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_arc/tb_clk
add wave -noupdate /tb_arc/tb_n_rst
add wave -noupdate /tb_arc/tb_arc_en
add wave -noupdate /tb_arc/tb_arc_info
add wave -noupdate /tb_arc/tb_buffer_full
add wave -noupdate /tb_arc/tb_output_x
add wave -noupdate /tb_arc/tb_output_y
add wave -noupdate /tb_arc/tb_arc_done
add wave -noupdate /tb_arc/tb_w_enable
add wave -noupdate /tb_arc/file
add wave -noupdate -radix unsigned /tb_arc/DUT/current_number
add wave -noupdate -radix unsigned /tb_arc/DUT/start_angle
add wave -noupdate /tb_arc/DUT/current_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {71741 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {16562 ps} {213438 ps}
