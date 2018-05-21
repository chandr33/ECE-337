onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_arc/DUT/current_state
add wave -noupdate -radix decimal /tb_arc/DUT/current_x
add wave -noupdate -radix decimal /tb_arc/DUT/current_y
add wave -noupdate -radix decimal /tb_arc/DUT/d
add wave -noupdate -radix unsigned -childformat {{{/tb_arc/DUT/start_angle[8]} -radix decimal} {{/tb_arc/DUT/start_angle[7]} -radix decimal} {{/tb_arc/DUT/start_angle[6]} -radix decimal} {{/tb_arc/DUT/start_angle[5]} -radix decimal} {{/tb_arc/DUT/start_angle[4]} -radix decimal} {{/tb_arc/DUT/start_angle[3]} -radix decimal} {{/tb_arc/DUT/start_angle[2]} -radix decimal} {{/tb_arc/DUT/start_angle[1]} -radix decimal} {{/tb_arc/DUT/start_angle[0]} -radix decimal}} -subitemconfig {{/tb_arc/DUT/start_angle[8]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[7]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[6]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[5]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[4]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[3]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[2]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[1]} {-height 17 -radix decimal} {/tb_arc/DUT/start_angle[0]} {-height 17 -radix decimal}} /tb_arc/DUT/start_angle
add wave -noupdate -radix unsigned /tb_arc/DUT/end_angle
add wave -noupdate /tb_arc/DUT/next_state
add wave -noupdate -radix unsigned /tb_arc/DUT/next_start_angle
add wave -noupdate -radix unsigned /tb_arc/DUT/current_number
add wave -noupdate -radix unsigned /tb_arc/DUT/next_number
add wave -noupdate /tb_arc/tb_w_enable
add wave -noupdate -radix unsigned /tb_arc/DUT/output_x
add wave -noupdate -radix unsigned /tb_arc/DUT/output_y
add wave -noupdate -radix unsigned /tb_arc/DUT/addr_x
add wave -noupdate -radix unsigned /tb_arc/DUT/addr_y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {83539 ps} 0}
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
WaveRestoreZoom {0 ps} {360938 ps}
