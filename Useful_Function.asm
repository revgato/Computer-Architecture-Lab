# input from keyboard and check condition
check_inputN:	addi $v0, $zero, 51		# Read input N
		la $a0, Message1
		syscall
		bne $a1, 0, check_inputN	# if $a1 != 0: an error has occurred, branch to check_inputN
		nop
		add $s0, $zero, $a0		# Store N in $s0

# show warning dialog
		addi $v0, $zero, 55
		la $a0, Message3
		syscall
		
# work with procedure
procedure:
push:		addi $sp, $sp, -12		# adjust the stack pointer
		sw $s0, 8($sp)			# store $s0
		sw $s1, 4($sp)			# store $s1
		sw $s2, 0($sp)			# store $s2

work:		add $v0, $zero, $zero		# initialize return value = 0 (if $v0 = 1 then this number is prime number)
		nop
		nop  
		
pop:		lw $s2, 0($sp)			# restore $s2
		lw $s1, 4($sp)			# restore $s1
		lw $s0, 8($sp)			# restore $s0
		addi $sp, $sp, 12		# adjust the stack pointer
		jr $ra				# end procedure
