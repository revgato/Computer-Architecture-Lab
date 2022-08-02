#Laboratory Exercise 4, Home Assignment 4c
#not $s0,s1 - convert to real-instructions of MIPS
# 20194484
.text
addiu $s1, $zero, 4484 # load test value word
addiu $s3, $zero, 0xffffffff # $s3 store 0xffffffff value
xor $s0, $s1, $s3	# $s0 = invert bit of $s1