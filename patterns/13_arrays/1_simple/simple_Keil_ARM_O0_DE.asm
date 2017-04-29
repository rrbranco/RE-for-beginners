            EXPORT _main
_main
            STMFD   SP!, {R4,LR}
            SUB     SP, SP, #0x50      ; Platz für 20 int Variablen reservieren

; erste Schleife

            MOV     R4, #0             ; i
            B       loc_4A0
loc_494                             
            MOV     R0, R4,LSL#1       ; R0=R4*2
            STR     R0, [SP,R4,LSL#2]  ; sichere R0 in SP+R4<<2 (entspricht SP+R4*4)
            ADD     R4, R4, #1         ; i=i+1

loc_4A0                             
            CMP     R4, #20            ; i<20?
            BLT     loc_494            ; falls ja, Rumpf der Schleife erneut ausführen

; zweite Schleife

            MOV     R4, #0             ; i
            B       loc_4C4
loc_4B0                             
            LDR     R2, [SP,R4,LSL#2]  ; (zweites printf Argument) R2=*(SP+R4<<4) (entspricht *(SP+R4*4))
            MOV     R1, R4             ; (erstes printf Argument) R1=i
            ADR     R0, aADD           ; "a[%d]=%d\n"
            BL      __2printf
            ADD     R4, R4, #1         ; i=i+1

loc_4C4                             
            CMP     R4, #20            ; i<20?
            BLT     loc_4B0            ; falls ja, Rumpf der Schleife erneut ausführen
            MOV     R0, #0             ; Rückgabewert
            ADD     SP, SP, #0x50      ; Block freigeben, der für die 20 int Variablen reserviert wurde
            LDMFD   SP!, {R4,PC}
