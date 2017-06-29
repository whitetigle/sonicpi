#--------------------------------------
# LOIC
#--------------------------------------


# cloche mystérieuse
live_loop :bell do
  2.times do
    with_fx :reverb do
      sample :elec_blip ,amp: 0.5
    end
    sleep 0.2
  end
  sleep 6.0
end

# son mystérieux 2
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


# l'alarme se déclenche...3
live_loop :alarm do
  if false
    sample :loop_compus, beat_stretch: 1.0 ,amp: 0.2
    sample :loop_compus, beat_stretch: 1.0 ,amp: 0.2
  end
  sleep 1.0
end

# suspense...4
live_loop :bells2 do
  if false
    sample :perc_snap2 ,amp: 0.6
  end
  sleep 2.0
end


# atmosphére 5
live_loop :atmo1 do
  if false
    sample :bass_woodsy_c, amp: 0.5
    sample :bass_hit_c, amp: 0.5
  end
  sleep 2.0
end


# son de vinyl 8
live_loop :lead do
  if false
    sample :bass_hit_c, amp: 1.0
  end
  sleep 3.0
end

# bête qui fait peur 7
live_loop :rythm2 do
  if false
    sample :guit_e_fifths, beat_stretch: 1.0,amp: 0.4
  end
  sleep 4.0
end

# boom 9
live_loop :rythm3 do
  if true
    sample :misc_cineboom, amp: 1.5 #, beat_stretch: 1.0
  end
  sleep 4.0
end

# rythme étrange 6
live_loop :rythm do
  if false
    sample :loop_breakbeat, beat_stretch: 4.0 ,amp: 1.0
  end
  sleep 1.0
end

