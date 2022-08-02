#Laboratory Exercise 4, Home Assignment 2b
#Clear LSB of $s0
.text
li $s0, 0x20194484 #load test value for these function
andi $s0, $s0, 0xffffff00 #Clear LSB of $s0
