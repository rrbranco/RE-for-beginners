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
; sign-extend input argument and promote to 64-bit value
	movsxd	rax, ecx 
	lea	rcx, QWORD PTR [rax+rax*4]
; RCX=month+month*4=month*5
	lea	rax, OFFSET FLAT:month2
; RAX=pointer to table
	lea	rax, QWORD PTR [rax+rcx*2]
; RAX=pointer to table + RCX*2=pointer to table + month*5*2=pointer to table + month*10
	ret	0
get_month2 ENDP
