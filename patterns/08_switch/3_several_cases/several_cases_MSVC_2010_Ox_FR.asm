$SG2798	DB	'1, 2, 7, 10', 0aH, 00H
$SG2800	DB	'3, 4, 5', 0aH, 00H
$SG2802	DB	'8, 9, 21', 0aH, 00H
$SG2804	DB	'22', 0aH, 00H
$SG2806	DB	'default', 0aH, 00H

_a$ = 8
_f	PROC
	mov	eax, DWORD PTR _a$[esp-4]
	dec	eax
	cmp	eax, 21
	ja	SHORT $LN1@f
	movzx	eax, BYTE PTR $LN10@f[eax]
	jmp	DWORD PTR $LN11@f[eax*4]
$LN5@f:
	mov	DWORD PTR _a$[esp-4], OFFSET $SG2798 ; '1, 2, 7, 10'
	jmp	DWORD PTR __imp__printf
$LN4@f:
	mov	DWORD PTR _a$[esp-4], OFFSET $SG2800 ; '3, 4, 5'
	jmp	DWORD PTR __imp__printf
$LN3@f:
	mov	DWORD PTR _a$[esp-4], OFFSET $SG2802 ; '8, 9, 21'
	jmp	DWORD PTR __imp__printf
$LN2@f:
	mov	DWORD PTR _a$[esp-4], OFFSET $SG2804 ; '22'
	jmp	DWORD PTR __imp__printf
$LN1@f:
	mov	DWORD PTR _a$[esp-4], OFFSET $SG2806 ; 'default'
	jmp	DWORD PTR __imp__printf
	npad	2 ; aligner la table $LN11@f sur une limite de 16-octet
$LN11@f:
	DD	$LN5@f ; afficher '1, 2, 7, 10'
	DD	$LN4@f ; afficher '3, 4, 5'
	DD	$LN3@f ; afficher '8, 9, 21'
	DD	$LN2@f ; afficher '22'
	DD	$LN1@f ; afficher 'default'
$LN10@f:
	DB	0 ; a=1
	DB	0 ; a=2
	DB	1 ; a=3
	DB	1 ; a=4
	DB	1 ; a=5
	DB	1 ; a=6
	DB	0 ; a=7
	DB	2 ; a=8
	DB	2 ; a=9
	DB	0 ; a=10
	DB	4 ; a=11
	DB	4 ; a=12
	DB	4 ; a=13
	DB	4 ; a=14
	DB	4 ; a=15
	DB	4 ; a=16
	DB	4 ; a=17
	DB	4 ; a=18
	DB	4 ; a=19
	DB	2 ; a=20
	DB	2 ; a=21
	DB	3 ; a=22
_f	ENDP
