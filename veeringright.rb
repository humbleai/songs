use_bpm 60

live_loop :drums do
  #stop
  sample :bd_boom, amp: 3
  sleep 0.25
  sample :elec_hollow_kick, release: 0.1, sustain: 0.25, cutoff: rrand(20, 120), amp: 2, rate: [-1, 1].choose
  play [:c3, :e3, :f3, :g3, :a3, 0, 0, 0, 0].choose, release: 0.02, amp: 1
  sleep 0.25
end

live_loop :fl do
  #stop
  with_fx :flanger, samplerate:rrand(500, 5000), mix:1 do
    sample :guit_e_slide, cutoff: rrand(20, 120), release: 0.05, amp: 0.4, rate: [-1, 1].choose
    sleep 1
  end
end

live_loop :ambi do
  #stop
  sample [:ambi_choir, :ambi_haunted_hum, :ambi_drone, :ambi_lunar_land].choose, rate: 0.25, cutoff: rrand(30, 100), amp: 0.75
  sleep 8
end

with_fx :reverb do
  #stop
  live_loop :slices do
    with_fx :slicer, phase: 0.25 do
      synth synth_names.choose, note: [:b, :c, :d, :e, :f, :g].choose, release: 8, cutoff: rrand(30, 100), amp: 0.25
    end
    sleep 8
  end
end
