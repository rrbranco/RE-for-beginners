lea     edi, string
mov     ecx, 0FFFFFFFFh ; scan §$2^{32}-1$§ bytes, i.e., almost §\IT{infinitely}§
xor     eax, eax        ; 0 is the terminator
repne scasb
add     edi, 0FFFFFFFFh ; correct it

; now EDI points to the last character of the ASCIIZ string.

; lets determine string length
; current ECX = -1-strlen

not     ecx
dec     ecx

; now ECX contain string length
