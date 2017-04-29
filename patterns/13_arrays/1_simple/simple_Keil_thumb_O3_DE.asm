_main
          PUSH    {R4,R5,LR}
; Platz für 20 int Variablen und eine weitere Variable reservieren
          SUB     SP, SP, #0x54   

; erste Schleife

          MOVS    R0, #0          ; i
          MOV     R5, SP          ; Pointer auf das erste Arrayelement

loc_1CE                           
          LSLS    R1, R0, #1      ; R1=i<<1 (entspricht i*2)
          LSLS    R2, R0, #2      ; R2=i<<2 (entspricht i*4)
          ADDS    R0, R0, #1      ; i=i+1
          CMP     R0, #20         ; i<20?
          STR     R1, [R5,R2]     ; sichere R1 in *(R5+R2) (entspricht R5+i*4)
          BLT     loc_1CE         ; falls i<20, führe Schleifenrumpf erneut aus

; zweite Schleife

          MOVS    R4, #0          ; i=0
loc_1DC                           
          LSLS    R0, R4, #2      ; R0=i<<2 (entspricht i*4)
          LDR     R2, [R5,R0]     ; lade von *(R5+R0) (entspricht R5+i*4)
          MOVS    R1, R4
          ADR     R0, aADD        ; "a[%d]=%d\n"
          BL      __2printf
          ADDS    R4, R4, #1      ; i=i+1
          CMP     R4, #20         ; i<20?
          BLT     loc_1DC         ; falls i<20, führe Schleifenrumpf erneut aus
          MOVS    R0, #0          ; Rückgabewert
; Block freigeben, der für die 20 int Variablen und die weitere Variable reserviert wurde
          ADD     SP, SP, #0x54   
          POP     {R4,R5,PC}
