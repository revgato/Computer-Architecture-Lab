#Laboratory 3, Home Assigment 2
.data 
i: .word 0
n: .word 5
step: .word 1
sum: .word 4484
A: .word 1,2,3,4,5 
.text
la $t4, i	#Load i address
lw $s1, 0($t4)	#$s1 = i
la $t4, n	#Load n address
lw $s3, 0($t4)	#$s3 = n
la $t4, step	#Load step address
lw $s4, 0($t4)	#$s4 = step
la $t4, sum	#Load sum address
lw $s5, 0($t4)	#$s5 = sum
la $s2, A	#Load A address
loop: add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
add $s5,$s5,$t0 #sum=sum+A[i]
bne $s1,$s3,loop #if i != n, goto loop