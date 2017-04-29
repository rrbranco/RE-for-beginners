; a*7
f1:
	lea	rax, [0+rdi*8]
; RAX=RDI*8=a*8
	sub	rax, rdi
; RAX=RAX-RDI=a*8-a=a*7
	ret

; a*28
f2:
	lea	rax, [0+rdi*4]
; RAX=RDI*4=a*4
	sal	rdi, 5
; RDI=RDI<<5=RDI*32=a*32
	sub	rdi, rax
; RDI=RDI-RAX=a*32-a*4=a*28
	mov	rax, rdi
	ret

; a*17
f3:
	mov	rax, rdi
	sal	rax, 4
; RAX=RAX<<4=a*16
	add	rax, rdi
; RAX=a*16+a=a*17
	ret
