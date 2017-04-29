_TLS	SEGMENT
rand_state DD	01H DUP (?)
_TLS	ENDS

_DATA	SEGMENT
$SG85451 DB	'%d', 0aH, 00H
_DATA	ENDS

_TEXT	SEGMENT

init$ = 8
my_srand PROC
	mov	edx, DWORD PTR _tls_index
	mov	rax, QWORD PTR gs:88 ; 58h
	mov	r8d, OFFSET FLAT:rand_state
	mov	rax, QWORD PTR [rax+rdx*8]
	mov	DWORD PTR [r8+rax], ecx
	ret	0
my_srand ENDP

my_rand	PROC
	mov	rax, QWORD PTR gs:88 ; 58h
	mov	ecx, DWORD PTR _tls_index
	mov	edx, OFFSET FLAT:rand_state
	mov	rcx, QWORD PTR [rax+rcx*8]
	imul	eax, DWORD PTR [rcx+rdx], 1664525 ; 0019660dH
	add	eax, 1013904223		; 3c6ef35fH
	mov	DWORD PTR [rcx+rdx], eax
	and	eax, 32767		; 00007fffH
	ret	0
my_rand	ENDP

_TEXT	ENDS
