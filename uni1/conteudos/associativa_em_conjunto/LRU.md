# caso da política de substituição `LRU`

A política de substituição LRU (Least Recently Used - Menos Recentemente Usado) é um algoritmo comumente utilizado para gerenciar a substituição de blocos de memória na cache. Essa política baseia-se no princípio de que os blocos de memória menos recentemente utilizados têm maior probabilidade de não serem acessados novamente no futuro próximo, sendo candidatos ideais para serem substituídos.

O funcionamento da política LRU é baseado em manter um registro do histórico de acessos aos blocos de memória na cache. Para cada bloco, é mantido um contador que é atualizado toda vez que o bloco é acessado. Quando ocorre um miss na cache, ou seja, o bloco desejado não está presente, é necessário selecionar um bloco para ser substituído.

Nesse momento, a política LRU analisa o contador de cada bloco e seleciona aquele com o valor mais alto, indicando que ele foi o menos recentemente utilizado. Esse bloco é então substituído pelo novo bloco que está sendo trazido para a cache. O contador do bloco recém-chegado é atualizado para indicar sua utilização mais recente.

A política LRU é considerada eficaz porque aproveita a localidade temporal, ou seja, a tendência de que blocos de memória recentemente acessados tenham maior probabilidade de serem acessados novamente em breve. Ao substituir os blocos menos recentemente utilizados, a política LRU busca maximizar o aproveitamento da cache, minimizando os misses e otimizando o desempenho do sistema.

No entanto, a implementação da política LRU requer um hardware adicional para manter o registro dos contadores ou utilizar estruturas de dados complexas, como listas encadeadas, para rastrear a ordem de utilização dos blocos. Esse requisito pode aumentar a complexidade e o custo do sistema de cache, especialmente em caches de maior capacidade.

Apesar disso, a política de substituição LRU continua sendo amplamente utilizada devido à sua eficiência na redução de misses e melhoria do desempenho geral da cache. É importante ressaltar que existem outras políticas de substituição, como FIFO (First In, First Out - Primeiro a Entrar, Primeiro a Sair) e aleatória, que possuem características diferentes e são aplicadas em contextos específicos, dependendo das necessidades e restrições do sistema.

**texto gerado pelo CHATGPT**


## Simulações

- 2 vias e blocos com 8bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |16801(16801B)|11251(16803B)|28052(33604B)|22500(22500B)|11251(22500B)|
|  MEM |11251(16803B)|        0(0B)|11251(16803B)|11251(22502B)|        0(0B)|

- 4 vias e blocos com 16bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |19576(19576B)|5626(14732B)|25202(33308B)|22500(22500B)|5626(22504B)|
|  MEM |5626(13732B)|0(0B)|5626(   13732B)|5626(22504B)|0(0B)|

- 8 vias e blocos com 32bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |20965(20965B)|2814(11767B)|23779(32732B)|22500(22500B)|2814(22512B)|
|  MEM |2814(11767B)|0(0B)|2814(11767B)|2814 (22512B)|0(0B)|

- 16 vias e blocos com 64bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |21663(21663B)|1407(9957B)|23070(31620B)|22500(22500B)|1407(22512B)|
|  MEM |1407(9957B)|0(0B)|1407(9957B)|1407(22512B)|0(0B)|

## Gráfico de desempenho

