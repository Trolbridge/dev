.data
hw:
	.string "hello world\n"
.text
.globl main
main:
	movl	$SYS_write,%eax
	movl	$1,%ebx
	movl	$hw,%ecx
	movl	$12,%edx
	int	$0x80
	movl	$SYS_exit,%eax
	xorl	%ebx,%ebx
	int	$0x80
	ret
