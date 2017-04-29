put_to_array PROC
        PUSH     {r4,r5,lr}
; R0 = idx
; R1 = val
        LSRS     r2,r0,#1
; R2 = R0>>1 = idx>>1
        LSLS     r3,r2,#1
; R3 = R2<<1 = (idx>>1)<<1 = idx&(~1)
        LSLS     r4,r0,#31
; R4 = R0<<31 = idx<<31
        ADDS     r3,r2,r3
; R3 = R2+R3 = idx>>1 + idx&(~1) = idx*1.5
        LSRS     r0,r0,#1
; R0 = R0>>1 = idx>>1
        LDR      r2,|array|
; R2 = address of array
        LSLS     r5,r0,#1
; R5 = R0<<1 = (idx>>1)<<1 = idx&(~1)
        ADDS     r0,r0,r5
; R0 = R0+R5 = idx>>1 + idx&(~1) = idx*1.5
        ADDS     r0,r2,r0
; R0 = R2+R0 = array + idx*1.5, in other words, this is address of triplet
; finally test shifted lowest bit in idx:
        CMP      r4,#0
; jump if idx is even:
        BEQ      |L0.40|
; idx is odd, go on:
; load middle byte at R0+1:
        LDRB     r3,[r0,#1]
; R3 = middle_byte
        LSRS     r2,r1,#8
; R2 = R1>>8 = val>>8
        LSRS     r3,r3,#4
; R3 = R3>>4 = middle_byte>>4
        LSLS     r3,r3,#4
; R3 = R3<<4 = (middle_byte>>4)<<4
; this two shift operations are used to drop low 4 bits in middle_byte
; merge high 4 bits in middle byte (in R3) with val>>8 (in R2):
        ORRS     r3,r3,r2
; R3 = updated middle byte
; store it at R0+1:
        STRB     r3,[r0,#1]
; store low 8 bits of val (val&0xFF) at R0+2:
        STRB     r1,[r0,#2]
        POP      {r4,r5,pc}
|L0.40|
; idx is even, go on:
        LSRS     r4,r1,#4
; R4 = R1>>4 = val>>4
; store val>>4 at R2+R3 (address of left byte or beginning of triplet):
        STRB     r4,[r2,r3]
; load middle byte at R0+1:
        LDRB     r3,[r0,#1]
; R3 = middle byte
        LSLS     r2,r1,#4
; R2 = R1<<4 = val<<4
        LSLS     r1,r3,#28
; R1 = R3<<28 = middle_byte<<28
        LSRS     r1,r1,#28
; R1 = R1>>28 = (middle_byte<<28)>>28
; these two shifting operation are used to drop all bits in register except lowest 4
; merge lowest 4 bits (in R1) and val<<4 (in R2):
        ORRS     r1,r1,r2
; store it at R0+1:
        STRB     r1,[r0,#1]
        POP      {r4,r5,pc}
        ENDP

