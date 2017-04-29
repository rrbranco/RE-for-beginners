_BSS	SEGMENT
rand_state DD	01H DUP (?)
_BSS	ENDS

init$ = 8
my_srand PROC
; ECX = input argument
	mov	DWORD PTR rand_state, ecx
	ret	0
my_srand ENDP

_TEXT	SEGMENT
my_rand	PROC
	imul	eax, DWORD PTR rand_state, 1664525 ; 0019660dH
	add	eax, 1013904223	; 3c6ef35fH
	mov	DWORD PTR rand_state, eax
	and	eax, 32767	; 00007fffH
	ret	0
my_rand	ENDP

_TEXT	ENDS
