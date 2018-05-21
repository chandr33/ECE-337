onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_line/tb_clk
add wave -noupdate /tb_line/tb_n_rst
add wave -noupdate /tb_line/tb_line_en
add wave -noupdate /tb_line/tb_reset_buffer
add wave -noupdate /tb_line/tb_line_info
add wave -noupdate /tb_line/tb_buffer_full
add wave -noupdate /tb_line/tb_line_buffer
add wave -noupdate /tb_line/tb_line_done
add wave -noupdate /tb_line/tb_w_enable
add wave -noupdate /tb_line/DUT/first_x
add wave -noupdate /tb_line/DUT/first_y
add wave -noupdate /tb_line/DUT/last_x
add wave -noupdate /tb_line/DUT/last_y
add wave -noupdate /tb_line/DUT/current_x
add wave -noupdate /tb_line/DUT/current_y
add wave -noupdate /tb_line/DUT/current_err
add wave -noupdate /tb_line/DUT/current_e_two
add wave -noupdate /tb_line/DUT/next_state
add wave -noupdate /tb_line/DUT/current_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {499247 ps} 0}
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
WaveRestoreZoom {499050 ps} {500050 ps}
