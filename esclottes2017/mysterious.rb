use_bpm 30
rythm_acceleration = 0.5

baseNote = :F3

# nous récupérons les notes de notre gamme
# et nous récupérons aussi les mêmes notes inversées
notes = (scale baseNote, :dorian, num_octaves: 5).mirror.ring

# note de départ
note = notes[0]

# rythme indien
live_loop :batterie do
  r = 8.0 * rythm_acceleration
  if true
    with_fx :ixi_techno do
      sample :loop_tabla, beat_stretch: r, amp: 1.0
    end
  end
  sleep r
end

# basse mystérieuse
live_loop :bass2 do
  if true
    with_fx  :flanger do
      sample :bass_thick_c, amp: 0.1, attack: 1.5
    end
  end
  sleep 0.25 * rythm_acceleration
end

# espace infini....
live_loop :space do
  if false
    sample :ambi_lunar_land, amp: 0.3
  end
  sleep 4. * rythm_acceleration
end


# beat
live_loop :big_beat do
  r = 1.0 * rythm_acceleration
  if false
    with_fx :ixi_techno do
      sample :loop_industrial, beat_stretch: r, amp: 1.0
    end
  end
  sleep r
end

# beat principal
live_loop :beatbeat do
  r = 2.0 * rythm_acceleration
  if false
    with_fx :reverb do
      sample :loop_breakbeat, beat_stretch: r, amp: 0.7
    end
  end
  sleep r
end

# mélodie
live_loop :lead do
  if false
    with_synth :saw do
      with_fx :ixi_techno do
        play notes.choose, amp: 0.1, cutoff: rrand(20,90), pan: rrand(1,-1)
      end
    end
  end
  sleep 0.125 * rythm_acceleration
end

