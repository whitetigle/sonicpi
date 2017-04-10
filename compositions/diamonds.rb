use_bpm 95


chords = [
  chord(:G,:major),
  chord(:B,:minor),
  chord(:A,:major),
  chord(:A,:major)
].ring

bass = chords
beat = 1

live_loop :beat do
  sleep beat
end

# Synch every bar bar patterns
live_loop :every_bar do
  sync :beat
  sleep beat * 4
end

# Synch two bar patterns
live_loop :every_two_bars do
  sync :beat
  sleep beat * 8
end

# Synch four bar patterns
live_loop :every_four_bars do
  sync :beat
  sleep beat * 16
end

live_loop :chords do
  sync :every_bar
  use_synth :piano
  innerBeat = beat
  c = chords.tick
  play_chord c , release: beat * 8.0
  sleep innerBeat * 4
end

live_loop :lead do
  sync :every_bar
  use_synth :pluck
  innerBeat = beat
  c = chords.tick
  play_pattern_timed c, innerBeat, release: 8.0
  sleep innerBeat
end

live_loop :bass do
  sync :every_bar
  n = bass.tick
  bassLine = [n,:r,n,n,:r,n]
  notes = 1.0 / bassLine.length
  innerBeat = beat * notes
  #  3/4
  with_synth :fm do
    use_synth_defaults attack: 0,
      sustain: 0.1,
      release: innerBeat,
      amp: 1.0,
      cutoff: 70
    play_pattern_timed bassLine, innerBeat
  end
end

live_loop :beats do
  sync :every_four_bars
  sample :loop_amen_full, beat_stretch: beat * 16, amp: 0.5
end
