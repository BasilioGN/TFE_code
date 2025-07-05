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
use_bpm 120 #indicates de bpm that the song will have globally.

#--------- Functions declaration ----------
def intro_pads(color, synth_to_use, duration, volume)
  use_synth synth_to_use # ojo que puede petar aquí.
  
  if color == true
    play_color_pad(duration, volume)
  else
    play_dissonant_pad(duration, volume)
  end
end


def play_color_pad(pad_duration, volume, time_between_chords)
  use_synth :sine 
  play chord(:D3, :major), release: 2, amp: 0.5
  sleep time_between_chords
  play chord(:F2, :major), release: 2, amp: 0.5
  sleep time_between_chords
  play chord(:A2, :major), release: 2, amp: 0.5
  sleep time_between_chords
  play chord(:C3, :major), release: 2 , amp: 0.5
  sleep time_between_chords
end

play_color_pad(2, 2, 2)

#def play_dissonant_pad(pad_duration, volume)
#end



#--------- Section A -----------

