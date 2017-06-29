#--------------------------------------
# ZOE
#--------------------------------------


# les notes de base
basenotes = (ring :B4,:D3,:F4, :B3, :A4 )

# /!\ --------------- PAS TOUCHE !

rythm = 0.25
use_bpm = 30

# notre note de base
baseNote = basenotes.tick
notes = (scale baseNote,  :blues_major ,num_octaves: 4).mirror.take(10)#.ring
notes2 = notes.reverse

note = notes[0]
note2 = notes2[0]


# création des mélodies
# ce sont des gammes issues des notes choisies
live_loop :basenotes do
  baseNote = basenotes.tick #choose
  notes = (scale baseNote,   :blues_major, num_octaves: 5).mirror.take(10)#.ring
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

#une cymbale pour l'accroche
live_loop :cymbal do
  sync :sync
  # A METTRE EN ROUTE-----------------------------------------------------------------------------------
  if true
    2.times do
      sample :drum_snare_soft
      sleep rythm * 0.5
    end
    sample :drum_heavy_kick
    sleep rythm * 0.5
  end
  sleep rythm * 0.3
end


# Mélodie
live_loop :lead do
  sync :sync # synchronisée avec le reste
  # A METTRE EN ROUTE----------------------------------------------------------------------------------------
  if true# instrument utilisé
    #use_synth :dsaw
    use_synth :pulse
    
    # mélodie : c'est la même note jouée plein de fois
    use_octave 1 # plus aigu
    
    # jouer la note
    with_fx   :reverb do
      play note, cutoff: 80, pan: rrand(1,-1), amp: 0.3
    end
    
    # rendre la note encore plus aigue
    with_synth  :piano do
      use_octave 5 # plus aigu
      play note, cutoff: 80, pan: rrand(1,-1), rate: -1, amp: 0.3
    end
    
    # jouer sa basse
    use_octave -3 # plus grave
    with_synth :fm do
      play note2, cutoff: 80, pan: rrand(1,-1), amp: 0.5
    end
    
    #pause très courte
    sleep rythm * 0.3
    
  end
  sleep rythm * 0.2
  
end


#notre ligne de basse:
#on joue simplement la note de base de façon plus grave
live_loop :bass, delay: 0 do
  sync :sync
  # A METTRE EN ROUTE----------------------------------------------------------------------------------
  if true
    play note, amp: 1.5
  end
  sleep rythm * 2
end

#notre ligne d'accords:
#on joue simplement la note mais on la fait durer
live_loop :chords, delay: 0 do
  duree = rythm * 4
  sync :sync
  #A METTRE EN ROUTE------------------------------------------------------------------------------------
  if true
    with_synth :hollow do
      play_chord (chord note, :minor7), amp: 3, stretch: duree
    end
  end
  sleep duree
end


#notre batterie: poum poum tchac
live_loop :drums do
  sync :sync
  # A METTRE EN ROUTE----------------------------------------------------------------------------------
  if true
    2.times do
      sample :drum_heavy_kick
      sleep rythm
    end
    sample :drum_snare_hard
    sleep rythm
    sample :drum_heavy_kick
    sleep rythm
    sample  :drum_tom_lo_soft
  end
  sleep rythm
end
