; RCX = указатель на входную строку
; RAX = текущая длина строки
	or	rax, -1
label:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT label
; RAX = длина строки
