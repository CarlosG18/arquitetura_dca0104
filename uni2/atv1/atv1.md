# Conjunto de Instruções da Arquitetura MIPS (operações com valores inteiros)

## contextualização do problema

O vetor a seguir representa uma captura de 36 amostras de um sinal com 10 níveis de intensidade
diferentes (indo de 0 até 9).
```txt
V = [ 9 5 7 5 3 4 0 2 6 4 2 5 4 1 2 1 6 2 2 3 6 3 0 0 7 8 3 4 5 4 0 5 2 9 8 7 ]
```
Normalmente, em tarefas de processamento de sinais, sejam eles unidimensionais ou bidimensionais
(como imagens digitais, por exemplo) uma ação comumente realizada é obter o histograma do sinal
disponível.
O cálculo do histograma é a contagem do número de amostras existentes para cada intensidade que se
apresenta nas amostras disponibilizadas. Ela se mostra por meio de um array H, em que cada elemento
seu armazena a contagem de amostras que tem a intensidade igual ao valor que aparece em seu índice.
Por exemplo, o elemento H(0) armazena a contagem de elementos de V que têm valor igual a 0; H(1)
armazena o total de elementos que têm valor 1 em V; e, assim, sucessivamente.
O histograma pode ser facilmente determinado através do seguinte algoritmo:

```txt
Declarar Lmax como o número máximo de intensidades do vetor analisado
Declarar TAM como o tamanho do vetor analisado
Para i = 0 até Lmax, fazer
H[i] = 0;
Para i = 0 até TAM, fazer
H[V[i]] = H[V[i]] + 1;
```

## construindo o codigo:

```txt
**informações uteis**
- 'la' (Load Address): A instrução la é uma pseudoinstrução utilizada para carregar o endereço de uma label ou símbolo na memória para um registrador.
- li (Load Immediate): A instrução li é usada para carregar um valor imediato (constante) em um registrador.
- lw $destino, offset($base)

- sw $registrador, offset($base), onde `$registrador` é o registrador que contém o valor que será armazenado na memória , `offset` é o deslocamento em relação ao endereço base e `$base` é o registrador que contém o endereço base.
**comandos condicionais**
- beq: Branch if Equal (Desvio se igual): Desvia o fluxo do programa para um determinado rótulo se dois registradores forem iguais.
Exemplo: beq $t0, $t1, label
- bne: Branch if Not Equal (Desvio se não igual): Desvia o fluxo do programa para um determinado rótulo se dois registradores não forem iguais.
Exemplo: bne $t0, $t1, label
- bgtz: Branch if Greater Than Zero (Desvio se maior que zero): Desvia o fluxo do programa para um determinado rótulo se um registrador for maior que zero.
Exemplo: bgtz $t0, label
- bltz: Branch if Less Than Zero (Desvio se menor que zero): Desvia o fluxo do programa para um determinado rótulo se um registrador for menor que zero.
Exemplo: bltz $t0, label
- bgez: Branch if Greater Than or Equal to Zero (Desvio se maior ou igual a zero): Desvia o fluxo do programa para um determinado rótulo se um registrador for maior ou igual a zero.
Exemplo: bgez $t0, label
- blez: Branch if Less Than or Equal to Zero (Desvio se menor ou igual a zero): Desvia o fluxo do programa para um determinado rótulo se um registrador for menor ou igual a zero.
```

- primeiro definimos a deretiva `.data` para informar os dados que serão usados pelo programa, seguido da diretiva `.text` que indicara as instruções do programa. 

- usando a diretiva `.space` você aloca um vetor com (n * 4 bytes), ou seja para alocar um vetor:

> quero alocar um vetor com 9 espaços
basta fazer x = (9 * 4)
x = 36

você deve usar o comando:

```assembly
    .data
        H: .space 36
```
