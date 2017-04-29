mov	esi, 1
...	; §какой-то§ не трогающий ESI код
dec	esi
...	; §какой-то§ не трогающий ESI код
cmp	esi, 0
jz	real_code
; фальшивый багаж
real_code:
