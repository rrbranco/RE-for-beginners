; RCX = pointer to the input string
; RAX = current string length
	or	rax, -1
label:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT label
; RAX = string length
