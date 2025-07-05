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
  sleep time_between_chords
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
  sleep time_between_chords
end

def play_melody_A # Generates the section A melody.
  play_pattern_timed [:d3, :d4, :fs3, :gs3, :f3, :b3], [0.5, 1, 2, 0.5], amp: 0.5
end

def rand_counterpoint ()
  
end


live_loop :prueba do
  #play_dissonant_pad(2, 0.9, 2, :sine)
  #play_color_pad(2, 0.5, 2, :sine)
  #play_melody_A
end



#--------- Section A -----------

