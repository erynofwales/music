# Welcome to Sonic Pi v3.1

use_bpm 100

with_fx :reverb, room: 0.85, damp: 0.8 do
  with_fx :echo, pre_mix: 0.6, mix: 0.4, phase: 0.5, decay: 0.8 do
    live_loop :updown do
      use_synth :sine
      
      progression = [[:c4, :major],
                     [:a3, :minor],
                     [:c4, :major],
                     [:a3, :minor],
                     [:f3, :major],
                     [:g3, :major],
                     [:ab3, :major],
                     [:bb3, :major]]
      arpeggio = [0, 1, 2, 4]
      
      num_octaves = 4
      duration = 0.25
      
      progression.each do |chord|
        scale_notes = scale chord[0], chord[1] # encode this...
        
        num_octaves.times do |oct|
          puts "octave: #{oct}"
          arpeggio.each do |note|
            play scale_notes[note] + oct * 12
            sleep duration
          end
        end
        
        # Top note of the arpeggio is the tonic.
        play scale_notes[0] + num_octaves * 12
        sleep duration
        
        (num_octaves - 1).times do |oct|
          puts "octave: #{oct}"
          arpeggio.reverse_each do |note|
            play scale_notes[note] + (num_octaves - oct - 1) * 12
            sleep duration
          end
        end
        
        # Play the last octave separately 'cause it's different from the rest.
        arpeggio.select { |a| a != 1 }.reverse_each do |note|
          play scale_notes[note]
          sleep duration
        end
      end
    end
  end
end