_strlen
           MOV       R1, R0

loc_2DF6
           LDRB.W    R2, [R1],#1
           CMP       R2, #0
           BNE       loc_2DF6
           MVNS      R0, R0
           ADD       R0, R1
           BX        LR
