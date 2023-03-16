# Subtracting
.data 
    	forwardslash: .byte '/'

.text
    	addi $t0, $zero, 1
	addi $t1, $zero, 4
	addi $t2, $zero, 1
	addi $t3, $zero, 3
    
    	mul $t0, $t0, $t3
    	mul $t2, $t2, $t1
    	mul $s1, $t1, $t3
    	sub $s0, $t0, $t2
# Prints out Numerator    
    	li $v0, 1
    	add $a0, $zero, $s0
    	syscall
# Prints out Forwardslash    
    	li $v0, 4
    	la $a0, forwardslash
    	syscall
# Prints out Denominator
    	li $v0, 1
    	add $a0, $zero, $s1
    	syscall
    	