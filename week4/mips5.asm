#Laboratory Exercise 4, Assignment 5
# Write a program that implement multiply by a small power of 2. (2, 4, 8, 16, ...)
.text
li $t0 4 	# $t0 is factor
li $s0 4484	# $s0 is factor
repeat:
srl $t0, $t0, 1
beq $t0, $zero, exit
sll $s0, $s0, 1
j repeat
exit:
