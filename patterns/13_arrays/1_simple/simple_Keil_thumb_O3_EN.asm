_main
          PUSH    {R4,R5,LR}
; allocate place for 20 int variables + one more variable
          SUB     SP, SP, #0x54   

; first loop

          MOVS    R0, #0          ; i
          MOV     R5, SP          ; pointer to first array element

loc_1CE                           
          LSLS    R1, R0, #1      ; R1=i<<1 (same as i*2)
          LSLS    R2, R0, #2      ; R2=i<<2 (same as i*4)
          ADDS    R0, R0, #1      ; i=i+1
          CMP     R0, #20         ; i<20?
          STR     R1, [R5,R2]     ; store R1 to *(R5+R2) (same R5+i*4)
          BLT     loc_1CE         ; yes, i<20, run loop body again

; second loop

          MOVS    R4, #0          ; i=0
loc_1DC                           
          LSLS    R0, R4, #2      ; R0=i<<2 (same as i*4)
          LDR     R2, [R5,R0]     ; load from *(R5+R0) (same as R5+i*4)
          MOVS    R1, R4
          ADR     R0, aADD        ; "a[%d]=%d\n"
          BL      __2printf
          ADDS    R4, R4, #1      ; i=i+1
          CMP     R4, #20         ; i<20?
          BLT     loc_1DC         ; yes, i<20, run loop body again
          MOVS    R0, #0          ; value to return
; deallocate chunk, allocated for 20 int variables + one more variable
          ADD     SP, SP, #0x54   
          POP     {R4,R5,PC}
