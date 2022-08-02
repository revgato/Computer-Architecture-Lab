.data
array:  .space 400	#100 elements
prompt: .asciiz "Enter an integer (0 to quit) :"
mes1:	.asciiz "Before sorted:"
mes2:	.asciiz "\nAfter sorted:"

.text
main:
	la $a2, array		# Load address of array

read_array:
    	li $v0, 51		# Input int mode	
    	la $a0, prompt		# Message
    	syscall
    
    	bne $a1, 0, read_array	# If $a1 != 0: an error has occurred, get input again
   	nop
    
  	beqz $a0, read_done	# If A[i] = 0, exit read_array
	nop

    	sw $a0, 0($a2)		# Save to A[i]
    	addiu $a2, $a2, 4	# Move to next element
    
    	j read_array		# Loop to read array
    	nop
    
read_done:
	addi $a1,$a2,-4		# $a1 = Address(array[n-1])
	li $v0, 4		# Print string mode
	la $a0, mes1
	syscall
	la $a0,array		# $a0 = Address(array[0])
	addi $a3,$a0,0		# Mark first element
	jal print_array
	nop
	la $a0,array		# $a0 = Address(array[0])
	addi $a3,$a0,0		# Remark first element
	addi $t8,$a1,0		# Mark last element
	j sort 			# sort
	nop
	
end:
	li $v0, 4		# Print string mode
	la $a0, mes2
	syscall
	
	addi $a1,$t8,0		#Load last element
	jal print_array
	li $v0, 10		#exit
	syscall
	
sort:
	beq $a0,$a1,done	#single element list is sorted
	j max			#call the max procedure
	nop
	
after_max: 
	addi $a1,$a1,-4		# Decrement pointer to last element
	j sort			# Repeat sort for smaller list
	nop
	
done:
	j end
	nop
	
max:
	addi $v0,$a0,0		# Init pointer to first element
		
loop:
	beq $v0,$a1,ret 	# If now=last, return
	lw $t1,0($v0) 		# Load current element into $t1
	slt $t3,$t1,$zero	# Check if (now) < 0
	bne $t3, $zero, skip	# If < 0, skip this element
	nop
	addi $v1,$v0,0		# $v1 = Address(current element)
	
find_next:
	addi $v1,$v1,4		# Point to next element
	slt $t3,$a1,$v1		# If next element out of range
	bne $t3,$zero,ret	# If out of range, return
	nop
	lw $t2,0($v1)		# Load next element into $t2
	slt $t3,$t2,$zero	# Check if (next) < 0
	bne $t3, $zero, find_next	# If < 0, skip this element, move to next
	nop
	
	slt $t0,$t2,$t1 	# (next) < (now) ?
	addi $t3, $v0, 0 	# Copy v0
	addi $v0, $v0, 4 	# Point to next element
	beq $t0,$zero,loop 	# If (next)>=(now), repeat
	sw $t2,0($t3) 		# Copy A[next] to A[now]
	sw $t1,0($v1) 		# Copy A[now] to A[next]
	j loop 			# Change completed; now repeat
	nop
	
ret:
	j after_max
	
skip:
	addi $v0, $v0, 4 	# Move to next element
	j loop			# Continue loop
	nop
	
print_array:
	addi $v0, $zero, 11
	li $a0, ' '
	syscall
	
	li $v0, 1		# Print int mode
	lw $a0,0($a3)
	syscall
	
	addi $a3, $a3, 4
	slt $t7, $a1, $a3
	beq $t7,$zero,print_array
	nop
	
	jr $ra
	
