	...

	mov	X, 123
	mov	Y, 456
	call	do_something

	...

X	dd	?
Y	dd	?

do_something proc near
	; take X
	; take Y
	; do something
	retn
do_something endp
