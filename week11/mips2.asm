.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
 li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh


 li $s1, 0
 li $s2, 252
 li $s3, 4
 li $s4, WHITE
 jal paint		# Background = WHITE
 nop
 
 b1:
 li $s1, 40
 li $s2, 212
 li $s3, 32
 li $s4, RED
 jal paint		
 nop
 
  b2:
 li $s1, 40
 li $s2, 52
 li $s3, 4
 li $s4, RED
 jal paint		
 nop
 
 b3:
 li $s1, 52
 li $s2, 212
 li $s3, 32
 li $s4, RED
 jal paint		
 nop
 
 b4:
 li $s1, 200
 li $s2, 212
 li $s3, 4
 li $s4, RED
 jal paint		
 nop 
 
 b5:
 li $s1, 108
 li $s2, 112
 li $s3, 4
 li $s4, RED
 jal paint		
 nop
 
  b6:
 li $s1, 52
 li $s2, 56
 li $s3, 4
 li $s4, WHITE
 jal paint		
 nop
 
  b7:
 li $s1, 212
 li $s2, 214
 li $s3, 4
 li $s4, WHITE
 jal paint		
 nop

 j end
 

 
 

 
 paint:
 add $t2, $zero, $s1		# $s1 = begin
 loop:
 bgt $t2, $s2, endloop		# $s2 = end
 nop
 add $t1, $k0, $t2 		# $t1 = address of place
 add $t0, $zero, $s4		# $s4 = COLOR		
 sw $t0, 0($t1)
 add $t2, $t2, $s3		# $s3 = step
 j loop
 nop
 endloop:
 jr $ra
 end: