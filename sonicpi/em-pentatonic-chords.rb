# Welcome to Sonic Pi v3.1

use_bpm 130

with_fx :reverb, room: 0.7 do
  live_loop :bass do
    use_synth :prophet
    notes = scale :e2, :minor_pentatonic, num_octaves: 1
    loop do
      play notes.choose, cutoff: 50
      sleep 0.5
    end
  end
  
  live_loop :melody do
    use_synth :mod_tri
    
    2.times do
      play (chord :e, :minor)
      sleep 4
    end
    
    play (chord :a, :minor, invert: -1)
    sleep 4
    play (chord :b, :minor, invert: -1)
    sleep 4
  end
end

##| live_loop :bell2 do
##|   use_synth :pretty_bell
##|   notes = scale :e3, :minor_pentatonic, num_octaves: 2
##|   loop do
##|     play notes.tick, cutoff: 60
##|     sleep 0.5
##|   end
##| end