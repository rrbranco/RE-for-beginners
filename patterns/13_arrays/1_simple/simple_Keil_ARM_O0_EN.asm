            EXPORT _main
_main
            STMFD   SP!, {R4,LR}
            SUB     SP, SP, #0x50      ; allocate place for 20 int variables

; first loop

            MOV     R4, #0             ; i
            B       loc_4A0
loc_494                             
            MOV     R0, R4,LSL#1       ; R0=R4*2
            STR     R0, [SP,R4,LSL#2]  ; store R0 to SP+R4<<2 (same as SP+R4*4)
            ADD     R4, R4, #1         ; i=i+1

loc_4A0                             
            CMP     R4, #20            ; i<20?
            BLT     loc_494            ; yes, run loop body again

; second loop

            MOV     R4, #0             ; i
            B       loc_4C4
loc_4B0                             
            LDR     R2, [SP,R4,LSL#2]  ; (second printf argument) R2=*(SP+R4<<4) (same as *(SP+R4*4))
            MOV     R1, R4             ; (first printf argument) R1=i
            ADR     R0, aADD           ; "a[%d]=%d\n"
            BL      __2printf
            ADD     R4, R4, #1         ; i=i+1

loc_4C4                             
            CMP     R4, #20            ; i<20?
            BLT     loc_4B0            ; yes, run loop body again
            MOV     R0, #0             ; value to return
            ADD     SP, SP, #0x50      ; deallocate chunk, allocated for 20 int variables
            LDMFD   SP!, {R4,PC}
