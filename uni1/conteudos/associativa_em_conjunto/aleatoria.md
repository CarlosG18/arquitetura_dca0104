# caso da política de substituição `Aleatória`

A política de substituição aleatória é uma abordagem de gerenciamento de cache que seleciona aleatoriamente um bloco de memória existente na cache para substituição, quando ocorre um miss e é necessário liberar espaço para um novo bloco.

Ao contrário de outras políticas de substituição, como FIFO (First In, First Out - Primeiro a Entrar, Primeiro a Sair) e LRU (Least Recently Used - Menos Recentemente Usado), a política aleatória não leva em consideração a ordem de chegada dos blocos ou a frequência de acesso. Cada bloco existente na cache tem a mesma probabilidade de ser escolhido para substituição.

A principal característica da política de substituição aleatória é sua imprevisibilidade. A seleção aleatória de blocos para substituição evita qualquer forma de viés ou previsibilidade na escolha dos blocos. Isso significa que mesmo blocos recentemente acessados têm uma chance de serem substituídos, e blocos menos recentemente utilizados não têm garantia de permanência na cache.

Embora a política de substituição aleatória seja simples de implementar, ela pode apresentar desvantagens em termos de eficiência de cache. A falta de consideração pela frequência de acesso ou pelo histórico de utilização dos blocos pode levar à substituição de blocos frequentemente utilizados, resultando em uma maior taxa de misses na cache e, consequentemente, um desempenho inferior.

No entanto, a política de substituição aleatória pode ser útil em certos contextos, como experimentos ou simulações, onde a variabilidade e a falta de previsibilidade são desejáveis para avaliar o desempenho do sistema em diferentes cenários.

Em resumo, a política de substituição aleatória é uma abordagem simples e imprevisível para gerenciamento de cache, onde cada bloco existente na cache tem a mesma probabilidade de ser escolhido para substituição. Embora possa não ser a opção mais eficiente em termos de aproveitamento da cache, a política aleatória pode ser útil em determinadas situações onde a variabilidade e a falta de previsibilidade são valorizadas. A escolha da política de substituição dependerá das características específicas do sistema e das necessidades de desempenho.
**texto gerado pelo CHATGPT**

## Simulações

- 2 vias e blocos com 8bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |16518(16518B)|11872(17762B)|28390(34280B)|22500(22500B)|11251(22502B)|
|  MEM |11872(17762B)|0(0B)|11872(17762B)|11251(22502B)|0(0B)|

- 4 vias e blocos com 16bytes:

| |     HIT     | MISS        | LOAD        | STORE       | EVICT       |
| ---- | ----------- | ----        | ----        | -----       | -----       |
|  L1  |19568(19568B)|5652(13812B)|25220(33380B)|22500(22500B)|5626(22504B)|
|  MEM |5652(13812B)|0(0B)|5652(13812B)|5626(22504B)|0(0B)|

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

