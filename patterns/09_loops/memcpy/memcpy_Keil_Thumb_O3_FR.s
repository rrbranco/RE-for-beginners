my_memcpy PROC
; R0 = adresse de destination
; R1 = adresse source
; R2 = taille de bloc

        PUSH     {r4,lr}
; initialiser le compteur (i) §à§ 0
        MOVS     r3,#0
; la condition est §testée à§ la fin de la fonction, donc y sauter:
        B        |L0.12|
|L0.6|
; charger l'octet en R1+i:
        LDRB     r4,[r1,r3]
; stocker l'octet en R0+i:
        STRB     r4,[r0,r3]
; i++
        ADDS     r3,r3,#1
|L0.12|
; i<taille?
        CMP      r3,r2
; sauter au §début§ de la boucle si c'est le cas:
        BCC      |L0.6|
        POP      {r4,pc}
        ENDP
