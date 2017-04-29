	lock add	DWORD PTR checked[rip], 1
	call	GOMP_critical_start
	mov	ecx, DWORD PTR checked[rip]
	mov	edx, 351843721
	mov	eax, ecx
	imul	edx
	sar	edx, 13
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	imul	eax, eax, 100000
	sub	ecx, eax
	mov	eax, ecx
	test	eax, eax
	jne	.L7
	mov	eax, DWORD PTR checked[rip]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC2 ; "checked=%d\n"
	mov	eax, 0
	call	printf
.L7:
	call	GOMP_critical_end
