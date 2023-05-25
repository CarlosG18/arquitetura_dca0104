# arquitetura_dca0104
Implementações realizadas na disciplina de Arquitetura de computadores - DCA0104 - UFRN

## atividade 5 - simulação (memória cache)

será realizado uma simulação de um sistema computacional com cache única entre processador e memória principal para testar várias configurações de projetos de cache e, com isso, obter as taxas de acertos e falhas existentes.

**configurações do sistema:**
- memoria pricipal de `64K` bytes de tamanho;
- tamanho da palavra do sistema: `1byte`;
- único processador;
- cache simples (única) com tamanho de `4K` bytes;

o programa irá simular:

- (a) Uma cache diretamente mapeada, com blocos de 8, 16, 32 e 64 bytes, respectivamente;

- (b) Uma cache associativa em conjunto com 2, 4, 8 e 16 vias, sendo que cada uma delas apresenta blocos de 8, 16, 32 e 64 bytes, respectivamente.

No caso da simulação com cache associativa em conjunto, devem ser testados as três `políticas de substituição` de linha (**LRU, FIFO e aleatória**).

Para testarmos uma cache totalmente associativa, vamos considerar uma configuração diferente:
- cache única de dados, de 1K bytes de tamanho, com linhas armazenando 8, 16, 32 e 64 bytes

deverão ser realizadas 4 (mapeamento direto) + 16 (associativo em conjunto) + 4 (totalmente associativo) simulações diferentes.

## simulações

### cache diretamente mapeada

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


### cache 