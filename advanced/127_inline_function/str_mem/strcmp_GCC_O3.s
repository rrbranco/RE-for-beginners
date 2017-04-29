.LC0:
	.string	"true"
.LC1:
	.string	"false"
is_bool:
.LFB0:
	push	edi
	mov	ecx, 5
	push	esi
	mov	edi, OFFSET FLAT:.LC0
	sub	esp, 20
	mov	esi, DWORD PTR [esp+32]
	repz cmpsb
	je	.L3
	mov	esi, DWORD PTR [esp+32]
	mov	ecx, 6
	mov	edi, OFFSET FLAT:.LC1
	repz cmpsb
	seta	cl
	setb	dl
	xor	eax, eax
	cmp	cl, dl
	jne	.L8
	add	esp, 20
	pop	esi
	pop	edi
	ret
.L8:
	mov	DWORD PTR [esp], 0
	call	assert
	add	esp, 20
	pop	esi
	pop	edi
	ret
.L3:
	add	esp, 20
	mov	eax, 1
	pop	esi
	pop	edi
	ret
