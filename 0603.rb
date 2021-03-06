use_bpm 120

# accords et gammes de de nekfeu/on verra (https://play.riffstation.com/?v=YltjliK0ZeA)
mesGammes = [scale(:F,:major),scale(:C,:major),scale(:D,:minor),scale(:A,:minor) ].ring
mesBasses = [scale(:F,:major),scale(:C,:major),scale(:D,:minor),scale(:A,:minor) ].ring
mesAccords = [chord(:F,:major),chord(:C,:major),chord(:D,:minor),chord(:A,:minor) ].ring

mesSynths = [
  :piano, #mesSynths[0]
  :chiplead, #mesSynths[1]
  :blade, #mesSynths[2]
  :chipbass, #mesSynths[3]
  :hoover, #mesSynths[4]
  :pluck, #mesSynths[5]
  :prophet, #mesSynths[6]
  :saw, #mesSynths[7]
  :sine, #mesSynths[8]
  :subpulse,  #mesSynths[9]
  :supersaw, #mesSynths[10]
  :tb303 , #mesSynths[11]
  :tri, #mesSynths[12]
  :zawa  #mesSynths[13]
].ring

# liste pour démarrer nos boucles
OK = [nil, false, false, false, false, false, false, false]
# temps de pause paramétrable
pause = 0.5
longueurGamme = 8 * pause
octave = 0

# c'est là que nous jouons nos gammes
live_loop :gammes do
  # on choisit l'instrument
  monSynth = mesSynths[12]
  #avec cet instrument on joue la gamme
  with_synth monSynth do
    # on récupère la gamme suivante
    maGamme = mesGammes.tick
    # on joue toutes les notes de la gamme
    play_pattern_timed maGamme + octave, pause, amp: 0.4
  end
end

# c'est là que nous jouons nos basses
live_loop :basses do
  sync :gammes
  with_synth :prophet do
    # on récupère la basse suivante
    maBasse = mesBasses.tick
    # on joue toutes les notes de la basse
    play_pattern_timed maBasse - 24 + octave, pause, amp: 0.4
  end
end

# c'est là que nous jouons nos accords
live_loop :accords do
  sync :gammes
  if OK[1]
    # on prend le prochain instrument dans la liste
    monSynth = mesSynths.tick
    #avec cet instrument on joue l'accord
    with_synth monSynth do
      # on récupère le prochain accord
      monAccord = mesAccords.tick
      # on joue l'accord et on le fait durer le temps de la gamme
      play monAccord + octave, release: longueurGamme
    end
  end
  sleep longueurGamme
end

live_loop :groove2 do
  sync :gammes
  if OK[3]
    play sample :loop_garzul, release: longueurGamme, amp: 2
  end
  sleep longueurGamme * 2
end

live_loop :groove3 do
  sync :gammes
  if OK[4]
    play sample :ambi_lunar_land, release: longueurGamme * 4, amp: 4
  end
  sleep longueurGamme * 4
end

live_loop :groove4 do
  sync :gammes
  if OK[5]
    play sample :misc_cineboom, amp: 2
  end
  sleep longueurGamme * 16
end

live_loop :groove5 do
  sync :gammes
  if OK[6]
    with_fx :echo do
      play sample :guit_e_slide
    end
  end
  sleep longueurGamme * 8
end

OKCymballe = [true, false, true, true, false, true, true, true, true].ring
live_loop :groove6 do
  sync :gammes
  if OK[7]
    OKCymballe.each do |ok|
      if ok
        play sample :drum_cymbal_hard
      end
      sleep pause / 2
    end
  end
end

