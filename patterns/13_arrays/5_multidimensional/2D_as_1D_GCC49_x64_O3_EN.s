; RDI=address of array
; RSI=a
; RDX=b

get_by_coordinates1:
; sign-extend input 32-bit int values "a" and "b" to 64-bit ones
	movsx	rsi, esi 
	movsx	rdx, edx
	lea	rax, [rdi+rsi*4]
; RAX=RDI+RSI*4=address of array+a*4
	movzx	eax, BYTE PTR [rax+rdx]
; AL=load byte at address RAX+RDX=address of array+a*4+b
	ret

get_by_coordinates2:
	lea	eax, [rdx+rsi*4]
; RAX=RDX+RSI*4=b+a*4
	cdqe
	movzx	eax, BYTE PTR [rdi+rax]
; AL=load byte at address RDI+RAX=address of array+b+a*4
	ret

get_by_coordinates3:
	sal	esi, 2
; ESI=a<<2=a*4
; sign-extend input 32-bit int values "a*4" and "b" to 64-bit ones
	movsx	rdx, edx
	movsx	rsi, esi
	add	rdi, rsi
; RDI=RDI+RSI=address of array+a*4
	movzx	eax, BYTE PTR [rdi+rdx]
; AL=load byte at address RDI+RDX=address of array+a*4+b
	ret
