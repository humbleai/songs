# Sonic Pi v2.11.1

in_thread do
  live_loop :theme do
    
    use_synth :piano    
    play rrand(72, 86), attack: 1, sustain: 1, release: 2, amp: rrand(16, 20)
    sleep rrand(2, 3)
    
    use_synth :supersaw
    with_fx :gverb do
      play :C2, amp: rrand(8, 12), release: rrand(1, 4), pan: rrand(-1, 1) if one_in(3)
      play :F3, amp: rrand(8, 15), release: rrand(1, 4), pan: rrand(-1, 1) if one_in(5)
      play :E4, amp: rrand(8, 16), release: rrand(1, 4) if one_in(7)
      sleep 2
    end
  end
end

live_loop :sine do
  use_synth :hollow
  with_fx :krush do
    sample :ambi_haunted_hum, attack: 4, release: 4, amp: 6, pan: rrand(-1, 1) if one_in(2)
    play rrand(70, 92), attack: 4, release: 4, amp: 6, pan: rrand(-1, 1) if one_in(3)
    sleep 8
  end  
end