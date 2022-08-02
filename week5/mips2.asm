#Laboratory Exercise 5, Assignment 2
.data
Message1: .asciiz "The sum of ("
Message2: .asciiz ") and ("
Message3: .asciiz ") is ("
Message4: .asciiz ")"
.text
addi $s0, $zero, 0x01341330	# $s0 = 20190000
addi $s1, $zero, 0x1184		# $s1 = 4484
add $s2, $s1, $s0		# $s2 = $s1 + $s0
addi $v0, $zero, 4 		# print string
la $a0, Message1		
syscall

addi $v0, $zero, 1 		# print integer
add $a0, $zero, $s0		# $a0 = $s0
syscall

addi $v0, $zero, 4 		# print string
la $a0, Message2
syscall 

addi $v0, $zero, 1 		# print integer
add $a0, $zero, $s1		# $a0 = $s1
syscall

addi $v0, $zero, 4 		# print string
la $a0, Message3
syscall 

addi $v0, $zero, 1 		# print integer
add $a0, $zero, $s2		# $a0 = $s2
syscall

addi $v0, $zero, 4 		# print string
la $a0, Message4
syscall