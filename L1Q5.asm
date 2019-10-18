MAIN:
#s0 corresponde ao a. $s1 corresponde ao b. 
addi $s0, $zero,3 #Adicionando valor no registrador $s00,
addi $s1, $zero, -1 #Adicionando valor no registrador $s2
addi $v0, $zero, 0 #Registrador auxiliar para guardar o sinal de $s0 (1 para negativo, 0 para positivo)
addi $v1, $zero, 0 #Registrador auxiliar para guardar o sinal de $s1 (1 para negativo, 0 para positivo)
slt $v0, $s0, $zero #Verificando se a<0 ($zero<$s0)
slt $v1, $s1, $zero #Verificando se b<0 ($s1<$zero)

addi $t0, $zero, 0 #Adicionando valor no registrador $t0 que será o valor da multiplicação

MULT: #Realização da multiplicação entre os dois numeros (Somando o $s1, $s0 vezes.)
beq $s0, $zero, SINAL #Caso base, quando o $s0 chegar em 0.
add $t0, $t0, $s1 #Somando o número $s1 ao registrador $t0
j INCREMENTO 

INCREMENTO: #Label para saber se o $s0 precisa ser incrementado ou decrementado para chegar em 0
	slt $t1, $zero, $s0 #Se $s0 for negativo, o incremento será de 1
	beq $t1, $zero, INCREMENTO_POSITIVO
	addi $s0, $s0, -1 #Se $s0 for positivo, será subtraido -1.
	j MULT

INCREMENTO_POSITIVO: #Label de incrementar +1
	addi $s0, $s0 , 1
	j MULT

INVERTE_SINAL: #Label de inverter o sinal
	sub $t0, $zero, $t0
	j EXIT

POSITIVO: #Se o sinal de $t0 for positivo
	slt $t1, $zero, $t0 #Primeiro, verifica-se se $t0 já é positivo.
	beq $t1, $zero, INVERTE_SINAL #Caso $t0 não seja positivo, é necessário inverter o sinal de $t0.
	j EXIT
	
SINAL: #Após realizar a multiplicação , verificará qual será o sinal do número
	beq $v0, $v1, POSITIVO #Se ambos os sinais forem iguais, o número será positivo, caso contrário, negativo.
	NEGATIVO: #Se o sinal final de $t0 for negativo
	slt $t1, $zero, $t0 #Se o sinal final ($t0) for negativo, primeiro verifica se $to já é negativo.
	bne $t1, $zero, INVERTE_SINAL #Caso $t0 já seja negativo, não é necessário inverter o sinal, caso contrário, é necessário.
EXIT:
#Resultado da multiplicação estará no registrador $t0
