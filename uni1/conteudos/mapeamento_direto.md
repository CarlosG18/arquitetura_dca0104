# Simulações da cache com Mapeamento Direto

O mapeamento direto é uma técnica comum de mapeamento utilizada em sistemas de cache. Nesse método, cada bloco de memória da cache é associado exclusivamente a uma única posição ou conjunto fixo na memória principal.

O funcionamento do mapeamento direto é relativamente simples. Cada bloco de memória é dividido em duas partes: o índice do conjunto e o deslocamento. O índice do conjunto é calculado a partir do endereço de memória solicitado, enquanto o deslocamento determina a posição específica dentro do bloco.

Quando ocorre uma solicitação de leitura ou gravação de um endereço de memória, o mapeamento direto utiliza o índice do conjunto para determinar a posição na cache onde o bloco correspondente deve ser armazenado. Essa posição é calculada com base no número de conjuntos da cache e no índice do conjunto obtido a partir do endereço de memória.

A principal vantagem do mapeamento direto é sua simplicidade de implementação. Cada bloco de memória tem uma única posição fixa na cache, o que facilita o acesso direto ao bloco correspondente. Além disso, o mapeamento direto não requer uma verificação adicional ou comparação para encontrar o bloco desejado na cache, pois sua posição é determinada diretamente pelo índice do conjunto.

No entanto, uma limitação do mapeamento direto é que vários blocos de memória podem mapear para o mesmo conjunto, o que pode resultar em conflitos de mapeamento. Se ocorrerem acessos frequentes a blocos que são mapeados para o mesmo conjunto, pode ocorrer uma alta taxa de conflitos e, consequentemente, um aumento nos misses de cache.

Para lidar com os conflitos de mapeamento, outras técnicas de mapeamento, como o mapeamento associativo por conjunto (associative set mapping), podem ser utilizadas. Essas técnicas permitem que um bloco de memória seja armazenado em um conjunto específico dentro de um conjunto de conjuntos, proporcionando uma maior flexibilidade e melhor aproveitamento da cache.

Em resumo, o mapeamento direto é uma técnica simples de mapeamento utilizada em sistemas de cache, onde cada bloco de memória é associado exclusivamente a uma única posição ou conjunto fixo na memória principal. Embora seja fácil de implementar, o mapeamento direto pode resultar em conflitos de mapeamento, afetando o desempenho da cache.
**texto gerado pelo CHATGPT**

# Simulações

- caso com bloco de 8bytes:
**tabela de simulação**

||     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |11325(11325B)|22500(22500B)|33825(33825B)|22500(22500B)|22500(22500B)|
|  MEM |22500(22500B)|        0(0B)|22500(22500B)|22500(22500B)|        0(0B)|


- caso com bloco de 16bytes
**tabela de simulação**

|  |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |11325(11325B)|22500(22500B)|33825(33825B)|22500(22500B)|22500(22500B)|
|  MEM |22500(22500B)|        0(0B)|22500(22500B)|22500(22500B)|        0(0B)|


- caso com bloco de 32bytes
**tabela de simulação**

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |11325(11325B)|22500(22500B)|33825(33825B)|22500(22500B)|22500(22500B)|
|  MEM |22500(22500B)|        0(0B)|22500(22500B)|22500(22500B)|        0(0B)|


- caso com bloco de 64bytes
**tabela de simulação**

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |11325(11325B)|22500(22500B)|33825(33825B)|22500(22500B)|22500(22500B)|
|  MEM |22500(22500B)|        0(0B)|22500(22500B)|22500(22500B)|        0(0B)|
