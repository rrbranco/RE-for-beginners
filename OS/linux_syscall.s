section	.text
global	_start              

_start:                         
	mov	edx,len	; buffer len
	mov	ecx,msg ; buffer
	mov	ebx,1	; file descriptor. 1 is for stdout
	mov	eax,4	; syscall number. 4 is for sys_write
	int	0x80                

	mov	eax,1	; syscall number. 1 is for sys_exit
	int	0x80                

section	.data

msg	db  'Hello, world!',0xa
len	equ $ - msg             
