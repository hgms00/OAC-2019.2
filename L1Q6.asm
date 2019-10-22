 #A sequencia de Fibonacci considerada é a : 1,1,2,3,5,8... ou seja, desconsiderando o 0 inicial.
MAIN:
addi $s0, $zero, 5 #Registrador s0 informará o número a ser bucado

beq $s0, $zero, EXIT #Programa acabará se o 0 número (Inexistente, se começarmos a contar do 1) da sequência for pedido

addi $s2, $zero, 1 #Registrador s2 salvará o número atual
addi $s1, $zero, 0 #Registrador s1 salvará o número anterior 
jal LOOP

RECURSAO:
	addi $sp, $sp , -16 #Alocar 4 posiçoes na pilha
	sw $ra, 12($sp) #Salvando o endereço na pilha
	sw $s0, 8($sp) #Salvando o contador
	sw $s1, 4($sp) #Salvando o anterior
	sw $s2, 0($sp)  # Salvando o atual na pilha
	beq $s0, $zero, EXIT #CASO BASE DO LOOP, ONDE O REGISTRADOR QUE SALVARÁ O CONTADOR, SERÁ IGUAL A 0.
	jr $ra  # Voltar onde o $ra foi chamado

LOOP:
	add $s3, $s2, $s1 #Registrador $s3 guardará a soma entre $s1 e $s2
	addi $s1 , $s2, 0 #O registrador $s1 guardará o valor que era o ATUAL(se tornando o "valor anterior")
	addi $s2, $s3,0 #O valor ATUAL é atualizado no registrador $s2
	addi $s0, $s0, -1 #Decremento do contador
	
	jal RECURSAO

	lw $ra, 12($sp) #Carregar o valor do endereço na pilha
	lw $s0, 8($sp) #Carregar o valor do contador na pilha
	lw $s1, 4($sp) #Carregar o valor do anterior na pilha
	lw $s2, 0($sp) #Carregar o valor do atual na pilha
	addi $sp,$sp,16
	jal LOOP
EXIT:	
    #Registrador $s2 mostrará o resultado
