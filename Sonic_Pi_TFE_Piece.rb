#################################################################
# - Trabajo de Fin de Estudios
# - Conservatorio Superior de Música de Canarias
# - Author: Basilio Gómez Navarro
# - Since: 01/06/25
# - Link to repository: https://github.com/BasilioGN/TFE_code.git
#################################################################

# Global config
use_bpm 120 #indicates de bpm that the song will have globally.

#--------- Section A -----------

def play_legato_note(note_value, duration)
  release_duration = duration
  if duration < 1
    release_duration = 1
  end
  
  play note_value, release: release_duration, amp: 0.40
  sleep duration
end

# arpeggio parts

def arp_d_2
  play_pattern_timed [:d4, :fs4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.5
  play_pattern_timed [:e5, :fs4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.5
end

live_loop :play_melody do
  arp_d_2
end