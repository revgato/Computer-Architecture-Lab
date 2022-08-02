#Laboratory Exercise 4, Home Assignment 4d
# ble $s1,s2,L - convert to real-instructions of MIPS
# 20194484
addi $s1, $zero, 2019
addi $s2, $zero, 4484
slt $s0, $s1, $s2  # $s0 = 1 if $s1 < $s2
bne $s0, $zero, L  # if $s0 = 1 then branch to L 
addi $t1, $zero, 1 # if $s1 > $s2 then $t1 = 1
j done
L:
addi $t1, $zero, 2 # if $s1 < $s2 then $t1 = 2
done:

