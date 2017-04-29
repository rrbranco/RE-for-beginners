my_max:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; vergleiche A und B:
	cmp	edx, eax
; falls A>=B, lade Wert A nach EAX
; §ansonsten (falls A<B) führe Befehl ohne Auswirkung aus§
	cmovge	eax, edx
	ret

my_min:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; vergleiche A und B:
	cmp	edx, eax
; falls A<=B, lade Wert A nach EAX
; §ansonsten (falls A>B) führe Befehl ohne Auswirkung aus§
	cmovle	eax, edx
	ret
