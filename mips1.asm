.macro print_rational (%resultNum, %resultDen)
# Prints out Numerator	
	li $v0, 1
	add $a0, $zero, %resultNum
	syscall
# Prints out Forwardslash	
	li $a0, '/'
	li $v0, 11    # print_character
	syscall
# Prints out Denominator
	li $v0, 1
	add $a0, $zero, %resultDen
	syscall
.end_macro 

.macro add_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %den2
	mflo $t0
	mult %num2, %den1
	mflo $t1
	add %resultNum, $t0, $t1
	mult %den1, %den2
	mflo $t2
	add %resultDen, $t2, $zero
.end_macro

.macro sub_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %den2
	mflo $t0
	mult %num2, %den1
	mflo $t1
	sub %resultNum, $t0, $t1
	mult %den1, %den2
	mflo $t2
	add %resultDen, $t2, $zero
.end_macro

.macro mul_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %num2
	mflo $t0
	add %resultNum, $t0, $zero
	mult %den1, %den2
	mflo $t1
	add %resultDen, $t1, $zero
.end_macro

.macro div_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %den2
	mflo $t0
	add %resultNum, $t0, $zero
	mult %den1, %num2
	mflo $t1
	add %resultDen, $t1, $zero
.end_macro

.macro is_relational (%den)
	
.end_macro

main :
	addi $s0, $zero, 1
	addi $s1, $zero, 2
	addi $s2, $zero, 1
	addi $s3, $zero, 2
	add_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_rational($s4, $s5)
	sub_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_rational($s4, $s5)
	mul_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_rational($s4, $s5)
	div_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_rational($s4, $s5)