MAIN:
#s0 corresponde ao a. $s1 corresponde ao b. $s2 corresponde ao x
addi $s0, $zero, 2 #Adicionando valor no registrador $s0
addi $s1, $zero, 1 #Adicionando valor no registrador $s1
addi $s2, $zero, 0 #Adicionando valor no registrador $s2
slt $t1, $s1, $s2 #Verificando se o b ($s1) é menor que m ($s2)
beq $t1, $zero, IF #Verificando se a condição (#s3>=0) (a>=0) é verdadeira (caso contrário entrará no ELSEIF)
addi $s2, $zero, 0 #Caso ele entre no "ELSE" o registrador $s2(m) recebe 0
j EXIT
IF: 
addi $s2, $s1, 0 #Registrador $s2 (m) recebe o valor de $s1 (b)
EXIT:
