use_bpm 90
use_debug false

# LMMS samples

drumsamps = ".../LMMS/drums/"
basssamps = ".../LMMS/basses/"
bassloopssamps = ".../LMMS/bassloopes/"
beatsamps = ".../LMMS/beats/"
instsamps = ".../LMMS/instruments/"
latinsamps = ".../LMMS/latin/"
miscsamps = ".../LMMS/misc/"
stringspadssamps = ".../LMMS/stringsnpads/"

# musicradar & samplephonics samples
ayayay = ".../musicradar-female-vocal-samples/other/bv 1.wav"
ohohoh = ".../musicradar-vocal-adlib-samples/Words/oh2.wav"
dadada = ".../samplephonics/RandomPhonics/Oneshots/D3_ScatTaa_SP_01.wav"
testest = ".../samplephonics/RandomPhonics/Oneshots/Snarezzz_02_SP.wav"


drum_kits = {
  toy: {
    hat:   :elec_tick,
    kick:  :elec_hollow_kick,
    snare: :elec_pop
  },
  bd3: {
    hat:   :drum_cymbal_closed,
    kick:  :bd_fat,
    snare: :elec_pop
  }
}


hatpattern=   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0]
kickpattern=  [9, 0, 9, 0,  0, 0, 0, 0,  9, 0, 0, 3,  0, 0, 0, 0]
snarepattern= [0, 0, 0, 0,  4, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]

stringspadspattern = [1, 0, 0, 0,  2, 0, 0, 0,  3, 0, 0, 0,  0, 0, 0, 0]
miscpattern = [1, 0, 1, 2,  1, 0, 2, 3,  2, 0, 3, 4,  0, 2, 1, 0]

vocalpattern = [1, 0, 1, 2,  1, 0, 2, 3,  2, 0, 3, 4,  0, 2, 1, 0]
pluckpattern = [9, 0, 0, 0,  0, 0, 0, 0,  5, 0, 3, 0,  0, 6, 0, 0]
pianopattern = [0, 0, 0, 0,  5, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]


chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
pluckchord = (chord(:C, :minor7))

effectcount = -72

live_loop :drums do
  c = chords.tick
  count = 0
  sample stringspadssamps, 4, amp: stringspadspattern[count]/9, pan: rrand(-1, 1) #0
        sample miscsamps, 3, amp: miscpattern[count]/9*2.0, pan: rrand(-1, 1) #2
  puts effectcount
  current_drum_kit = drum_kits[:toy]
  voc = :glitch_perc4
  if effectcount > 216 && effectcount < 276 then voc = ayayay end
  if effectcount < 116 && effectcount > 84 then voc = dadada  end
  if effectcount > 308 && effectcount < 336 then voc = dadada  end
  if effectcount > 176 then current_drum_kit = drum_kits[:bd3] end
  if effectcount > 280 then current_drum_kit = drum_kits[:toy] end
  
  
  
  if effectcount > 176
  then
    
    sleepdur = 0.20
  else
    sleepdur = 0.25
  end
  
  if effectcount == 176 then sleepdur = 1 end
  
  if effectcount == -1 || effectcount == 59 then
    sleepdur = 1
  end
  
  if effectcount > 328 then sleepdur = 0.25 end
  
  16.times do
    if (effectcount < 0 || effectcount > 328) then
      
      with_fx :reverb do
        sample :elec_soft_kick, amp: hatpattern[count]/9.0, pan: rrand(-1, 1) #0
      with_fx :ixi_techno do
      sample :bass_trance_c, sustain: 0.1, amp: snarepattern[count]/9.0, pan: rrand(-1, 1) #0
        sample :elec_pop, amp: snarepattern[count]/9.0, pan: rrand(-1, 1) #0

        sample :bd_gas, sustain: 0.2, amp: kickpattern[count]/9.0, pan: rrand(-1, 1) #0
      end
    end
    
    with_fx :echo, phase: 0.67, decay: 3 do
      with_fx :panslicer do  #optional , phase: 1
        with_fx :reverb do
          #synth :pluck, note: pluckchord.choose,  amp: pluckpattern[count]/9.0
          #synth :piano, note: c.choose, amp: pianopattern[count]/12.0
        end
      end
    end
    
    else
      sample current_drum_kit[:hat], amp: hatpattern[count]/9.0 #3
          sample current_drum_kit[:kick], amp: kickpattern[count]/18.0 #3
      sample testest, amp: snarepattern[count]/9.0 #3
          sample current_drum_kit[:snare], amp: snarepattern[count]/9.0 #3
      sample :glitch_perc4, amp: snarepattern[count]/9.0, pan: rrand(-1, 1) if one_in(8) #0




          if (factor?(effectcount, 4) || factor?(effectcount, 7)) then fx= :ixi_techno else fx = :tremolo end
          with_fx fx do
            sample voc, amp: vocalpattern[count]/9.0, pan: rrand(-1, 1) #0
    end
    
    
    if (effectcount < 60 || effectcount > 168)
    then
      
      with_fx :echo, phase: 0.67, decay: 3 do
        with_fx :pitch_shift do  #optional , phase: 1
          with_fx :reverb do
            synth :piano, note: c.choose, amp: pianopattern[count]/12.0
          end
        end
      end

      if (effectcount > 108 && effectcount < 248) then
        synth :pluck, note: pluckchord.choose,  amp: pluckpattern[count]/9.0
          end
          
          
          else
            
            
            with_fx :echo, phase: 0.67, decay: 3 do
              with_fx :panslicer do  #optional , phase: 1
                with_fx :reverb do
                  #synth :pluck, note: pluckchord.choose,  amp: pluckpattern[count]/9.0
                  #synth :piano, note: c.choose, amp: pianopattern[count]/12.0
                end
              end
            end
            
            
          end
          
          
          
        end
        
        
        
        
        count = count + 1
        
        
        sleep sleepdur
        
        
      end
      
      effectcount = effectcount + 1
      
    end
    
    
    synthring = [:beep, :dpulse, :dtri,
                 :dull_bell, :fm,
                 :mod_fm, :mod_pulse,
                 :mod_sine, :mod_tri, :pretty_bell, :pulse,  :sine,
                 :subpulse, :tri]
    
    live_loop :slices do
      #stop
      
      if ((effectcount > -74 && effectcount < 0) || effectcount > 280) then
        sync :drums
        c = chords.tick
        cursynth = synthring.choose
        puts cursynth
        with_fx :ixi_techno do
          with_fx :tremolo do
            with_fx :slicer, phase: [0.125, 0.25, 0.5, 1].choose, decay: 4 do
              synth cursynth,
                note: c.choose,
                attack: 6,
                release: 6,
                cutoff: rrand(30, 100),
                amp: 0.18,
                pan: rrand(-1, 1)
            end
          end
        end
      end
      sleep 8
      
    end
