.data
Message1: .asciiz "Nhap so tu nhien:"
Message2: .asciiz "Chu so lon nhat la: "
.text

addi $v0, $zero, 51		# Nhap vao input N
la $a0, Message1
syscall
add $s0, $zero, $a0		# Luu N vao thanh ghi $s0
add $s4, $zero, $zero		# Khoi tao gia tri max = 0

loop:
	beq $s0, $zero, end		# Neu N == 0 thi in ra gia tri max va ket thuc
	nop
	div $s1, $s0, 10		# $s1 = N / 10 (int)
	mul $s2, $s1, 10		# $s2 = $s1 * 10
	sub $s3, $s0, $s2		# $s3 la so du cua phep chia N / 10
	slt $t0, $s4, $s3		# Neu max < $s3
	bne $t0, 1, continue		# Neu max >= $s3 thi tiep tuc vong lap
	nop
	add $s4, $zero, $s3		# Neu max < $s3 thi max = $s3	
continue:
	div $s0, $s0, 10		# N = N/10
	j loop	
	nop

end:
	addi $v0, $zero, 56		# in ra gia tri max
	la $a0, Message2
	add $a1, $zero, $s4
	syscall
	