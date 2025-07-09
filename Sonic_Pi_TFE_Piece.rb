#################################################################
# - Trabajo de Fin de Estudios
# - Conservatorio Superior de Música de Canarias
# - Author: Basilio Gómez Navarro
# - Since: 01/06/25
# - Link to repository: https://github.com/BasilioGN/TFE_code.git
#################################################################

#################################################################
#
# def live_loop synchro do sync :but_asynchronous end
#
#################################################################

# Global config
use_bpm 100 #indicates de bpm that the song will have globally.

#--------- Functions declaration ----------
def intro_pads(color, synth_to_use, duration, volume)
  use_synth synth_to_use
  if color == true
    play_color_pad(duration, volume)
  else
    play_dissonant_pad(duration, volume)
  end
end

def play_color_pad(pad_duration, time_between_chords, the_synth, volume)
  use_synth the_synth #assignment of the synth to be used
  play chord(:D4, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:F4, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:A3, :major), sustain: pad_duration, amp: volume, release: 0.5
  sleep time_between_chords
  play chord(:C4, :major), sustain: pad_duration, amp: volume, release: 0.5
end

def play_dissonant_pad(pad_duration, time_between_chords, the_synth, volume)
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

def play_rand_counterpoint(volume)
  play choose(scale(:d3, :aeolian, num_octaves: 3)),
    release: rrand(0.3, 3), cutoff: rrand(60, 130), amp: volume
  sleep rrand(0.4, 1)
end

def play_percussion_B(delay, counter, volume)
  if (counter.remainder(2) != 0)
    sample :bd_gas, amp: volume
    #sleep delay
    #sample :bd_gas, amp: volume
  end
  sleep rrand(0.1, 1)
end

def play_bass_B (duration, counter, volume)
  bass_progression_B = [:D1, :D2, :Gs1, :Fs2]
  index = 0
  
  8.times do
    if (counter.remainder(2) == 0)
      play bass_progression_B[index], sustain: duration, amp: volume
      index += 1
      sleep 0.25
    end
    counter += 1
    sleep 3
  end
  
  #play_pattern_timed [:d2, :d3, :gs2, :fs3], [1, 1, 1, 1],
  #sustain: rrand(0.3, 3), cutoff: rrand(90, 130), amp: volume
end

def play_bass_C(duration, volume)
  #play :D2, amp: volume, sustain: duration
  #sleep duration
  #play :F2, amp: volume, sustain: duration
  #sleep duration
  #play :A2, amp: volume, sustain: duration
  #sleep duration
  #play :C2, amp: volume, sustain: duration
  #sleep duration
  play_pattern_timed [:D2, :F2, :A2, :C2], [duration],
    amp: volume
end

def play_hihat(volume)
  sample :hat_tap, amp: volume
  sleep 0.25
end

def play_clap(volume)
  sleep 1
  sample :perc_snap, amp: volume
end

def play_melody_Aa(volume)
  progression = [
    [:D4, :A3, :D4, :E4, :F4, :E4, :D4, :A3],
    [:C4, :A3, :C4, :D4, :E4, :D4, :C4, :A3],
  ]
  
  2.times do
    progression.each do |notes|
      print notes
      2.times do
        notes.each do |n|
          play n, amp: volume
          print n
          sleep 0.25
        end
      end
    end
  end
end

####### MAIN LOOP ##########
live_loop :main do
  sleep 4 # Indicates that the phrase duration is 4 bars.
end
###########################

#--------- Section A -----------
live_loop :pads_A do
  #stop
  sync :main
  #play_dissonant_pad(2, 2, :sine, 0.5)
  play_color_pad(2, 2, :piano, 0.5)
end

live_loop :counterpoint_A do
  #stop
  sync :main
  use_synth :sine
  play_rand_counterpoint(0.3)
end

live_loop :melody_A do
  stop
  sync :main
  use_synth :winwood_lead
  play_melody_A(0.2)
  sleep 2
  play_melody_B(0.2)
  sleep 2
end


#--------- Section B -----------
counter = 0

live_loop :odd_kick_B do
  counter += 1
  stop
  sync :main
  play_percussion_B(1, counter, 2)
  sample :loop_electric, amp: 0.5
  sleep sample_duration :loop_electric
end

counter = 0

live_loop :normal_kick do
  sample :bd_808, amp: 3
  sleep 1
end

counter_bass = 0
live_loop :bass_B do
  stop
  sync :main
  use_synth :hollow
  play_bass_B(0.2, 2, 2)
end

#-------- Section C --------

live_loop :bass_C do
  #stop
  #sync :main
  use_synth :hollow
  #play_bass_C(2, 1)
  play_bass_C(2, 1)
end

live_loop :hihat do
  #stop
  #sync :main
  play_hihat(0.2)
end

live_loop :clap do
  #stop
  sync :main
  play_clap(0.1)
  sleep 1
  play_clap(0.1)
end

live_loop :final_melody do
  stop
  #use_synth :zawa
  sync :main
  play_melody_Aa(0.5)
  
end

