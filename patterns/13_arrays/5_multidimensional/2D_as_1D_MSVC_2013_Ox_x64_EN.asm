array$ = 8
a$ = 16
b$ = 24
get_by_coordinates3 PROC
; RCX=address of array
; RDX=a
; R8=b
	movsxd	rax, r8d
; EAX=b
	movsxd	r9, edx
; R9=a
	add	rax, rcx
; RAX=b+address of array
	movzx	eax, BYTE PTR [rax+r9*4]
; AL=load byte at address RAX+R9*4=b+address of array+a*4=address of array+a*4+b
	ret	0
get_by_coordinates3 ENDP

array$ = 8
a$ = 16
b$ = 24
get_by_coordinates2 PROC
	movsxd	rax, r8d
	movsxd	r9, edx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax+r9*4]
	ret	0
get_by_coordinates2 ENDP

array$ = 8
a$ = 16
b$ = 24
get_by_coordinates1 PROC
	movsxd	rax, r8d
	movsxd	r9, edx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax+r9*4]
	ret	0
get_by_coordinates1 ENDP
