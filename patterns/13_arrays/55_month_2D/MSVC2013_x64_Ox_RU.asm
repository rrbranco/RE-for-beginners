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
; расширить входное значение до §64-битного§, учитывая знак
	movsxd	rax, ecx 
	lea	rcx, QWORD PTR [rax+rax*4]
; RCX=§месяц§+§месяц§*4=§месяц§*5
	lea	rax, OFFSET FLAT:month2
; RAX=§указатель на таблицу§
	lea	rax, QWORD PTR [rax+rcx*2]
; RAX=§указатель§ §на§ §таблицу§ + RCX*2=§указатель§ §на§ §таблицу§ + §месяц§*5*2=§указатель§ §на§ §таблицу§ + §месяц§*10
	ret	0
get_month2 ENDP
