from cachesim import CacheSimulator, Cache, MainMemory

mem_principal = MainMemory(65536)

cache = Cache("L1",4096,16,4,"FIFO")
mem_principal.load_to(cache)
mem_principal.store_from(cache)

cache_simulation = CacheSimulator(cache, mem_principal)

with open("../../../referencia1.txt", "r") as arquivo1: #arquivo 1 - ordenado
    conteudo1 = arquivo1.read()
valores1_str = conteudo1.split()
valores_store = list(map(int, valores1_str))

with open("../../../referencia2.txt", "r") as arquivo2: # arquivo 2 - desordenado
    conteudo2 = arquivo2.read()
valores2_str = conteudo2.split()
valores_load = list(map(int, valores2_str))

for i,j in zip(valores_store,valores_load):
  cache_simulation.store(i, length=1)
  cache_simulation.load(j, length=1)

cache_simulation.force_write_back()
cache_simulation.print_stats()
