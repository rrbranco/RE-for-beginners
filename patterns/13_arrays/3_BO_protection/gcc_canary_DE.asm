.LC0:
	.string	"hi! %d, %d, %d\n"
f:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 676
	lea	ebx, [esp+39]
	and	ebx, -16
	mov	DWORD PTR [esp+20], 3
	mov	DWORD PTR [esp+16], 2
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC0  ; "hi! %d, %d, %d\n"
	mov	DWORD PTR [esp+4], 600
	mov	DWORD PTR [esp], ebx
	mov	eax, DWORD PTR gs:20     ; canary
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	call	_snprintf
	mov	DWORD PTR [esp], ebx
	call	puts
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20     ; prüfe canary
	jne	.L5
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
.L5:
	call	__stack_chk_fail
