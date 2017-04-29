f       proc near
        imul    rsi, rdi
        lea     rax, [rdx+rsi]
        retn
f       endp

main    proc near
        sub     rsp, 8
        mov     rdx, 3333333344444444h ; третий аргумент
        mov     rsi, 1111111122222222h ; второй аргумент
        mov     rdi, 1122334455667788h ; первый аргумент
        call    f
        mov     edi, offset format ; "%lld\n"
        mov     rsi, rax
        xor     eax, eax ; количество переданных векторных регистров
        call    _printf
        xor     eax, eax
        add     rsp, 8
        retn
main    endp
