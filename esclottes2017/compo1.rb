# les notes de base
basenotes = (ring :C3, :F3)

# /!\ --------------- PAS TOUCHE !

rythm = 0.25
use_bpm = 30

# notre note de base
baseNote = basenotes.tick
notes = (scale baseNote, :dorian, num_octaves: 3).mirror.take(10)#.ring
notes2 = notes.reverse

# notes de départ
note = notes[0]
note2 = notes2[0]

# création des mélodies
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


# Mélodie
live_loop :lead do
  sync :sync # synchronisée avec le reste
  
  if false
    # instrument utilisé
    #use_synth :dsaw
    use_synth :pulse
    
    # mélodie : c'est la même note jouée plein de fois
    use_octave 1 # plus aigu
    
    # jouer la note
    with_fx :wobble do
      play note, cutoff: 80, pan: rrand(1,-1), amp: 0.3
    end
    
    # rendre la note encore plus aigue
    with_synth :piano do
      use_octave 2 # plus aigu
      play note, cutoff: 80, pan: rrand(1,-1), rate: -1, amp: 0.3
    end
    
    # jouer sa basse
    use_octave -1 # plus grave
    with_synth :fm do
      play note2, cutoff: 80, pan: rrand(1,-1), amp: 0.05
    end
    
    #pause très courte
    sleep rythm * 0.5
    
  end
  sleep rythm * 0.5
  
end


#notre ligne de basse:
#on joue simplement la note de base de façon plus grave
live_loop :bass, delay: 0 do
  sync :sync
  if false
    play note, amp: 1.5
  end
  sleep rythm * 2
end

#notre ligne d'accords:
#on joue simplement la note mais on la fait durer
live_loop :chords, delay: 0 do
  duree = rythm * 4
  sync :sync
  if false
    with_synth :hollow do
      play_chord (chord note, :minor), amp: 3, stretch: duree
    end
  end
  sleep duree
end

#une cymbale pour l'accroche
live_loop :cymbal do
  sync :sync
  if false
    2.times do
      sample :drum_cymbal_soft
      sleep rythm * 0.5
    end
    sample :drum_tom_hi_soft
    sleep rythm * 0.5
  end
  sleep rythm * 1
end

#notre batterie: poum poum tchac
live_loop :drums do
  sync :sync
  if false
    2.times do
      sample :drum_heavy_kick
      sleep rythm
    end
    sample :drum_snare_hard
    sleep rythm
    sample :drum_heavy_kick
    sleep rythm
    sample :drum_snare_hard
  end
  sleep rythm
end

# notre bruit d'explosion : un sample élargi...
live_loop :amen2 do
  sync :sync
  if false
    sample :loop_industrial, beat_stretch: rythm * 80, amp: 3
  end
  sleep rythm * 80
end

# le petit son de guitare qui ressemble à une baleine
live_loop :guit do
  sync :sync
  if false
    sample :guit_e_slide, amp: 1.0
  end
  sleep rythm * 16
end
