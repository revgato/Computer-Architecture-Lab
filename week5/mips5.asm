#Laboratory Exercise 5, Assignment 5
.data
string: .space 100
Message1: .asciiz "Nhap xau: "
Message2: .asciiz "Xau dao nguoc: "
.text
addi $v0, $zero, 4	# printf Message1
la $a0, Message1
syscall

addi $v0, $zero, 8
la $a0, string
li $a1, 20		# set max length = 20
syscall

addi $v0, $zero, 4	# printf Message2
la $a0, Message2
syscall

print_inverse_string:
la $t0, string		# $t0 = string[0]
find_strlen:
add $s1, $t0, $t1	# $t1 = i, $s1 = address of string[i]
lb $s0, 0($s1)		# s0 = string[i]
beq $s0, $zero, traverse_inverse	# branch if i == strlen(string)	
addi $t1, $t1, 1	# i++
j find_strlen

traverse_inverse:
addi $v0, $zero, 11	#print char
print_char:
addi $t1, $t1, -1	# i--
add $s1, $t0, $t1	# s1 = address of string[i]
lb $a0, 0($s1)		# $a0 = string[i]
syscall
beq $t1, $zero, done	# if i == 0 then done
j print_char
done: