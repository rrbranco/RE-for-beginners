f               proc near

; область "shadow":
arg_0           = dword ptr  8
arg_8           = dword ptr  10h
arg_10          = dword ptr  18h

		; ECX - первый аргумент
		; EDX - второй аргумент
		; R8D - третий аргумент
                mov     [rsp+arg_10], r8d
                mov     [rsp+arg_8], edx
                mov     [rsp+arg_0], ecx
                mov     eax, [rsp+arg_0]
                imul    eax, [rsp+arg_8]
                add     eax, [rsp+arg_10]
                retn
f               endp

main            proc near
                sub     rsp, 28h
                mov     r8d, 3 ; третий аргумент
                mov     edx, 2 ; второй аргумент
                mov     ecx, 1 ; первый аргумент
                call    f
                mov     edx, eax
                lea     rcx, $SG2931    ; "%d\n"
                call    printf

                ; возврат 0
                xor     eax, eax
                add     rsp, 28h
                retn
main            endp
