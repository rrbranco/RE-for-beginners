mov	esi, 1
...	; some code not touching ESI
dec	esi
...	; some code not touching ESI
cmp	esi, 0
jz	real_code
; fake luggage
real_code:
