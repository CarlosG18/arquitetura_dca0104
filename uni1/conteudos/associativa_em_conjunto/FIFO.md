# caso da política de substituição `FIFO`

A política de substituição FIFO é um algoritmo simples e amplamente utilizado para gerenciar a substituição de blocos de memória na cache. Seguindo o princípio "Primeiro a Entrar, Primeiro a Sair", essa política substitui o bloco mais antigo que foi armazenado na cache quando ocorre um miss e é necessário liberar espaço para um novo bloco.

O funcionamento da política FIFO é bastante direto. Quando um bloco de memória é trazido para a cache, ele é armazenado no final de uma fila. Quando ocorre um miss e é necessário substituir um bloco, o bloco no início da fila, ou seja, o bloco mais antigo, é selecionado para ser substituído.

A política FIFO não leva em consideração a frequência ou a probabilidade de reutilização dos blocos de memória. Ela simplesmente assume que os blocos que chegaram primeiro à cache têm maior probabilidade de serem menos relevantes no futuro próximo e podem ser substituídos sem prejuízo significativo ao desempenho.

Uma das principais vantagens da política FIFO é sua simplicidade de implementação. Não são necessárias estruturas de dados complexas ou contadores adicionais para rastrear o histórico de acesso aos blocos. A substituição é baseada exclusivamente na ordem de chegada dos blocos à cache.

No entanto, a política FIFO pode apresentar algumas limitações. Por exemplo, ela não considera a frequência de acesso aos blocos, o que pode levar à substituição de blocos frequentemente utilizados e à redução da taxa de acerto na cache. Além disso, a política FIFO pode não aproveitar a localidade temporal, ou seja, a tendência de que blocos recentemente acessados tenham maior probabilidade de serem acessados novamente.

Apesar de suas limitações, a política de substituição FIFO continua sendo amplamente utilizada em diversos sistemas de cache. Em cenários onde a complexidade de implementação ou o custo adicional são preocupações, a política FIFO oferece uma solução simples e eficaz para gerenciar a substituição de blocos na cache.

É importante ressaltar que a escolha da política de substituição depende do contexto e das características específicas do sistema, e outras políticas, como LRU (Least Recently Used - Menos Recentemente Usado) e aleatória, podem ser aplicadas em diferentes situações para otimizar o desempenho da cache.
**texto gerado pelo CHATGPT**

## Simulações

- 2 vias e blocos com 8bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |16801(16801B)|11251(16803B)|28052(33604B)|22500(22500B)|11251(22502B)|
|  MEM |11251(16803B)|0(0B)|11251(16803B)|11251(16803B)|0(0B)|

- 4 vias e blocos com 16bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |19576 (19576B)|5626(13732B)|25202(33308B)|22500 (22500B)|5626(22504B)|
|  MEM |5626(13732B)|0(0B)|5626(13732B)|5626(22504B)|0(0B)|

- 8 vias e blocos com 32bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |20965(20965B)|2814(11767B)|23779(32732B)|22500(22500B)|2814(22512B)|
|  MEM |2814(11767B)|0(0B)|2814(11767B)|2814(22512B)|0(0B)|

- 16 vias e blocos com 64bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |21663(21663B)|1407(9957B)|23070(31620B)|22500(22500B)|1407(22512B)|
|  MEM |1407(9957B)|0(0B)|1407(9957B)|1407(22512B)|0(0B)|

## Gráfico de desempenho

