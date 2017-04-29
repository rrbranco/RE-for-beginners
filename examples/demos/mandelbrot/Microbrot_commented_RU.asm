; X это столбец на экране
; Y это строка на экране


; X=0, Y=0              X=319, Y=0
; +------------------------------->
; |
; |
; |
; |
; |
; |
; v
; X=0, Y=199            X=319, Y=199


; переключиться в графический видеорежим VGA 320*200*256
mov al,13h
int 10h
; в самом начале BX равен 0
; в самом начале DI равен 0xFFFE
; DS:BX (§или§ DS:0) указывает на Program Segment Prefix в этот момент
; ... первые 4 байта которого этого CD 20 FF 9F
les ax,[bx]
; ES:AX=9FFF:20CD

FillLoop:
; установить DX в 0. CWD работает так: DX:AX = sign_extend(AX). 
; AX здесь 0x20CD (§в начале§) или меньше 320 (§когда§ §вернемся§ §после§ §цикла§),
; так что DX всегда будет 0.
cwd 
mov ax,di
; AX это текущий указатель внутри §VGA-буфера§
; разделить текущий указатель на 320
mov cx,320
div cx
; DX (start_X) - остаток (§столбец§: 0..319); AX - результат (§строка§: 0..199)
sub ax,100
; AX=AX-100, так что AX (start_Y) сейчас в пределах -100..99
; DX в пределах 0..319 или 0x0000..0x013F
dec dh
; DX сейчас в пределах 0xFF00..0x003F (-256..63)

xor bx,bx
xor si,si
; BX (temp_X)=0; SI (temp_Y)=0

; получить максимальное количество итераций
; CX всё еще 320 здесь, так что это будет максимальным количеством итераций
MandelLoop:
mov bp,si      ; BP = temp_Y
imul si,bx     ; SI = temp_X*temp_Y
add si,si      ; SI = SI*2 = (temp_X*temp_Y)*2
imul bx,bx     ; BX = BX^2 = temp_X^2
jo MandelBreak ; переполнение?
imul bp,bp     ; BP = BP^2 = temp_Y^2
jo MandelBreak ; переполнение?
add bx,bp      ; BX = BX+BP = temp_X^2 + temp_Y^2
jo MandelBreak ; переполнение?
sub bx,bp      ; BX = BX-BP = temp_X^2 + temp_Y^2 - temp_Y^2 = temp_X^2
sub bx,bp      ; BX = BX-BP = temp_X^2 - temp_Y^2

; скорректировать масштаб:
sar bx,6       ; BX=BX/64
add bx,dx      ; BX=BX+start_X
; здесь temp_X = temp_X^2 - temp_Y^2 + start_X
sar si,6       ; SI=SI/64
add si,ax      ; SI=SI+start_Y
; здесь temp_Y = (temp_X*temp_Y)*2 + start_Y

loop MandelLoop

MandelBreak:
; CX=§итерации§
xchg ax,cx
; AX=§итерации§. записать AL в §VGA-буфер§ на ES:[DI]
stosb
; stosb также инкрементирует DI, так что DI теперь указывает на следующую точку в §VGA-буфере§
; всегда переходим, так что это вечный цикл
jmp FillLoop
