#Laboratory Exercise 5, Assignment 1
.data
test: .asciiz "Hoang Quoc Bao"
.text
li $v0, 4
la $a0, test
syscall