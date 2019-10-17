MAIN:
addi $s0, $zero, 1 #Registrador s0 informará o número a ser bucado
addi $s3, $zero, 1 #Registrador auxiliar que receberá 1 

beq $s0, $s3, EXIT #Programa acabará caso o PRIMEIRO número da sequência ( 0 ) seja pedido
beq $s0, $zero, EXIT #Programa acabará se o 0 número (Inexistente, se começarmos a contar do 1) da sequência for pedido

addi $s2, $zero, 1 #Registrador s2 salvará o número atual
addi $s1, $zero, 0 #Registrador s1 salvará o número anterior 
addi $s3, $zero , 0 #Registrador auxiliar que salvará o atual
addi $s0 , $s0, -2

LOOP:
	beq $s0, $zero, EXIT #CASO BASE DO LOOP, ONDE O REGISTRADOR QUE SALVARÁ O CONTADOR, SERÁ IGUAL A 0.
	
	add $s3, $s2, $s1 #Registrador $s3 guardará a soma entre $s1 e $s2
	addi $s1 , $s2, 0 #O registrador $s1 guardará o valor que era o ATUAL(se tornando o "valor anterior")
	addi $s2, $s3,0 #O valor ATUAL é atualizado no registrador $s2
	addi $s0, $s0, -1 #Decremento do contador
	
	jal LOOP
EXIT:	
    #Registrador $s2 mostrará o resultado
