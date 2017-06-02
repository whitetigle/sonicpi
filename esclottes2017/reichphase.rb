# adapted from Reich Phase mechanism
bpm = 60

# notre fréquence !
use_bpm bpm

# notre rythme !
rythm = bpm / 200.0

# notre note de départ
baseNote = :F3

# nous récupérons les notes de notre gamme
# et nous récupérons aussi les mêmes notes inversées
notes = (scale baseNote, :dorian, num_octaves: 3).mirror.ring
bassline = notes.reverse

# première gammme décallée
live_loop :slow do
  if true
    use_octave -2
    with_fx :reverb do
      with_synth :piano do
        play bassline.tick, release: 0.1, cutoff: 80,attack: 0.5, amp: 0.3, env_curve: 0.5
      end
    end
  end
  sleep rythm
end

# 2ème gammme décallée
live_loop :faster do
  if true
    use_octave 0
    with_fx :reverb do
      with_synth :piano do
        play notes.tick, release: 0.1, cutoff: 80, attack: 0.5, amp: 0.5, env_curve: 0.5
      end
    end
  end
  sleep rythm - ( rythm / 50 )
end

# 3ème gammme décallée
live_loop :faster2 do
  if true
    use_octave 1
    with_fx :reverb do
      with_synth :piano do
        play notes.tick, release: 0.1, cutoff: 80, attack: 0.5, amp: 0.5, env_curve: 0.5
      end
    end
  end
  sleep rythm - ( rythm / 10 )
end

# 2ème gammme décallée
live_loop :bassline do
  if false
    with_synth :chipbass do
      use_octave -2
      play bassline.tick, release: 0.1, cutoff: 80, attack: 0.1, amp: 0.25
    end
  end
  sleep rythm
end

# un beat bien net et légèrement décallé
live_loop :beat do
  r = rythm * 20
  if false
    sample :loop_compus, beat_stretch: r
  end
  sleep r
end

# un peu de mmystère...
live_loop :lunar do
  if false
    sample :ambi_piano
  end
  sleep rythm * 10
end

# basse prononcé
live_loop :bass do
  if false
    sample :bd_klub
  end
  sleep rythm * 10
end

# un beat prononcé
live_loop :bass2 do
  if false
    sample :bd_haus, amp: 1
  end
  sleep rythm * 10
end

# un peu plus de mystère
live_loop :bass3 do
  if false
    3.times do
      sample :ambi_swoosh #, amp: 1
      sleep 0.1
    end
  end
  sleep rythm *10
end

# Boum !
live_loop :boom do
  if false
    sample :loop_industrial, beat_stretch: 8.0, amp: 0.2
  end
  sleep 8.0
end
