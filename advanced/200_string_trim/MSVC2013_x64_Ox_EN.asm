s$ = 8
str_trim PROC

; RCX is the first function argument and it always holds pointer to the string
	mov	rdx, rcx
; this is strlen() function inlined right here:
; set RAX to 0xFFFFFFFFFFFFFFFF (-1)
	or	rax, -1
$LL14@str_trim:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT $LL14@str_trim
; is the input string length zero? exit then:
	test	rax, rax
	je	SHORT $LN15@str_trim
; RAX holds string length
	dec	rcx
; RCX = s-1
	mov	r8d, 1
	add	rcx, rax
; RCX = s-1+strlen(s), i.e., this is the address of the last character in the string
	sub	r8, rdx
; R8 = 1-s
$LL6@str_trim:
; load the last character of the string:
; jump, if its code is 13 or 10:
	movzx	eax, BYTE PTR [rcx]
	cmp	al, 13
	je	SHORT $LN2@str_trim
	cmp	al, 10
	jne	SHORT $LN15@str_trim
$LN2@str_trim:
; the last character has a 13 or 10 code
; write zero at this place:
	mov	BYTE PTR [rcx], 0
; decrement address of the last character,
; so it will point to the character before the one which has just been erased:
	dec	rcx
	lea	rax, QWORD PTR [r8+rcx]
; RAX = 1 - s + address of the current last character
; thus we can determine if we reached the first character and we need to stop, if it is so
	test	rax, rax
	jne	SHORT $LL6@str_trim
$LN15@str_trim:
	mov	rax, rdx
	ret	0
str_trim ENDP
