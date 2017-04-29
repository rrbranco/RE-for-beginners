$SG1354	DB	'32.01 ^ 1.54 = %lf', 0aH, 00H

__real@40400147ae147ae1 DQ 040400147ae147ae1r	; 32.01
__real@3ff8a3d70a3d70a4 DQ 03ff8a3d70a3d70a4r	; 1.54

main	PROC
	sub	rsp, 40					; 00000028H
	movsdx	xmm1, QWORD PTR __real@3ff8a3d70a3d70a4
	movsdx	xmm0, QWORD PTR __real@40400147ae147ae1
	call	pow
	lea	rcx, OFFSET FLAT:$SG1354
	movaps	xmm1, xmm0
	movd	rdx, xmm1
	call	printf
	xor	eax, eax
	add	rsp, 40					; 00000028H
	ret	0
main	ENDP
