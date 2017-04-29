_DATA	SEGMENT
month1	DQ	FLAT:$SG3122
	DQ	FLAT:$SG3123
	DQ	FLAT:$SG3124
	DQ	FLAT:$SG3125
	DQ	FLAT:$SG3126
	DQ	FLAT:$SG3127
	DQ	FLAT:$SG3128
	DQ	FLAT:$SG3129
	DQ	FLAT:$SG3130
	DQ	FLAT:$SG3131
	DQ	FLAT:$SG3132
	DQ	FLAT:$SG3133
$SG3122	DB	'January', 00H
$SG3123	DB	'February', 00H
$SG3124	DB	'March', 00H
$SG3125	DB	'April', 00H
$SG3126	DB	'May', 00H
$SG3127	DB	'June', 00H
$SG3128	DB	'July', 00H
$SG3129	DB	'August', 00H
$SG3130	DB	'September', 00H
$SG3156	DB	'%s', 0aH, 00H
$SG3131	DB	'October', 00H
$SG3132	DB	'November', 00H
$SG3133	DB	'December', 00H
_DATA	ENDS

month$ = 8
get_month1 PROC
	movsxd	rax, ecx 
	lea	rcx, OFFSET FLAT:month1
	mov	rax, QWORD PTR [rcx+rax*8]
	ret	0
get_month1 ENDP
