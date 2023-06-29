# Programação Assembly para Arquitetura MIPS (operações com ponto flutuante)

## contextualização do problema 

Em vários problemas de ciências e engenharia um que se mostra bastante comum de ser tratado é o de
se encontrar as raízes de uma equação. Este problema consiste em determinar a raiz, ou solução, de
uma equação na forma f(x) = 0, para uma dada função f. Essa raiz é, normalmente, chamada de zero
da função. Dependendo da função f, essa raiz pode ser encontrada por métodos analíticos. Porém, em
diversas situações, é necessário aplicar métodos numéricos para tal objetivo.
Um dos métodos numéricos mais comumente empregados para determinar raízes de equações é
conhecido como método da bisseção. Neste procedimento, considere que tem-se uma função f(x)
contínua e definida em um intervalo [a, b], com f(a) e f(b) com sinais opostos (ou seja, f(a) < 0 e f(b) > 0 ou f(a) > 0 e f(b) < 0). Assim sendo, pelo teorema do valor intermediário, existe um número p no intervalo (a, b) de tal forma que f(p) = 0, ou seja, é raiz da função f.
De forma resumida, o método da bisseção, que é usado para encontrar uma raiz, consiste em reduzir
gradativamente o intervalo [a, b], até uma determinada tolerância, e testar o valor intermediário do
novo intervalo para saber se ele está próximo da raiz desejada. O algoritmo do método da bisseção é
apresentado a seguir:

```txt
Entrada: pontos extremos a e b; tolerância TOL; número máximo de iterações N.
Saída: solução aproximada p ou mensagem de erro
Defina i = 1;
Defina FA = f(a);
Enquanto i ≤ N, faça:
p = a + (b – a)/2;
FP = f(p);
Se FP = 0 ou (b – a)/2 < TOL, então:
Exibir p
Parar
Fim-Se
i = i + 1;
Se FA · FP > 0, então:
a = p;
FA = FP;
Senão:
b = p;
Fim-Se
Fim-Enquanto
Exibir saída: “Raiz não encontrada!”
```

Assim sendo, encontre a raiz positiva da equação f(x) = x3 – 10 pelo método da bisseção, com TOL =
0,1, máximo de 10 iterações e com intervalo de busca igual a [2.0, 3.0]

## trabalhando com ponto flutuante em assembly

Para trabalhar com números em ponto flutuante no assembly MIPS, você precisa utilizar as instruções e formatos adequados para manipular esses valores. O MIPS suporta números em ponto flutuante usando o padrão IEEE 754.

Aqui estão algumas instruções básicas para trabalhar com números de ponto flutuante no MIPS:

1. Carregar um valor de ponto flutuante:
   ```
   l.s $f0, <endereço>  ; Carrega o valor de ponto flutuante para o registrador $f0
   ```

2. Armazenar um valor de ponto flutuante:
   ```
   s.s $f0, <endereço>  ; Armazena o valor de ponto flutuante do registrador $f0 em um endereço de memória
   ```

3. Operações aritméticas:
   - Adição de ponto flutuante:
     ```
     add.s $f2, $f0, $f4  ; $f2 = $f0 + $f4
     ```

   - Subtração de ponto flutuante:
     ```
     sub.s $f2, $f0, $f4  ; $f2 = $f0 - $f4
     ```

   - Multiplicação de ponto flutuante:
     ```
     mul.s $f2, $f0, $f4  ; $f2 = $f0 * $f4
     ```

   - Divisão de ponto flutuante:
     ```
     div.s $f2, $f0, $f4  ; $f2 = $f0 / $f4
     ```

   - Raiz quadrada de ponto flutuante:
     ```
     sqrt.s $f2, $f0      ; $f2 = sqrt($f0)
     ```

4. Conversão de inteiro para ponto flutuante:
   ```
   mtc1 $t0, $f0         ; Move o valor inteiro do registrador $t0 para o registrador de ponto flutuante $f0
   ```

5. Conversão de ponto flutuante para inteiro:
   ```
   cvt.w.s $f0, $f2      ; Converte o valor de ponto flutuante do registrador $f2 para um valor inteiro no registrador $f0
   ```

Essas são apenas algumas instruções básicas para trabalhar com números em ponto flutuante no assembly MIPS. Existem outras instruções e formatos disponíveis, dependendo da necessidade do seu programa. Certifique-se de consultar a documentação específica do seu ambiente de desenvolvimento MIPS para obter mais informações detalhadas.

## realizar impressões

.data
    mensagem: .asciiz "Olá, mundo!"  # String a ser impressa
    valor: .float 3.14               # Valor de ponto flutuante a ser impresso

.text
    main:
        # Imprimir uma string
        la $a0, mensagem          # Carrega o endereço da string em $a0
        li $v0, 4                # Carrega o código da syscall print_string em $v0
        syscall                  # Chama a syscall para imprimir a string

        # Imprimir um valor de ponto flutuante
        l.s $f12, valor          # Carrega o valor de ponto flutuante em $f12
        li $v0, 2                # Carrega o código da syscall print_float em $v0
        syscall                  # Chama a syscall para imprimir o valor de ponto flutuante

        # Terminar o programa
        li $v0, 10               # Carrega o código da syscall exit em $v0
        syscall                  # Chama a syscall para encerrar o programa

