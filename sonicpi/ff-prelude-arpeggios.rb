# Welcome to Sonic Pi v3.1

use_bpm 100

with_fx :reverb, room: 0.85, damp: 0.8 do
  with_fx :echo, pre_mix: 0.6, mix: 0.4, phase: 0.5, decay: 0.8 do
    live_loop :updown do
      use_synth :sine
      
      progression = [[:c3, :major],
                     [:a2, :minor],
                     [:c3, :major],
                     [:a2, :minor],
                     [:f2, :major],
                     [:g2, :major],
                     [:ab2, :major],
                     [:bb2, :major]]
      arpeggio = [0, 1, 2, 4]
      
      octaves = 4
      duration = 0.25
      
      progression.each do |chord|
        scale_notes = scale chord[0], chord[1] # encode this...
        
        octaves.times do |oct|
          puts "octave: #{oct}"
          arpeggio.each do |note|
            play scale_notes[note] + oct * 12
            sleep duration
          end
        end
        
        # Top note of the arpeggio is the tonic.
        play scale_notes[0] + octaves * 12
        sleep duration
        
        (octaves - 1).times do |oct|
          puts "octave: #{oct}"
          arpeggio.reverse_each do |note|
            play scale_notes[note] + (octaves - oct - 1) * 12
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