my_memcpy PROC
; R0 = destination address
; R1 = source address
; R2 = size of block

        PUSH     {r4,lr}
; initialize counter (i) at 0
        MOVS     r3,#0
; condition checked at the end of function, so jump there:
        B        |L0.12|
|L0.6|
; load byte at R1+i:
        LDRB     r4,[r1,r3]
; store byte at R0+i:
        STRB     r4,[r0,r3]
; i++
        ADDS     r3,r3,#1
|L0.12|
; i<size?
        CMP      r3,r2
; jump to the loop begin if its so:
        BCC      |L0.6|
        POP      {r4,pc}
        ENDP
