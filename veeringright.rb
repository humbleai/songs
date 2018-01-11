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


###########################

sleep 2

12.times do
  sample ambiring.choose,
    rate: 0.25,
    cutoff: rrand(30, 100),
    amp: 1
  sleep rrand(2, 8)
  #stop
  with_fx :reverb do
    with_fx :slicer, phase: 0.25 do
      synth synthring.choose,
        note: noteringsynth.choose,
        attack: 3,
        release: 5,
        cutoff: rrand(30, 100),
        amp: 0.3,
        pan: rrand(-1, 1)
    end
  end
  sleep 8
end

################

live_loop :drums1 do
  #stop
  
  sample :drum_bass_soft, amp: 1
  
  with_fx :echo, mix: 0.5 do
    sample :elec_filt_snare, amp: 0.1, sustain: 0, release: 0.1
  end
  
  sleep 0.50
  
  
  sample :elec_hollow_kick, release: 0.25, sustain: 0.25, cutoff: rrand(20, 120), amp: 2, rate: [-1, 1].choose
  sleep 0.25
  play noteringdrums.choose, release: 0.1, amp: 0.5
  
  sleep 0.25
end

############################

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

###########################


live_loop :ambi do
  #stop
  
  #sync :drums1
  
  sample ambiring.choose,
    rate: 0.25,
    cutoff: rrand(30, 100),
    amp: 1 if one_in(6)
  sleep 8
end

###########################

live_loop :slices do
  #stop
  
  sync :drums1
  
  with_fx :reverb do
    with_fx :slicer, phase: [0.15, 0.25, 0.5, 1].choose do
      synth synthring.choose,
        note: noteringsynth.choose,
        attack: 6,
        release: 6,
        cutoff: rrand(30, 100),
        amp: 0.3,
        pan: rrand(-1, 1)
    end
  end
  sleep 8
end



