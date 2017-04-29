.LC0:
	.string	"hi! %d, %d, %d\n"
f:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 660
	lea	ebx, [esp+39]
	and	ebx, -16                  ; Pointer an 16-bit grenze anpassen
	mov	DWORD PTR [esp], ebx      ; s
	mov	DWORD PTR [esp+20], 3
	mov	DWORD PTR [esp+16], 2
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:.LC0 ; "hi! %d, %d, %d\n"
	mov	DWORD PTR [esp+4], 600    ; maxlen
	call	_snprintf
	mov	DWORD PTR [esp], ebx      ; s
	call	puts
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret

