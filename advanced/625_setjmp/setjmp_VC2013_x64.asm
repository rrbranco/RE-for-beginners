                
		...

		; RCX = address of jmp_buf
		
		mov     [rcx], rax
                mov     [rcx+8], rbx
                mov     [rcx+18h], rbp
                mov     [rcx+20h], rsi
                mov     [rcx+28h], rdi
                mov     [rcx+30h], r12
                mov     [rcx+38h], r13
                mov     [rcx+40h], r14
                mov     [rcx+48h], r15
                lea     r8, [rsp+arg_0]
                mov     [rcx+10h], r8
                mov     r8, [rsp+0]     ; get saved RA from stack
                mov     [rcx+50h], r8   ; save it
                stmxcsr dword ptr [rcx+58h]
                fnstcw  word ptr [rcx+5Ch]
                movdqa  xmmword ptr [rcx+60h], xmm6
                movdqa  xmmword ptr [rcx+70h], xmm7
                movdqa  xmmword ptr [rcx+80h], xmm8
                movdqa  xmmword ptr [rcx+90h], xmm9
                movdqa  xmmword ptr [rcx+0A0h], xmm10
                movdqa  xmmword ptr [rcx+0B0h], xmm11
                movdqa  xmmword ptr [rcx+0C0h], xmm12
                movdqa  xmmword ptr [rcx+0D0h], xmm13
                movdqa  xmmword ptr [rcx+0E0h], xmm14
                movdqa  xmmword ptr [rcx+0F0h], xmm15
                retn

