_BSS	SEGMENT
_rand_state DD	01H DUP (?)
_BSS	ENDS

_init$ = 8
_srand	PROC
	mov	eax, DWORD PTR _init$[esp-4]
	mov	DWORD PTR _rand_state, eax
	ret	0
_srand	ENDP

_TEXT	SEGMENT
_rand	PROC
	imul	eax, DWORD PTR _rand_state, 1664525
	add	eax, 1013904223	; 3c6ef35fH
	mov	DWORD PTR _rand_state, eax
	and	eax, 32767	; 00007fffH
	ret	0
_rand	ENDP

_TEXT	ENDS
