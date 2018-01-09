# Sonic Pi v2.11.1
# listen here: https://soundcloud.com/ugurvu/veering-right
# 2018-01-09

use_bpm 120

synthring = [:beep, :dpulse, :dsaw, :dtri,
             :dull_bell, :fm, :growl,
             :mod_beep, :mod_dsaw, :mod_fm, :mod_pulse,
             :mod_saw, :mod_sine, :mod_tri,
             :pluck, :pretty_bell, :pulse, :saw, :sine, :square,
             :subpulse, :tri]

ambiring = [:ambi_choir, :ambi_haunted_hum]

noteringdrums = [:c3, :e3, :f3, :g3, :a3, :b3, 0, 0 ,0 ,0, 0, 0, 0]
noteringsynth = [:b, :c, :d, :e, :f, :g]

live_loop :drums1 do
  #stop
  
  sample :bd_boom, amp: 2.5
  
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample :bd_tek, delay: 0.25, amp: 0.25, sustain: 0, release: 0.1
  end
  
  sleep 0.5
  
  
  sample :elec_hollow_kick, release: 0.25, sustain: 0.25, cutoff: rrand(20, 120), amp: 1, rate: [-1, 1].choose
  sleep 0.25
  play noteringdrums.choose, release: 0.1, amp: 0.5
  
  sleep 0.25
end



live_loop :fl do
  #stop
  
  sync :drums1
  
  with_fx [:vowel, :ring_mod, :reverb].choose do
    sample :guit_e_slide,
      cutoff: rrand(20, 120),
      release: 0.05,
      amp: 0.4,
      rate: [-1, 1].choose,
      pan: rrand(-1, 1) if one_in(4)
    
    sleep 4
  end
end

live_loop :ambi do
  #stop
  
  sync :drums1
  
  sample ambiring.choose,
    rate: 0.25,
    cutoff: rrand(30, 100),
    amp: 1 if one_in(6)
  sleep 8
end



live_loop :slices do
  #stop
  
  sync :drums1
  
  with_fx :reverb do
    with_fx :slicer, phase: [0.25, 0.5, 0.75, 1].choose do
      synth synthring.choose,
        note: noteringsynth.choose,
        attack: 4,
        release: 4,
        cutoff: rrand(30, 100),
        amp: 0.3,
        pan: rrand(-1, 1)
    end
  end
  sleep 8
end
