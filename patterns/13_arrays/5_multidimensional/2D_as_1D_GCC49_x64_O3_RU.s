; RDI=адрес массива
; RSI=a
; RDX=b

get_by_coordinates1:
; расширить входные §32-битные§ значения "a" и "b" до §64-битных§
	movsx	rsi, esi 
	movsx	rdx, edx
	lea	rax, [rdi+rsi*4]
; RAX=RDI+RSI*4=§адрес§ §массива§+a*4
	movzx	eax, BYTE PTR [rax+rdx]
; AL=§загрузить§ §байт§ §по§ §адресу§ RAX+RDX=§адрес§ §массива§+a*4+b
	ret

get_by_coordinates2:
	lea	eax, [rdx+rsi*4]
; RAX=RDX+RSI*4=b+a*4
	cdqe
	movzx	eax, BYTE PTR [rdi+rax]
; AL=§загрузить§ §байт§ §по§ §адресу§ RDI+RAX=§адрес§ §массива§+b+a*4
	ret

get_by_coordinates3:
	sal	esi, 2
; ESI=a<<2=a*4
; расширить входные §32-битные§ значения "a*4" и "b" до §64-битных§
	movsx	rdx, edx
	movsx	rsi, esi
	add	rdi, rsi
; RDI=RDI+RSI=§адрес массива§+a*4
	movzx	eax, BYTE PTR [rdi+rdx]
; AL=§загрузить§ §байт§ §по§ §адресу§ RDI+RDX=§адрес§ §массива§+a*4+b
	ret
