get_from_array PROC
; R0 = idx
        LSR      r1,r0,#1
; R1 = R0>>1 = idx>>1
; check lowest bit in idx and set flags:
        TST      r0,#1
        ADD      r2,r1,r1,LSL #1
; R2 = R1+R1<<1 = R1+R1*2 = R1*3
; thanks to shifting suffix, a single instruction in ARM mode can multiplicate by 3
        LDR      r1,|array|
; R1 = address of array
        LSR      r0,r0,#1
; R0 = R0>>1 = idx>>1
        ADD      r0,r0,r0,LSL #1
; R0 = R0+R0<<1 = R0+R0*2 = R0*3 = (idx>>1)*3 = idx*1.5
        ADD      r0,r0,r1
; R0 = R0+R1 = array + idx*1.5, this is absolute address of triplet
; load middle byte at R0+1:
        LDRB     r3,[r0,#1]
; R3 = middle byte

; the following 3 instructions executed if index is odd, otherwise all of them are skipped:
; load right byte at R0+2:
        LDRBNE   r0,[r0,#2]
; R0 = right byte
        ANDNE    r1,r3,#0xf
; R1 = R3&0xF = middle_byte&0xF
        ORRNE    r0,r0,r1,LSL #8
; R0 = R0|(R1<<8) = right_byte | (middle_byte&0xF)<<8
; this is the result returned

; the following 3 instructions executed if index is even, otherwise all of them are skipped:
; load at R1+R2 = array + (idx>>1)*3 = array + idx*1.5
        LDRBEQ   r0,[r1,r2]
; R0 = left byte
        LSLEQ    r0,r0,#4
; R0 = R0<<4 = left_byte << 4
        ORREQ    r0,r0,r3,LSR #4
; R0 = R0 | R3>>4 = left_byte << 4 | middle_byte >> 4
; this is the result returned
        BX       lr
        ENDP
