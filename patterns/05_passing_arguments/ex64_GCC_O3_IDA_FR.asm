f       proc near
        imul    rsi, rdi
        lea     rax, [rdx+rsi]
        retn
f       endp

main    proc near
        sub     rsp, 8
        mov     rdx, 3333333344444444h ; §3ème argument§
        mov     rsi, 1111111122222222h ; §2ème argument§
        mov     rdi, 1122334455667788h ; §1er argument§
        call    f
        mov     edi, offset format ; "%lld\n"
        mov     rsi, rax
        xor     eax, eax ; §nombre de registres vectoriel passés§
        call    _printf
        xor     eax, eax
        add     rsp, 8
        retn
main    endp
