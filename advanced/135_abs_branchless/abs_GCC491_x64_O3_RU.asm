my_abs:
	mov	edx, edi
	mov	eax, edi
	sar	edx, 31
; EDX здесь 0xFFFFFFFF если знак входного значения -- минус
; EDX ноль если знак входного значения -- плюс (§включая§ §ноль§)
; следующие две инструкции имеют эффект только если EDX равен 0xFFFFFFFF
; либо не работают, если EDX -- ноль
	xor	eax, edx
	sub	eax, edx
	ret
