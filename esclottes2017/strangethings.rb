
# cloche mystérieuse
live_loop :bell do
  2.times do
    with_fx :reverb do
      sample :perc_bell
    end
    sleep 0.1
  end
  sleep 8.0
end

# son mystérieux
live_loop :bell2 do
  sync :bell
  if false
    2.times do
      with_fx :reverb do
        sample :perc_swash
      end
      sleep 0.1
    end
  end
  sleep 8.0
  
end


# l'alarme se déclenche...
live_loop :alarm do
  if false
    sample :bass_hit_c, beat_stretch: 1.0
    sample :bass_drop_c, beat_stretch: 1.0
  end
  sleep 1.0
end

# suspense...
live_loop :bells2 do
  if false
    sample :bass_woodsy_c
  end
  sleep 6.0
end


# atmosphére
live_loop :atmo1 do
  if false
    sample :ambi_glass_hum, amp: 0.25
    sample :ambi_glass_rub, amp: 0.25
  end
  sleep 1.0
end


# son de vinyl
live_loop :lead do
  if false
    sample :vinyl_rewind, amp: 0.5
  end
  sleep 2.0
end

# bête qui fait peur
live_loop :rythm2 do
  if false
    sample :misc_crow, beat_stretch: 1.0
  end
  sleep 4.0
end

# boom
live_loop :rythm3 do
  if false
    sample :misc_cineboom, amp: 3 #, beat_stretch: 1.0
  end
  sleep 16.0
end

# rythme étrange
live_loop :rythm do
  if false
    sample :loop_garzul, beat_stretch: 8.0
  end
  sleep 8.0
end


