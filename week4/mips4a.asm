#Laboratory Exercise 4, Home Assignment 4a 
#abs $s0,s1 - convert to real-instructions of MIPS
# 20194484
.text
addiu $s1, $zero, -3 # load test value word
addiu $s3, $zero, 0xffffffff # $s3 store 0xffffffff value
bltz $s1, else # Branch if $s1 < 0
add $s0, $s1, $zero # $s0 = $s1
j done
else:
addi $s0, $s1, -1   # $s0 = $s1 - 1
xor $s0, $s0, $s3   # Bit invert $s0
done:
 