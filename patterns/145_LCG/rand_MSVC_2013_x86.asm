_BSS	SEGMENT
_rand_state DD	01H DUP (?)
_BSS	ENDS

_init$ = 8
_srand	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _init$[ebp]
	mov	DWORD PTR _rand_state, eax
	pop	ebp
	ret	0
_srand	ENDP

_TEXT	SEGMENT
_rand	PROC
	push	ebp
	mov	ebp, esp
	imul	eax, DWORD PTR _rand_state, 1664525
	mov	DWORD PTR _rand_state, eax
	mov	ecx, DWORD PTR _rand_state
	add	ecx, 1013904223	; 3c6ef35fH
	mov	DWORD PTR _rand_state, ecx
	mov	eax, DWORD PTR _rand_state
	and	eax, 32767	; 00007fffH
	pop	ebp
	ret	0
_rand	ENDP

_TEXT	ENDS
