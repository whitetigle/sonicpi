use_bpm 30
#use_bpm 160
rythm = 0.25

#mario....

synth = [ :piano, :piano, :piano, :piano,  ].ring
fx = [ :bitcrusher, :bitcrusher , :wobble, :echo].ring
live_loop :theme do
  
  s = synth.tick
  f = fx.tick
  with_fx f do
    with_synth s do
      play_pattern_timed([:e5,:e5,nil,:e5,nil,:c5,:e5,nil,
                          :g5,nil,nil,nil,nil,nil,nil,nil], [rythm] )
    end
  end
  
  
  s = synth.tick
  f = fx.tick
  with_fx f do
    with_synth s do
      2.times do
        play_pattern_timed([:c5,nil,nil,:g4,nil,nil,:e4,nil,
                            nil,:a4,nil,:b4,nil,:Bb4,:a4,nil], [rythm])
        play_pattern_timed([:g4,:e5,:g5], [1/3.0]) # minim triplets
        play_pattern_timed([:a5,nil,:f5,:g5,
                            nil,:e5,nil,:c5,
                            :d5,:b4,nil,nil], [rythm])
      end
    end
  end
  
  s = synth.tick
  f = fx.tick
  with_fx f do
    with_synth s do
      2.times do
        play_pattern_timed([nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                            nil,:gs4,:a4,:c5,nil,:a4,:c5,:d5,
                            nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                            nil,:c6,nil,:c6,:c6,nil,nil,nil,
                            nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                            nil,:gs4,:a4,:c5,nil,:a4,:c5,:d5,
                            nil,nil,:ds5,nil,nil,:d5,nil,nil,
                            :c5,nil,nil,nil,nil,nil,nil,nil], [rythm])
      end
    end
  end
  
  s = synth.tick
  f = fx.tick
  with_fx f do
    with_synth s do
      play_pattern_timed([:c5,:c5,nil,:c5,nil,:c5,:d5,nil,
                          :e5,:c5,nil,:a4,:g4,nil,nil,nil,
                          :c5,:c5,nil,:c5,nil,:c5,:d5,:e5,
                          nil,nil,nil,nil,nil,nil,nil,nil,
                          :c5,:c5,nil,:c5,nil,:c5,:d5,nil,
                          :e5,:c5,nil,:a4,:g4,nil,nil,nil], [rythm])
    end
  end
  
end

kick = [:drum_heavy_kick,:drum_cymbal_closed].ring
live_loop :drums, delay: 4.0 do
  sample kick.tick, attack: rythm / 2, amp: 2.0
  sleep rythm * 2
end

