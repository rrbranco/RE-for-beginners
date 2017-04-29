                public main
main            proc near

var_20          = dword ptr -20h

                push    ebp
                mov     ebp, esp
                and     esp, 0FFFFFFF0h
                push    ebx
                mov     ebx, 2    ; i=2
                sub     esp, 1Ch

; aligner le label loc_80484D0 (§début§ du corps de la boucle) sur une limite de 16-octet:
                nop

loc_80484D0:
; passer (i) comme premier argument §à§ printing_function():
                mov     [esp+20h+var_20], ebx 
                add     ebx, 1    ; i++
                call    printing_function
                cmp     ebx, 64h  ; i==100?
                jnz     short loc_80484D0 ; si non, continuer
                add     esp, 1Ch
                xor     eax, eax  ; renvoyer 0
                pop     ebx
                mov     esp, ebp
                pop     ebp
                retn
main            endp
