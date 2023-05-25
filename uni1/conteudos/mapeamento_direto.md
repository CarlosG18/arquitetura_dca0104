# Simulações da cache com Mapeamento Direto

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
