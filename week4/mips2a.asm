#Laboratory Exercise 4, Home Assignment 2a
#Extract MSB of $s0
.text
li $s0, 0x20194484 #load test value for these function
andi $t0, $s0, 0xff000000 #Extract the MSB of $s0