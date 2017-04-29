_ip1$ = 8		; size = 1
_ip2$ = 12		; size = 1
_ip3$ = 16		; size = 1
_ip4$ = 20		; size = 1
_netmask_bits$ = 24	; size = 1
_calc_network_address PROC
	push	edi
	push	DWORD PTR _netmask_bits$[esp]
	call	_form_netmask
	push	OFFSET $SG3045 ; 'netmask='
	mov	edi, eax
	call	DWORD PTR __imp__printf
	push	edi
	call	_print_as_IP
	push	OFFSET $SG3046 ; 'network address='
	call	DWORD PTR __imp__printf
	push	DWORD PTR _ip4$[esp+16]
	push	DWORD PTR _ip3$[esp+20]
	push	DWORD PTR _ip2$[esp+24]
	push	DWORD PTR _ip1$[esp+28]
	call	_form_IP
	and	eax, edi	; network address = host address & netmask
	push	eax
	call	_print_as_IP
	add	esp, 36
	pop	edi
	ret	0
_calc_network_address ENDP
