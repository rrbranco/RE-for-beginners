put_to_array PROC
; R0 = idx
; R1 = val
        LSR      r2,r0,#1
; R2 = R0>>1 = idx>>1
; check the lowest bit of idx and set flags:
        TST      r0,#1
        LDR      r12,|array|
; R12 = address of array
        LSR      r0,r0,#1
; R0 = R0>>1 = idx>>1
        ADD      r0,r0,r0,LSL #1
; R0 = R0+R0<<1 = R0+R0*2 = R0*3 = (idx>>1)*3 = idx/2*3 = idx*1.5
        ADD      r3,r2,r2,LSL #1
; R3 = R2+R2<<1 = R2+R2*2 = R2*3 = (idx>>1)*3 = idx/2*3 = idx*1.5
        ADD      r0,r0,r12
; R0 = R0+R12 = idx*1.5 + array
; jump if idx is even:
        BEQ      |L0.56|
; idx is odd, go on:
; load middle byte at R0+1:
        LDRB     r3,[r0,#1]
; R3 = middle byte
        AND      r3,r3,#0xf0
; R3 = R3&0xF0 = middle_byte&0xF0
        ORR      r2,r3,r1,LSR #8
; R2 = R3 | R1>>8 = middle_byte&0xF0 | val>>8
; store middle_byte&0xF0 | val>>8 at R0+1 (at the place of middle byte):
	STRB     r2,[r0,#1]
; store low 8 bits of val (or val&0xFF) at R0+2 (at the place of right byte):
        STRB     r1,[r0,#2]
        BX       lr
|L0.56|
; idx is even, go on:
        LSR      r2,r1,#4
; R2 = R1>>4 = val>>4
; store val>>4 at R12+R3 or array + idx*1.5 (place of left byte):
        STRB     r2,[r12,r3]
; load byte at R0+1 (middle byte):
        LDRB     r2,[r0,#1]
; R2 = middle_byte
; drop high 4 bits of middle byte:
        AND      r2,r2,#0xf
; R2 = R2&0xF = middle_byte&0xF
; update middle byte:
        ORR      r1,r2,r1,LSL #4
; R1 = R2 | R1<<4 = middle_byte&0xF | val<<4
; store updated middle byte at R0+1:
        STRB     r1,[r0,#1]
        BX       lr
ENDP

