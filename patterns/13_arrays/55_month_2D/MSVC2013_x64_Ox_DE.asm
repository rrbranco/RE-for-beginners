month2	DB	04aH
	DB	061H
	DB	06eH
	DB	075H
	DB	061H
	DB	072H
	DB	079H
	DB	00H
	DB	00H
	DB	00H
...

get_month2 PROC
; erweitere Eingabewert um Vorzeichen und wandle um in 64-Bit-Wert
	movsxd	rax, ecx 
	lea	rcx, QWORD PTR [rax+rax*4]
; RCX=Monat+Monat*4=Monat*5
	lea	rax, OFFSET FLAT:month2
; RAX=Pointer auf die Tabelle
	lea	rax, QWORD PTR [rax+rcx*2]
; RAX=Pointer auf die Tabelle + RCX*2=Pointer auf die Tabelle + Monat*5*2=Pointer auf die Tabelle + Monat*10
	ret	0
get_month2 ENDP
