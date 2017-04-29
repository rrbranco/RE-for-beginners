$SG1355	DB	'it is ten', 00H
$SG1356	DB	'it is not ten', 00H

a$ = 8
f	PROC
; lade Pointer auf beide Strings
	lea	rdx, OFFSET FLAT:$SG1355 ; 'it is ten'
	lea	rax, OFFSET FLAT:$SG1356 ; 'it is not ten'
; vergleiche Eingabewert mit 10
	cmp	ecx, 10
; falls gleich, kopiere Wert aus RDX ("it is ten")
; falls nicht, tue nichts. Der Pointer auf den String "it is not ten" ist immernoch in RAX.
	cmove	rax, rdx
	ret	0
f	ENDP
