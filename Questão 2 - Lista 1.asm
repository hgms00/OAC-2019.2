MAIN:
#s3 corresponde ao a. $s4 corresponde ao b. $s5 corresponde ao x
addi $s3, $zero, -2 #Adicionando valor no registrador $s3
addi $s4, $zero, 3 #Adicionando valor no registrador $s4
addi $s5, $zero, 0 #Adicionando valor no registrador $s5
slt $t1, $zero, $s3 #Verificando se o a ($s3) é maior ou igual que 0 (Utilizando a lógica SLT 0 < a)
slt $t2, $s3, $s4 #Verificando se o $s3 (a) é menor que $s4 (b)
beq $t1, $zero, ELSEIF #Verificando se a condição (#s3>=0) (a>=0) é verdadeira (caso contrário entrará no ELSEIF)
beq $t2, $zero, ELSEIF #Verificando se a condição (#s3<$S4) (a<b) é verdadeira (caso contrário entrará no ELSEIF)
addi $s5, $zero, 1 #Caso ele entre no "IF" o registrador $s5 (x) receberá 1.
j EXIT

ELSEIF: 
slt $t3, $s3, $zero #Verificando se o a ($s3) é menor que zero
slt $t4, $s3, $s4 #Verificando se o a($s4) > b ($s3)
beq $t3, $zero, ELSE #Verificando se a condição ($s3>0) (a>0) é verdadeira (caso contrário entrará no ELSE)
beq $t4, $zero, ELSE #Verificando se a condição ($s4>$s3) (a>b) é verdadeira (caso contrário entrará no ELSE)
#beq $s3, $s4, ELSE #Caso a=b ($s3=$s4), entrará no ELSE
addi $s5, $zero, 2 #Caso ele entre no "ELSEIF" o registrador $s5 (x) receberá 2.
j EXIT
ELSE:
addi $s5, $zero, 3 #Caso ele entre no "ELSE" o registrador $s5 (x) receberá 3.

EXIT:
