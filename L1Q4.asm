MAIN:
#s0 corresponde ao a. $s1 corresponde ao b. 
addi $s0, $zero, 1 #Adicionando valor no registrador $s0
addi $s1, $zero, 5 #Adicionando valor no registrador $s1
slt $t1, $s0 , $s1 #Verificando se B é menor que A
beq $t1, $zero , SET_V1_1
addi $v0, $zero, 0 #Adicionando valor no registrador $v0 (que corresponderá a soma total dos números no intervalo)
LOOP:

add $v0 , $v0, $s0 #Incrementa o $v0 com o valor do número atual
addi $s0, $s0 ,1 #Incrementa o valor do $s0 em +1, assim indo para o próximo valor dentro do intervalo
beq $s0, $s1, EQUAL_END_LOOP #Acaba o loop, necessitando apenas um último incremento no $v0 (O valor onde a=b)
jal LOOP

SET_V1_1: 
addi $v1, $zero, 1 #Registrador $v1 (v) recebe o valor de 1, pois a>b.
j EXIT

EQUAL_END_LOOP:
add $v0, $v0, $s1 #útlimo incremento, quando (a=b)
EXIT:
  #Se a>b , o registrador $v1 estará com o valor 1.
  #Caso contrário, a soma dos números no intervalo estará no registrador $v0
	
