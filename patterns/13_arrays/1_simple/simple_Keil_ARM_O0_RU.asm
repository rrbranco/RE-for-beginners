            EXPORT _main
_main
            STMFD   SP!, {R4,LR}
; выделить место для §20-и§ переменных типа int:
            SUB     SP, SP, #0x50      
; первый цикл:
            MOV     R4, #0             ; i
            B       loc_4A0
loc_494                             
            MOV     R0, R4,LSL#1       ; R0=R4*2
; сохранить R0 в SP+R4<<2 (§то§ §же§ §что§ §и§ SP+R4*4):
            STR     R0, [SP,R4,LSL#2]
            ADD     R4, R4, #1         ; i=i+1

loc_4A0                             
            CMP     R4, #20            ; i<20?
            BLT     loc_494            ; да, запустить тело цикла снова
; второй цикл:
            MOV     R4, #0             ; i
            B       loc_4C4
loc_4B0                             
            LDR     R2, [SP,R4,LSL#2]  ; (§второй§ §аргумент§ printf) R2=*(SP+R4<<4) (§то§ §же§ §что§ §и§ *(SP+R4*4))
            MOV     R1, R4             ; (§первый§ §аргумент§ printf) R1=i
            ADR     R0, aADD           ; "a[%d]=%d\n"
            BL      __2printf
            ADD     R4, R4, #1         ; i=i+1
loc_4C4                             
            CMP     R4, #20            ; i<20?
            BLT     loc_4B0            ; да, запустить тело цикла снова
            MOV     R0, #0             ; значение для возврата
; освободить блок в стеке, выделенное для 20 переменных:
            ADD     SP, SP, #0x50      
            LDMFD   SP!, {R4,PC}
