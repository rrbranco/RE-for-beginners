_insert
MOVW    R9, #0x10FC
MOV.W   R12, #2400
MOVT.W  R9, #0
RSB.W   R1, R1, R1,LSL#4  ; R1 - y. R1=y<<4 - y = y*16 - y = y*15
ADD     R9, PC
LDR.W   R9, [R9]          ; R9 = Pointer auf ein Array
MLA.W   R0, R0, R12, R9   ; R0 - x, R12 - 2400, R9 - Pointer auf a. R0=x*2400 + Pointer auf a
ADD.W   R0, R0, R1,LSL#3  ; R0 = R0+R1<<3 = R0+R1*8 = x*2400 + Pointer auf a + y*15*8 = 
                          ; Pointer auf a + y*30*4 + x*600*4
STR.W   R3, [R0,R2,LSL#2] ; R2 - z, R3 - Werte. Adresse=R0+z*4 = 
                          ; Pointer auf a + y*30*4 + x*600*4 + z*4
BX      LR
