_TLS	SEGMENT
_rand_state DD	01H DUP (?)
_TLS	ENDS

_DATA	SEGMENT
$SG84851 DB	'%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT

_init$ = 8	; size = 4
_my_srand PROC
; FS:0=address of TIB
	mov	eax, DWORD PTR fs:__tls_array  ; displayed in IDA as FS:2Ch
; EAX=address of TLS of process
	mov	ecx, DWORD PTR __tls_index
	mov	ecx, DWORD PTR [eax+ecx*4]
; ECX=current TLS segment
	mov	eax, DWORD PTR _init$[esp-4]
	mov	DWORD PTR _rand_state[ecx], eax
	ret	0
_my_srand ENDP

_my_rand PROC
; FS:0=address of TIB
	mov	eax, DWORD PTR fs:__tls_array  ; displayed in IDA as FS:2Ch
; EAX=address of TLS of process
	mov	ecx, DWORD PTR __tls_index
	mov	ecx, DWORD PTR [eax+ecx*4]
; ECX=current TLS segment
	imul	eax, DWORD PTR _rand_state[ecx], 1664525
	add	eax, 1013904223		; 3c6ef35fH
	mov	DWORD PTR _rand_state[ecx], eax
	and	eax, 32767		; 00007fffH
	ret	0
_my_rand ENDP

_TEXT	ENDS
