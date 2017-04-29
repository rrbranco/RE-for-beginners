$SG1355	DB	'it is ten', 00H
$SG1356	DB	'it is not ten', 00H

a$ = 8
f	PROC
; load pointers to the both strings
	lea	rdx, OFFSET FLAT:$SG1355 ; 'it is ten'
	lea	rax, OFFSET FLAT:$SG1356 ; 'it is not ten'
; compare input value with 10
	cmp	ecx, 10
; if equal, copy value from RDX ("it is ten")
; if not, do nothing. pointer to the string "it is not ten" is still in RAX as for now.
	cmove	rax, rdx
	ret	0
f	ENDP
