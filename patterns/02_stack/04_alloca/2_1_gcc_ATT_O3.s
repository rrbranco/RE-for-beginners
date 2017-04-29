.LC0:
	.string	"hi! %d, %d, %d\n"
f:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$660, %esp
	leal	39(%esp), %ebx
	andl	$-16, %ebx
	movl	%ebx, (%esp)
	movl	$3, 20(%esp)
	movl	$2, 16(%esp)
	movl	$1, 12(%esp)
	movl	$.LC0, 8(%esp)
	movl	$600, 4(%esp)
	call	_snprintf
	movl	%ebx, (%esp)
	call	puts
	movl	-4(%ebp), %ebx
	leave
	ret
