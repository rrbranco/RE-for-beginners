 add     [ebp-31F7Bh], cl
 dec     dword ptr [ecx-3277Bh]
 dec     dword ptr [ebp-2CF7Bh]
 inc     dword ptr [ebx-7A76F33Ch]
 fdiv    st(4), st
 db 0FFh
 dec     dword ptr [ecx-21F7Bh]
 dec     dword ptr [ecx-22373h]
 dec     dword ptr [ecx-2276Bh]
 dec     dword ptr [ecx-22B63h]
 dec     dword ptr [ecx-22F4Bh]
 dec     dword ptr [ecx-23343h]
 jmp     dword ptr [esi-74h]
 xchg    eax, ebp
 clc
 std
 db 0FFh
 db 0FFh
 mov     word ptr [ebp-214h], cs ; <- disassembler finally found right track here
 mov     word ptr [ebp-238h], ds
 mov     word ptr [ebp-23Ch], es
 mov     word ptr [ebp-240h], fs
 mov     word ptr [ebp-244h], gs
 pushf
 pop     dword ptr [ebp-210h]
 mov     eax, [ebp+4]
 mov     [ebp-218h], eax
 lea     eax, [ebp+4]
 mov     [ebp-20Ch], eax
 mov     dword ptr [ebp-2D0h], 10001h
 mov     eax, [eax-4]
 mov     [ebp-21Ch], eax
 mov     eax, [ebp+0Ch]
 mov     [ebp-320h], eax
 mov     eax, [ebp+10h]
 mov     [ebp-31Ch], eax
 mov     eax, [ebp+4]
 mov     [ebp-314h], eax
 call    ds:IsDebuggerPresent
 mov     edi, eax
 lea     eax, [ebp-328h]
 push    eax
 call    sub_407663
 pop     ecx
 test    eax, eax
 jnz     short loc_402D7B
