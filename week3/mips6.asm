#Laboratory 3, Home Assigment 6
.data 
A: .word 2, 0, 1, -9, 4, 4, -8, 4		#We will tind the element with the largest absolute value in a list A
.text
la $s2, A	#Load A address
li $s0, 8	#$s0 = Number of element in array (n)aba
li $s1, -1	#default value of i is -1
li $t2, 0	#initial max_abs value is 0
lw $s3, 0($s2)	#initial max abs element is A[0]

loop: addi $s1,$s1,1 	#i=i+1
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
abs $t4, $t0	#$t4 is absolute value of A[i]
slt $t3, $t2, $t4	#max abs < abs(A[i])
bne $t3, $zero, else	#branch to else if max < abs(A[i])
j continue
else:
add $t2, $zero, $t4	#max abs = abs(A[i])
add $s3, $zero, $t0	#max abs element = A[i]
continue:
bne $s0, $s1, loop	#if i != n, goto loop

