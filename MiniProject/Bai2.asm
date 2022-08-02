.data
Message1: .asciiz "Input the integer N:"
Message2: .asciiz "Input the integer M:"
Message3: .asciiz "An error has occurred (M < N)"
.text

check_inputN:	addi $v0, $zero, 51		# Read input N
		la $a0, Message1
		syscall
		bne $a1, 0, check_inputN	# if $a1 != 0: an error has occurred, branch to check_inputN
		nop
		add $s0, $zero, $a0		# Store N in $s0

check_inputM:
		addi $v0, $zero, 51		# Read input N
		la $a0, Message2
		syscall
		bne $a1, 0, check_inputM	# if $a1 != 0: an error has occurred, branch to check_inputM
		nop
		add $s1, $zero, $a0		# Store M in $s1

		slt $t0, $s1, $s0		# if M < N: an error has occurred, end program
		bne $t0, 1, ok
		nop
		addi $v0, $zero, 55
		la $a0, Message3
		syscall
		j done
		nop
ok:		
		add $s2, $zero, $s0		# initialize current_number = N
		slti $t0, $s2, 2		# if current_number < 2 then current_number = 2
		bne $t0, 1, main_loop	
		nop	
		addi $s2, $zero, 2		# current_number = 2
main_loop:		
		slt $t0, $s1, $s2		# if current_number > M then end program
		beq $t0, 1, done
		nop			
		jal isprime
		nop
		bne $t1, 1, continue		# continue if current_number is non-prime
		nop
		jal print_number		# if current_number is prime number, then print it
		nop
continue:	addi $s2, $s2, 1		# current_number = current_number + 1		
		j main_loop
		


		
		
		




isprime:
push:		addi $sp, $sp, -12		# adjust the stack pointer
		sw $s0, 8($sp)			# store $s0 (N)
		sw $s1, 4($sp)			# store $s1 (M)
		sw $s2, 0($sp)			# store $s2 (current_number)

work:		addi $t1, $zero, 1		# initialize return value = 1 (if $t1 = 1 then current_number is prime number)
		srl $s1, $s2, 1			# temp = current_number/2
		addi $s3, $zero, 2		# initialize i = 2
loop:
		slt $t0, $s1, $s3		# if i > temp then end procedure
		beq $t0, 1, pop 
		nop
		div $s4, $s2, $s3		# $s4 = current_number / i 
		mul $s4, $s4, $s3		# $s4 = $s4 * i
		slt $t0, $s4, $s2		# if ($s4 = current_number) then current_number is divisible by i 
		bne $t0, 1, noprime		# curent_number is non-prime number
		nop
		addi $s3, $s3, 1		# i = i+1
		j loop
		nop
noprime:
		add $t1, $zero, $zero		# set $t1 = 0, end procedure	
pop:		lw $s2, 0($sp)			# restore $s2 (current_number)
		lw $s1, 4($sp)			# restore $s1 (M)
		lw $s0, 8($sp)			# restore $s0 (N)
		addi $sp, $sp, 12		# adjust the stack pointer
		jr $ra				# end procedure


print_number:
		addi $v0, $zero, 1		
		add $a0, $zero, $s2
		syscall
		addi $v0, $zero, 11
		li $a0, ' '
		syscall
		jr $ra
done:

