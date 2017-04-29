$SG1355	DB	'it is ten', 00H
$SG1356	DB	'it is not ten', 00H

a$ = 8
f	PROC
; загрузить указатели на обе строки
	lea	rdx, OFFSET FLAT:$SG1355 ; 'it is ten'
	lea	rax, OFFSET FLAT:$SG1356 ; 'it is not ten'
; сравнить входное значение с 10
	cmp	ecx, 10
; если равно, скопировать значение из RDX ("it is ten")
; если нет, ничего не делаем. указатель на строку "it is not ten" всё еще в RAX.
	cmove	rax, rdx
	ret	0
f	ENDP
