use_bpm 120

synthring = [:beep, :blade, :dpulse, :dsaw, :dtri,
             :dull_bell, :fm, :growl, :hoover,
             :mod_beep, :mod_dsaw, :mod_fm, :mod_pulse,
             :mod_saw, :mod_sine, :mod_tri,
             :pluck, :pretty_bell, :pulse, :saw, :sine, :square,
             :subpulse, :tri]

ambiring = [:ambi_choir, :ambi_haunted_hum]

noteringdrums = [:c3, :e3, :f3, :g3, :a3, :b3, 0, 0 ,0 ,0, 0, 0, 0]
noteringsynth = [:b, :c, :d, :e, :f, :g]

live_loop :drums1 do
  #stop
  with_fx :vowel do
    sample :bd_gas, amp: 1, release: 0.25, sustain: 0.25
  end
  
  sample :bd_boom, amp: 2.5
  sleep 0.5
  
  sample :elec_hollow_kick, release: 0.25, sustain: 0.25, cutoff: rrand(20, 120), amp: 1, rate: [-1, 1].choose
  play noteringdrums.choose, release: 0.1, amp: 0.5
  
  sleep 0.5
end



live_loop :fl do
  #stop
  with_fx [:vowel, :ring_mod, :reverb].choose do
    sample :guit_e_slide, cutoff: rrand(20, 120), release: 0.05, amp: 0.4, rate: [-1, 1].choose if one_in(4)
    sleep 1
  end
end

live_loop :ambi do
  #stop
  sample ambiring.choose, rate: 0.25, cutoff: rrand(30, 100), amp: 1  if one_in(6)
  sleep 8
end

with_fx :reverb do
  #stop
  live_loop :slices do
    with_fx :slicer, phase: [0.25, 0.5].choose do
      synth synthring.choose, note: noteringsynth.choose, release: 8, cutoff: rrand(30, 100), amp: 0.3  if one_in(3)
    end
    sleep 8
  end
end
