get_from_array PROC
; R0 = idx
        PUSH     {r4,r5,lr}
        LSRS     r1,r0,#1
; R1 = R0>>1 = idx>>1
; R1 is now number of triplet
        LSLS     r2,r1,#1
; R2 = R1<<1 = (R0>>1)<<1 = R0&(~1) = idx&(~1)
; the operation (x>>1)<<1 looks senseless, but it's intended to clear the lowest bit in x (or idx)
        LSLS     r5,r0,#31
; R5 = R0<<31 = idx<<31
; thus, R5 will contain 0x80000000 in case of even idx or zero if odd 
        ADDS     r4,r1,r2
; R4 = R1+R2 = idx>>1 + idx&(~1) = offset of triplet begin (or offset of left byte)
; the expression looks tricky, but it's equal to multiplication by 1.5
        LSRS     r0,r0,#1
; R0 = R0>>1 = idx>>1
; load pointer to array:
        LDR      r3,|array|
; R3 = offset of array table
        LSLS     r1,r0,#1
; R1 = R0<<1 = (idx>>1)<<1 = idx&(~1)
        ADDS     r0,r0,r1
; R0 = idx>>1 + idx&(~1) = idx*1.5 = offset of triple begin
        ADDS     r1,r3,r0
; R1 = R3+R0 = offset of array + idx*1.5
; in other words, R1 now contains absolute address of triplet
; load middle byte (at address R1+1):
        LDRB     r2,[r1,#1]
; R2 = middle byte
; finally check if the idx even or odd:
        CMP      r5,#0
; jump if even:
        BEQ      |L0.92|
; idx is odd, go on:
        LSLS     r0,r2,#28
; R0 = R2<<28 = middle_byte<<28
; load right byte at R1+2:
        LDRB     r1,[r1,#2]
; R1 = right byte
        LSRS     r0,r0,#20
; R0 = R0>>20 = (R2<<28)>>20
; this is the same as R2<<8, but Keil compiler generates more complex code in order to drop all bits behind these 4
        B        |L0.98|
|L0.92|
; idx is even, go on:
; load left byte. R3=array now and R4=address of it
        LDRB     r0,[r3,r4]
; R0 = left byte
        LSLS     r0,r0,#4
; R0 = left_byte<<4
; shift middle_byte in R2 4 bits right:
        LSRS     r1,r2,#4
; R1=middle_byte>>4
|L0.98|
; function epilogue:
; current R0 value is shifted left byte or part of middle byte
; R1 is shifted part of middle byte or right byte
; now merge values and leave merged result in R0:
        ORRS     r0,r0,r1
; R0 = R0|R1
        POP      {r4,r5,pc}
        ENDP

