#aluno: Carlos Gabriel Medeiros da Silva
#matricula: 20200074567

.data
# definindo os pontos extremos
a: .float 2.00
b: .float 3.00
#definindo o número máximo de iterações
N: .word 10
#definindo a tolerância
TOL: .float 0.1
#definindo variaveis auxiliares
FA: .float 0.0
FP: .float 0.0
p: .float 0.0
dois: .float 2.0
dez: .float -10.0
zero: .float 0.0
saida: .float 0.0

.text
  main:
    li $t0, 1 # definindo i = 1
    la $s0, N # obtendo o endereço de N
    lw $s1, 0($s0) # carrega o valor de N no registrador $s1
    
    #obtendo o valor de de FA = f(a) 
    l.s $f5, a #fazendo o carregamento do valor de a para o $f5, seria equivalente ao argumento da função
    jal func # chamada da função 
    s.s $f6, FA # escreve o valor do $f6 na variavel FA, $f6 seria o equivalente ao retorno da funcao func
   
    loop:
      #obtendo os valores de 'a' e de 'b'
      l.s $f0, a # obtendo o valor de 'a'
      l.s $f1, b # obtendo o valor de 'b'
      
      #realizando a operação p = a + (b-a)/2
      #obtendo a constante 2
      l.s $f2, dois
      #fazendo b-a
      sub.s $f3, $f1, $f0 # $f3 = b - a
      #fazendo (b-a)/2
      div.s $f4, $f3, $f2 # $f4 = $f3/(a = 2)
      #fazendo a soma a + (b-a)/2
      add.s $f5, $f0, $f4 # $f5 = a + $f4, sendo $f5 equivalente ao p.
     
      #escrevendo o valor de do $f5 no p
      s.s $f5, p
      
      #obtendo o valor de FP = f(p)
      l.s $f5, p
      jal func
      s.s $f6, FP
      
      #realizando as verificações 
      #fazendo o if FP == 0.00
      l.s $f10, FP # carrega o valor de FP para o $f10
      l.s $f11, zero # carrega o valor de zero para o $f11
      c.eq.s $f10, $f11 # comparação: se FP ($f10) == zero ($f11)
      bc1t end # se a comparação for verdadeira vai para a etiqueta end
      #fazendo o if (b-a)/2 < TOL
      l.s $f13, TOL
      c.lt.s $f4, $f13 #comparação: se (b-a)/2 < TOL
      bc1t end #se a comporação for verdadeira vai para a etiqueta end
      
      #fazendo o incremento de i
      addiu $t0, $t0, 1
      
      #fazendo a verificação if FA * FP > 0
      l.s $f14, FA
      l.s $f15, FP
      mul.s $f16, $f14, $f15 # colocando em $f16 o valor de FA*FP
      c.lt.s $f11, $f16 #comparação: 0 < FA*FP
      bc1t mudancaA # se a comparação anterior for verdadeira irá para a etiqueta mudancaA
      bc1f mudancaB # se a comparação anterior for falsa irá para a etiqueta mudancaB
      
      bne $s1, $t0, loop # verifica se o valor do registrador $s0 e $t0 são iguais, se não forem ele pulará para a etiqueta loop
      
    # etiqueta para imprimir p e encerrar o programa
    end:
      l.s $f12, p
      li $v0, 2
      syscall
      li $v0, 10
      syscall
      
    #realizar mudança de a
    mudancaA:
      #fazendo a = p
      l.s $f17, p
      s.s $f17, a
      #fazendo FA = FP
      l.s $f18, FP
      s.s $f18, FA
      j loop
      
    #realizar mudança de B
    mudancaB:
      #fazendo b = p
      l.s $f17, p
      s.s $f17, b
      j loop  
      
    #função para definir o valor de y(x) = x³-10 - resgistrador que será usado como argumento = $f5, registrador usada para retorno = $f6
    func:
      l.s $f7, dez
      mul.s $f8, $f5, $f5
      mul.s $f9, $f8, $f5
      add.s $f6, $f9, $f7
      jr $ra
      
      
      
      
      
      
    
