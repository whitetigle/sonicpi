m = [
  chord(:A3, :minor),
  chord(:F3, :major),
  chord(:C3, :major),
  chord(:G3, :major)
].ring

live_loop :chords do
  use_synth :pluck
  c = m.tick
  # plays arpege
  play_pattern_timed c, 0.125, release: 1
  sleep 1-3*0.125
end

live_loop :base do
  sync :chords
  use_synth :pluck
  use_transpose -12
  c = m.tick
  # plays the first note of the current chord
  play c[0], release: 1, amp: 0.5
  sleep 1
end

live_loop :beats do
  sync :chords
  sample :loop_amen_full, beat_stretch: 8, amp: 0.5
  sleep 8
end

live_loop :boom do
  sync :chords
  sample :bd_boom
  sleep 4
end
