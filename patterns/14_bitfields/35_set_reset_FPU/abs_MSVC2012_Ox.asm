_tmp$ = 8
_i$ = 8	
_my_abs	PROC
	and	DWORD PTR _i$[esp-4], 2147483647 ; 7fffffffH
	fld	DWORD PTR _tmp$[esp-4]
	ret	0
_my_abs	ENDP

_tmp$ = 8
_i$ = 8	
_set_sign PROC
	or	DWORD PTR _i$[esp-4], -2147483648 ; 80000000H
	fld	DWORD PTR _tmp$[esp-4]
	ret	0
_set_sign ENDP

_tmp$ = 8
_i$ = 8	
_negate	PROC
	xor	DWORD PTR _i$[esp-4], -2147483648 ; 80000000H
	fld	DWORD PTR _tmp$[esp-4]
	ret	0
_negate	ENDP
