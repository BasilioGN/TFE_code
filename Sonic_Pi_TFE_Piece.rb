#################################################################
# - Trabajo de Fin de Estudios
# - Conservatorio Superior de Música de Canarias
# - Author: Basilio Gómez Navarro
# - Since: 01/06/25
# - Link to repository: https://github.com/BasilioGN/TFE_code.git
#################################################################

#################################################################
#
#Title: if((this + S_P) == 1) {print "I'm an instrument!"}
#
#################################################################

# Global config
use_bpm 100 #indicates de bpm that the song will have globally.

#--------- Functions declaration ----------
def intro_pads(color, synth_to_use, duration, volume)
  use_synth synth_to_use # ojo que puede petar aquí.
  
  if color == true
    play_color_pad(duration, volume)
  else
    play_dissonant_pad(duration, volume)
  end
end

def play_color_pad(pad_duration, volume, time_between_chords, the_synth)
  use_synth the_synth #assignment of the synth to be used
  play chord(:D3, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:F3, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:A2, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:C3, :major), sustain: pad_duration, amp: volume, release: 0.5
  
end

def play_dissonant_pad(pad_duration, volume, time_between_chords, the_synth)
  use_synth the_synth #assignment of the synth to be used
  play chord(:D3, :minor), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:C3, :dim), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:B2, :dim), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play [:b3, :cs3, :e3], sustain: pad_duration, amp: (volume), release: 0.5
  
end

def play_melody_A(volume) # Generates the section A melody.
  play_pattern_timed [:d4, :d5, :fs4, :gs4, :f4, :b4], [0.5, 1, 2, 0.5], amp: volume
end

def play_melody_B(volume)
  play_pattern_timed [:d4, :e3, :g3, :f4], [0.5, 1, 2, 0.5],
    sustain: rrand(0.3, 3), cutoff: rrand(90, 130), amp: volume
  sleep 1
  play_pattern_timed [:c4, :a3, :g3, :fs4], [0.5, 1, 1, 2],
    sustain: rrand(0.3, 3), cutoff: rrand(90, 130), amp: volume
  #sleep 4
end

def rand_counterpoint(volume)
  play choose(scale(:d3, :aeolian, num_octaves: 3)),
    release: rrand(0.3, 3), cutoff: rrand(60, 130), amp: volume
  sleep rrand(0.4, 1)
end


####### MAIN LOOP ##########
live_loop :main do
  sleep 2 # Indicates that the phrase duration is 4 bars.
end
###########################

#--------- Section A -----------
live_loop :pads_A do
  sync :main
  play_dissonant_pad(2, 0.5, 2, :sine)
  #play_color_pad(2, 0.5, 2, :sine)
end

live_loop :counterpoint_A do
  stop
  sync :main
  use_synth :sine
  rand_counterpoint(0.3)
end

live_loop :melody_A do
  
  sync :main
  use_synth :winwood_lead
  play_melody_A(0.2)
  #play_melody_B(0.5)
end


