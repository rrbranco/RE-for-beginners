; RDI=Adresse des Arrays
; RSI=a
; RDX=b

get_by_coordinates1:
; erweitere 32-Bit int Eingabewerte "a" und "b" zu 64-Bit-Werten.
	movsx	rsi, esi 
	movsx	rdx, edx
	lea	rax, [rdi+rsi*4]
; RAX=RDI+RSI*4=Adresse des Arrays+a*4
	movzx	eax, BYTE PTR [rax+rdx]
; AL=lade Byte an der Adresse RAX+RDX=Adresse des Arrays+a*4+b
	ret

get_by_coordinates2:
	lea	eax, [rdx+rsi*4]
; RAX=RDX+RSI*4=b+a*4
	cdqe
	movzx	eax, BYTE PTR [rdi+rax]
; AL=lade Byte an der Adresse RDI+RAX=Adresse des Arrays+b+a*4
	ret

get_by_coordinates3:
	sal	esi, 2
; ESI=a<<2=a*4
; erweitere 32-Bit int Eingabewerte "a*4" und "b" zu 64-Bit-Werten.
	movsx	rdx, edx
	movsx	rsi, esi
	add	rdi, rsi
; RDI=RDI+RSI=Adresse des Arrays+a*4
	movzx	eax, BYTE PTR [rdi+rdx]
; AL=lade Byte an der Adresse RDI+RDX=Adresse des Arrays+a*4+b
	ret
