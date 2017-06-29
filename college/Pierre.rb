#--------------------------------------
# PIERRE
#--------------------------------------


# les notes de base
basenotes = (ring :C3, :F3)

# /!\ --------------- PAS TOUCHE !

rythm = 0.25
use_bpm = 30

# notre note de base
baseNote = basenotes.tick
notes = (scale baseNote, :dorian, num_octaves: 3).mirror.take(10)#.ring
notes2 = notes.reverse

# notes de dÃ©part
note = notes[0]
note2 = notes2[0]

# crÃ©ation des mÃ©lodies
# ce sont des gammes issues des notes choisies
live_loop :basenotes do
  baseNote = basenotes.tick #choose
  notes = (scale baseNote, :dorian, num_octaves: 3).mirror.take(10)#.ring
  notes2 = notes.reverse
  sleep rythm * 40.0
end

# c'est notre boucle de base
live_loop :sync do
  note = notes.tick #choose
  note2 = notes2.tick #choose
  sleep rythm
end

# --------------- \(oo)/ DROIT DE TOUCHER A PARTIR D'ICI


# MÃ©lodie
live_loop :lead do
  sync :sync # synchronisÃ©e avec le reste
  
  if true#7
    # instrument utilisÃ©
    #use_synth :dsaw
    use_synth :dark_ambience
    
    # mÃ©lodie : c'est la mÃªme note jouÃ©e plein de fois
    use_octave 1 # plus aigu
    
    # jouer la note
    with_fx :compressor do
      play note, cutoff: 80, pan: rrand(1,-1), amp: 0.3
    end
    
    # rendre la note encore plus aigue
    with_synth :zawa do
      use_octave 2 # plus aigu
      play note, cutoff: 80, pan: rrand(1,-1), rate: -1, amp: 0.3
    end
    
    # jouer sa basse
    use_octave -1 # plus grave
    with_synth :zawa do
      play note2, cutoff: 80, pan: rrand(1,-1), amp: 0.05
      sample :misc_burp, beat_stretch: rythm * 90, amp: 0.6
      
      
    end
    
    #pause trÃ¨s courte
    sleep rythm * 0.5
    
  end
  sleep rythm * 0.5
  
end


#notre ligne de basse:
#on joue simplement la note de base de faÃ§on plus grave
live_loop :bass, delay: 0 do
  sync :sync
  if true#6
    play note, amp: 0.5
  end
  sleep rythm * 2
end

#notre ligne d'accords:
#on joue simplement la note mais on la fait durer
live_loop :chords, delay: 0 do
  duree = rythm * 4
  sync :sync
  if true#?4
    with_synth :pulse do
      sample :sn_dolf, beat_stretch: rythm * 90,amp: 0.2
    end
  end
  sleep duree
end

#une cymbale pour l'accroche
live_loop :cymbal do
  sync :sync
  if true#?3
    2.times do
      sample :elec_cymbal, beat_stretch: rythm * 90,amp: 0.6
      sleep rythm * 0.5
    end
    sample :misc_burp, beat_stretch: rythm * 90,amp: 0.6
    sleep rythm * 0.5
  end
  sleep rythm * 1
end

#notre batterie: poum poum tchac
live_loop :drums do
  sync :sync
  if true#?5
    2.times do
      sample :misc_burp
      sleep rythm
    end
    sample :guit_e_fifths, beat_stretch: rythm * 90,amp: 0.1
    sleep 0.5
    sample :guit_e_slide, beat_stretch: rythm * 90,amp: 0.1
    sleep 0.5
    sample :elec_beep, beat_stretch: rythm * 90,amp: 0.1
  end
  sleep rythm
end

# notre bruit d'explosion : un sample Ã©largi...
live_loop :amen2 do
  sync :sync
  if true#1
    sample :guit_e_fifths, beat_stretch: rythm * 90,amp: 0.6
    sleep 0.5
    sample :guit_e_slide, beat_stretch: rythm * 90,amp: 0.6
  end
  sleep rythm * 80
end

# le petit son de guitare qui ressemble Ã  une baleine
live_loop :guit do
  sync :sync
  if true#?2
    sample :guit_e_fifths
    sleep rythm * 2.0
    sample :drum_bass_soft
    sleep rythm * 2.0
    sample :drum_splash_hard
  end
  sleep rythm * 16
end
