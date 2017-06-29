#--------------------------------------
# LEANE ET ALYSSON
#--------------------------------------

# adapted from Reich Phase mechanism
bpm = 120

# notre frÃ©quence !
use_bpm bpm

# notre rythme !
rythm = bpm / 200.0

# notre note de dÃ©part
baseNote = :c3

# nous rÃ©cupÃ©rons les notes de notre gamme
# et nous rÃ©cupÃ©rons aussi les mÃªmes notes inversÃ©es
notes = (scale baseNote,  :egyptian, num_octaves: 10).mirror.ring
bassline = notes.reverse

# premiÃ¨re gammme dÃ©callÃ©e11
live_loop :slow do
  if true
    use_octave -2
    with_fx :reverb do
      with_synth :pluck do
        play bassline.tick, release: 0.1, cutoff: 80,attack: 0.5, amp: 0.5, env_curve: 0.5
      end
    end
  end
  sleep rythm
end

# 2Ã¨me gammme dÃ©callÃ©e12
live_loop :faster do
  if true
    use_octave 0
    with_fx :reverb do
      with_synth :pluck do
        play notes.tick, release: 0.1, cutoff: 80, attack: 0.5, env_curve: 0.5
      end
    end
  end
  sleep rythm - ( rythm / 50 )
end

# 3Ã¨me gammme dÃ©callÃ©e10
live_loop :faster2 do
  if true
    use_octave 1
    with_fx :bpf do
      with_synth :pluck do
        play notes.tick, release: 0.1, cutoff: 80, attack: 0.5, amp: 0.5, env_curve: 0.5
      end
    end
  end
  sleep rythm - ( rythm / 10 )
end

# 2Ã¨me gammme dÃ©callÃ©e4
live_loop :bassline do
  if false
    with_synth :chipbass do
      use_octave -2
      play bassline.tick, release: 0.1, cutoff: 80, amp: 0.5, attack: 0.1
    end
  end
  sleep rythm
end

# un beat bien net et lÃ©gÃ¨rement dÃ©callÃ©8
live_loop :beat do
  r = rythm * 20
  if false
    sample :loop_compus, beat_stretch: r
  end
  sleep r
end

# un peu de mmystÃ¨re...3
live_loop :lunar do
  if false
    sample :ambi_piano
  end
  sleep rythm * 10
end

# basse prononcÃ©7
live_loop :bass do
  if false
    sample :loop_mika, amp: 0.2
  end
  sleep rythm * 10
end

# un beat prononcÃ©29
live_loop :bass2 do
  if true
    sample :loop_mika, amp: 0.2
  end
  sleep rythm * 5
end

# un peu plus de mystÃ¨re6
live_loop :bass3 do
  if false
    3.times do
      sample :loop_breakbeat #, amp: 1
      sleep 2
    end
  end
  sleep rythm *10
end

# bools !1;5
live_loop :boom do
  if true
    sample :loop_safari, beat_stretch: 8.0, amp: 0.2
  end
  sleep 8.0
end
