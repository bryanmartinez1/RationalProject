#Prints out the number inputted and if it is rational or irrational
.macro print_rational (%resultNum, %resultDen)
# Prints out Open Side Parentheses		
	li $a0, '('
	li $v0, 11    # print_character
	syscall
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
# Prints out Closed SideParentheses	
	li $a0, ')'
	li $v0, 11    # print_character
	syscall
	
	is_rational(%resultDen)
.end_macro 

# This is Addition between two rational numbers
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

# This is Subtraction between two rational numbers
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

# This is Multiplication between two rational numbers
.macro mul_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %num2
	mflo $t0
	add %resultNum, $t0, $zero
	mult %den1, %den2
	mflo $t1
	add %resultDen, $t1, $zero
.end_macro

# This is Divison between two rational numbers
.macro div_rational (%num1, %den1,%num2, %den2, %resultNum, %resultDen)
	mult %num1, %den2
	mflo $t0
	add %resultNum, $t0, $zero
	mult %den1, %num2
	mflo $t1
	add %resultDen, $t1, $zero
.end_macro

#Checks to see if what is inputted is rational
.macro is_rational (%den)
	beq $zero,%den,, is_zero
	rational
.end_macro


# This Prints out the whole operation including result
.macro print_operation(%num1, %den1, %num2, %den2, %resultNum, %resultDen, %sign)
	print_rational(%num1, %den1)
	print_sign(%sign)
	print_rational(%num2, %den2)
	print_equal
	print_rational(%resultNum, %resultDen)
	print_newLine
	
.end_macro

# Prints out Operation Sign
.macro print_sign (%sign)
	li $v0, 11
	li $a0, %sign
	syscall
.end_macro

# Prints out Equal Sign
.macro print_equal 
	li $v0, 11
	li $a0, '='
	syscall
.end_macro

# Prints out New Line	
.macro print_newLine
	li $v0, 11
	li $a0, '\n'
	syscall
.end_macro

.macro rational
	.data
		rational: .asciiz "Rational"
	.text
	li $v0, 4
	la $a0, rational
	syscall
.end_macro

.macro irrational
	.data
		error: .asciiz "Irrational"
	.text
	li $v0, 4
	la $a0, error
	syscall
.end_macro

main :
	addi $s0, $zero, 1
	addi $s1, $zero, 4
	addi $s2, $zero, 0
	addi $s3, $zero, 3
	
	print_rational($s0,$s1)
	print_newLine
	print_rational($s2,$s3)
	print_newLine
	add_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_operation($s0, $s1, $s2, $s3,$s4, $s5, '+')
	sub_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_operation($s0, $s1, $s2, $s3,$s4, $s5, '-')
	mul_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_operation($s0, $s1, $s2, $s3,$s4, $s5, '*')
	div_rational($s0, $s1, $s2, $s3,$s4, $s5)
	print_operation($s0, $s1, $s2, $s3,$s4, $s5, '/')
is_zero:
	irrational