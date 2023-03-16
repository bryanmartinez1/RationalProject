# Multiplication
.data 
    	forwardslash: .byte '/'

.text
    	addi $t0, $zero, 1
	addi $t1, $zero, 4
	addi $t2, $zero, 1
	addi $t3, $zero, 3
    
    	mul $s0, $t0, $t2
    	mul $s1, $t1, $t3

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