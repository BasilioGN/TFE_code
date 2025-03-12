# Welcome to Sonic Pi
use_synth :pulse

play 50, amp: 0.1, pan: -1
sleep 0.25
play 55, amp: 0.2, pan: 1
sleep 0.25
play 57, amp: 0.4, pan: -1
sleep 0.25
play 62, amp: 1, pan: 0
sleep 0.25

use_synth :prophet
play 38
sleep 0.25
play 50
sleep 0.25
play 62
sleep 0.25

use_synth :tb303
play 38
use_synth :dsaw
play 50
use_synth :prophet
play 57