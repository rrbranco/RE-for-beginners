.LC0:
	.string	"IF=%d KHz is not supportted, 3250 assumed\n"
f:
	sub	esp, 12
	mov	eax, DWORD PTR [esp+16]
	cmp	eax, 4000
	je	.L3
	jg	.L4
	cmp	eax, 3250
	je	.L5
	cmp	eax, 3500
	jne	.L2
	mov	BYTE PTR nco1, 56
	mov	BYTE PTR nco2, 0
	add	esp, 12
	ret
.L4:
	cmp	eax, 5000
	je	.L7
	cmp	eax, 5380
	jne	.L2
	mov	BYTE PTR nco1, 86
	mov	BYTE PTR nco2, 20
	add	esp, 12
	ret
.L2:
	sub	esp, 8
	push	eax
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
.L5:
	mov	BYTE PTR nco1, 52
	mov	BYTE PTR nco2, 0
	add	esp, 12
	ret
.L3:
	mov	BYTE PTR nco1, 64
	mov	BYTE PTR nco2, 0
	add	esp, 12
	ret
.L7:
	mov	BYTE PTR nco1, 80
	mov	BYTE PTR nco2, 0
	add	esp, 12
	ret
