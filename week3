# étape 0 : on définit le tempo
use_bpm 60

# étape 1 : choix de notre instrument
use_synth :piano

# étape 2 : création de notre liste d'accords
chords = [
  nil,
  chord(:C3,:major),
  nil,
  chord(:E3,:minor),
  chord(:F3,:major),
  chord(:A3,:minor)
].ring

# étape 3 : jouons nos accords en boucle
# une pause de 0.5 secondes est ajoutée
# avant de jouer le prochain accord
live_loop :melody do
  play chords.tick
  sleep 0.5
end

#live_loop :bass do
#  sample :bd_haus
#  sleep 0.5
#end

# étape 4 : un petit son de cloche sympa
# est joué toutes les 3 secondes
# on lui a ajouté un peu de reverb...
live_loop :bell do
  with_fx :echo do
    sample :perc_bell
    sleep 3
  end
end

# étape 5 : un groove est joué toutes les 3 secondes
# pour être calé sur la mélodie
# on le fait donc durer 3 secondes et on fait une pause de 3 secondes
live_loop :groove do
  sample :loop_amen, beat_stretch: 3
  sleep 3
end

# [ET MAINTENANT, A VOUS DE JOUER !]:
# 1 - vous aussi, composez votre liste d'accords ici: https://autochords.com/
# 2 - changez les temps de pause
# 3 - utilisez une variable pour les temps de pause
# 4 - changez les samples
# 5 - changez de synth
# 6 - changez le tempo (nécessite d'arrêter le morceau)
# 7 - ajoutez d'autres sons (samples) et synchronisez-les dans des boucles live_loop
# 8 - ajoutez des effets (reverb,amp, etc...) aux sons joués (consultez l'aide)
# 9 - ajoutez des commentaires pour décrire vos expériences
# 10 - ça y est vous êtes de véritables DJs ! BRAVO !
