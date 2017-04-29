; RCX = указатель на входную строку
; RAX = текущая длина строки
        xor     rax, rax
label:
        cmp     byte ptr [rcx+rax], 0
        jz      exit
        inc     rax
        jmp     label
exit:
; RAX = длина строки
