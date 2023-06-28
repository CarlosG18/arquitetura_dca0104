# aluno: Carlos Gabriel Medeiros da Silva
# matricula: 20200074567

.data 
# alocando 10 espaços correspondentes a um vetor do indicie 0 até o 9
H: .space 40
# vetor v - sinais obtidos entre 0 a 9
v: .word 9, 5, 7, 5, 3, 4, 0, 2, 6, 4, 2, 5, 4, 1, 2, 1, 6, 2, 2, 3, 6, 3, 0, 0, 7, 8, 3, 4, 5, 4, 0, 5, 2, 9, 8, 7
# definindo o tamanho maximo de intensidade
Lmax: .word 9
# definido o tamanho de elementos do vetor
TAM: .word 36

.text
  main:

  # inicializando o vetor H com o valor 0 para cada indicie 
    la $t0, H # obtendo o endereço base de H e colocando no registrador temporario $t0
    la $t1, Lmax # obtendo o endereço de Lmax e colocando no registrador temporario $t1
    lw $t2, 0($t1) # obtendo o valor do endereço de $t1 e colocando no registrador temporario $t2
    
    loop: # loop para percorrer o vetor H
      sw $zero, 0($t0) # carrega o valor zero no endereço ao qual o registrador $t0 possui que é correspondente a alguma posição do vetor H 
      addiu $t0, $t0, 4 # incrementa o endereço carregado em $t0 em 4 bytes, ou seja, acessando o proximo indicie do vetor H
      addiu $t2, $t2, -1 # decrementando o valor que esta armazenado no registrador $t2, ou seja decrementa o valor de Lmax
      bgez $t2, loop # verifica se o registrador $t2 é maior ou igual a zero, se for ele seguirá para o rotulo loop, caso contrário, ele seguirá com o fluxo padrão do codigo
      
    la $t5, v # obtendo o endereço base de v e colocando no registrador temporario $t5
    la $s1, TAM # obtendo o endereço de TAM e colocando no registrador $s1
    lw $s2, 0($s1) # obtendo o valor do endereço de $s1 e colocando no registrador $s2 
    li $s3, 4 # alocando o valor 4 no registrador $s3
    la $t0, H # obtendo o endereço base de H e colocando no registrador temporario $t0
      
    loopv: # loop para preencher o vetor H
      lw $t4, 0($t5) # carregando em $t4 o valor que esta no endereço aramezenado pelo registrador $t5 
      mult $t4, $s3 # multiplicando o valor de $t4 pelo valor que esta armazenado no registrador $s3 que é 4
      mflo $s4 # movendo o resultado da multiplicação para o registrador $s4, esse valor será os saltos que precisará fazer no vetor H para indicar a posição correta para realizar o incremento
      add $s5, $s4, $t0 # fazendo a soma do endereço base do vetor H que esta no resgistrador $t0 com os bites que deverao ser somados ao qual esta no registrador $s4 
      lw $t6, 0($s5) # obtendo o valor correspondente do elemento no vetor H e atribuindo ao registrador $t6
      addiu $t6, $t6, 1 # incrementa o valor que esta no registrador $t6
      sw $t6, 0($s5) # faz o carregamento do valor aramezenado no registrador $t6 para o endereço apontado pelo registrador $s5 que será o indicie adequado do vetor H
      addiu $t5, $t5, 4 # incrementa o endereço carregado em $t5 em 4 bytes, ou seja, acessando o proximo indicie do vetor v
      addiu $s2, $s2, -1 # decrementando o valor que esta armazenado no registrador $s2, ou seja decrementa o valor de TAM
      bne $s2,$zero, loopv # verifica se a o registrador $s2 igual a zero, se não for ele seguirá para o rotulo loopv, caso contrário, ele seguirá com o fluxo padrão do codigo
    
    # imprimindo os valores do vetor do histograma H
    la $t0, H # obtendo o endereço base de H e colocando no registrador temporario $t0
    la $t1, Lmax # obtendo o endereço de Lmax e colocando no registrador temporario $t1
    lw $t2, 0($t1) # obtendo o valor do endereço de $t1 e colocando no registrador temporario $t2
    
    looph: # loop para acessar os indicies do vetor H e imprimir
      lw $t3, 0($t0) # carregando o valor do endereço de $t0 e colocando no registrador $t3, equivalente a obter o elemento do vetor H
      li $v0, 1 # carregando no registrador $v0 o numero 1 indicando ao sistema que terá uma chamada do sistema brevemente para realizar a impressão de um numero
      move $a0, $t3 # move o valor de $t3 para o registrador $a0
      syscall # faz a chamada de sistema realizando a impressao do numero que esta armazenado no registrador $t3
      addiu $t0, $t0, 4 # incrementa o endereço carregado em $t0 em 4 bytes, ou seja, acessando o proximo indicie do vetor H
      addiu $t2, $t2, -1 # decrementando o valor que esta armazenado no registrador $t2, ou seja decrementa o valor de Lmax
      bgez $t2, looph # verifica se a o registrador $t2 é maior ou igual a zero, se for ele seguirá para o rotulo loop, caso contrário, ele seguirá com o fluxo padrão do codigo
    
    li $v0, 10 # carregando no registrador $v0 o numero 10 indicando ao sistema que terá uma chamada do sistema brevemente para realizar o encerramento do programa
    syscall # realiza o encerramento do programa
