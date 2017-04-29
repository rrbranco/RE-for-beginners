                public main
main            proc near

var_20          = dword ptr -20h

                push    ebp
                mov     ebp, esp
                and     esp, 0FFFFFFF0h
                push    ebx
                mov     ebx, 2    ; i=2
                sub     esp, 1Ch

; выравнивание метки loc_80484D0 (§начало§ §тела§ §цикла§) 
; по §16-байтной§ границе:
                nop

loc_80484D0:
; передать i как первый аргумент для printing_function():
                mov     [esp+20h+var_20], ebx 
                add     ebx, 1    ; i++
                call    printing_function
                cmp     ebx, 64h  ; i==100?
                jnz     short loc_80484D0 ; если нет, продолжать
                add     esp, 1Ch
                xor     eax, eax  ; возврат 0
                pop     ebx
                mov     esp, ebp
                pop     ebp
                retn
main            endp
