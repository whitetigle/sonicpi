#--------------------------------------
# MAXIMILIANO ET ARMAND
#--------------------------------------


bpm = 150

# notre rythme de pasue de base
rythm = 0.25

# notre note de base
baseNote = :A3

# notre mode
type = :minor

# nous récupérons les notes de notre gamme
# et nous récupérons aussi les mêmes notes inversées
notes = (scale baseNote, type, num_octaves: 1).mirror.ring

# note de départ
note = notes[0]

# c'est notre boucle de base
live_loop :sync do
  note = notes.tick
  sleep rythm
end

# notre boucle de rythme
# sur quatre mesures
live_loop :eight do
  sync :sync
  sleep rythm * 4
end


#notre mélodie qui démarre après une pause de 6 seconde
live_loop :lead, delay: 2 do
  sync :sync # synchronisée avec le reste
  
  # instrument utilisé
  #use_synth :dsaw
  
  # mélodie : c'est la même note jouée plein de fois
  9.times do
    # rendre la note plus aigue
    use_octave 1
    
    with_fx :distortion do
      sample :ambi_glass_hum, finish: rythm * 4, amp: 0.5
    end
    
    
    # jouer la note
    with_fx :compressor do
      play note, cutoff: rrand(0,90), pan: rrand(1,-1), amp: 0.5
    end
    
    # jour sa basse
    use_octave -1
    with_synth :noise do
      play note, cutoff: rrand(0,90), pan: rrand(1,-1), amp: 0.50
    end
    
    #pause très courte
    sleep rythm * 2
  end
  
end


#notre ligne de basse:
#on joue simplement la note de base de façon plus grave
live_loop :bass, delay: 6 do
  sync :eight
  play note, amp: 0.5
  sleep rythm * 4
end

#notre ligne d'accords:
#on joue simplement la note mais on la fait durer
live_loop :chords, delay: 0 do
  sync :eight
  use_synth :pluck
  duree = rythm * 4
  play_chord (chord note, type), amp: 0.5, stretch: duree
  sleep duree
end

#notre batterie: poum poum tchac

#une cymbale pour l'accroche
live_loop :cymbal, delay: 30 do
  sync :sync
  sample :drum_cymbal_pedal
  sleep rythm * 2
end

live_loop :drums, delay: 12 do
  sync :sync
  2.times do
    sample :drum_heavy_kick
    sleep rythm
  end
  sample :drum_snare_hard
  sleep rythm
  sample :drum_heavy_kick
  sleep rythm
  sample :drum_snare_hard
  sleep rythm
end

# un beat classique
live_loop :amen, delay: 80 do
  sync :sync
  sample :loop_amen, beat_stretch: rythm * 8, amp: 0.25
  sleep rythm * 8
end

# notre bruit d'explosion : un sample élargi...
live_loop :amen2, delay: 20  do
  sync :sync
  sample :loop_industrial, beat_stretch: rythm * 95, amp: 0.5
  sleep rythm * 80
end

live_loop :guit, delay: 60 do
  sync :sync
  sample :guit_e_sl, amp: 0.5
  sleep rythm * 16
end# du caca en barre de 80 gr
