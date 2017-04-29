               
	        ...
		
		; RCX = address of jmp_buf

		mov     rax, rdx
                mov     rbx, [rcx+8]
                mov     rsi, [rcx+20h]
                mov     rdi, [rcx+28h]
                mov     r12, [rcx+30h]
                mov     r13, [rcx+38h]
                mov     r14, [rcx+40h]
                mov     r15, [rcx+48h]
                ldmxcsr dword ptr [rcx+58h]
                fnclex
                fldcw   word ptr [rcx+5Ch]
                movdqa  xmm6, xmmword ptr [rcx+60h]
                movdqa  xmm7, xmmword ptr [rcx+70h]
                movdqa  xmm8, xmmword ptr [rcx+80h]
                movdqa  xmm9, xmmword ptr [rcx+90h]
                movdqa  xmm10, xmmword ptr [rcx+0A0h]
                movdqa  xmm11, xmmword ptr [rcx+0B0h]
                movdqa  xmm12, xmmword ptr [rcx+0C0h]
                movdqa  xmm13, xmmword ptr [rcx+0D0h]
                movdqa  xmm14, xmmword ptr [rcx+0E0h]
                movdqa  xmm15, xmmword ptr [rcx+0F0h]
                mov     rdx, [rcx+50h]  ; get PC (RIP)
                mov     rbp, [rcx+18h]
                mov     rsp, [rcx+10h]
                jmp     rdx             ; jump to saved PC

		...

