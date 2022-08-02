#Laboratory Exercise 3, Home Assignment 1
.data 
i : .word 4484
j : .word 2019
.text
start:
la $t4, i	#Load address of i
lw $s1, 0($t4)	#$s1 = i 
la $t4, j	#Load address of j
lw $s2, 0($t4)	#$s2 = j
addi $t1, $zero, 1     #$t1 = x = 1
addi $t2, $zero, 2	#$t2 = y = 2
addi $t3, $zero, 3	#$t3 = z = 3
slt $t0,$s2,$s1 # j<i
bne $t0,$zero,else # branch to else if j<i
addi $t1,$t1,1 # then part: x=x+1
addi $t3,$zero,1 # z=1
j endif # skip “else” part
else: addi $t2,$t2,-1 # begin else part: y=y-1
add $t3,$t3,$t3 # z=2*z
endif: