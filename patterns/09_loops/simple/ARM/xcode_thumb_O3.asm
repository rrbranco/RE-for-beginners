_main
       PUSH            {R4,R7,LR}
       MOVW            R4, #0x1124 ; "%d\n"
       MOVS            R1, #2
       MOVT.W          R4, #0
       ADD             R7, SP, #4
       ADD             R4, PC
       MOV             R0, R4
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #3
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #4
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #5
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #6
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #7
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #8
       BLX             _printf
       MOV             R0, R4
       MOVS            R1, #9
       BLX             _printf
       MOVS            R0, #0
       POP             {R4,R7,PC}
