# get FoxDot -> foxdot.org

p1 >> karp(P[8], oct=[4, 5, 6, 7], dur=1/4, amp=0.4)
p1.every(4, "oct.trim", 3)
p1.every(7, "add", [1, 3, 5, 7])
p1.every(13, "add", [-2, 0, 2, 4])
p1.every(4, "stutter", 4, dur=1/2)
p1.every(4, "reverse")
p2 >> soft(amp=0.2, sus=4)
p3 >> glass(amp=0.4)
d1 >> play ("x p x - ", hpf=1000)
d1.every(6.5, "jump", cycle=8)
d2 >> play ("c  e   y", lpf=1000)
d2.every(12, "stutter", 4, dur=1/2)
