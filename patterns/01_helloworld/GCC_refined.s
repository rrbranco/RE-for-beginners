.LC0:
	.string	"hello, world\n"
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
