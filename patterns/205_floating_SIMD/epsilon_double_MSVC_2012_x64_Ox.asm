v$ = 8
calculate_machine_epsilon PROC
	movsdx	QWORD PTR v$[rsp], xmm0
	movaps	xmm1, xmm0
	inc	QWORD PTR v$[rsp]
	movsdx	xmm0, QWORD PTR v$[rsp]
	subsd	xmm0, xmm1
	ret	0
calculate_machine_epsilon ENDP
