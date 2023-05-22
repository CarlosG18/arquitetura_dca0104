from operator import length_hint
from urllib.request import CacheFTPHandler
from cachesim import CacheSimulator, Cache, MainMemory

mem_principal = MainMemory(65536)

cache = Cache("L1",4096,32,1,"LRU")
mem_principal.load_to(cache)
mem_principal.store_from(cache)
cache_simulation = CacheSimulator(cache, mem_principal)

with open("../../referencia2.txt", "r") as arquivo:
    conteudo = arquivo.read()
valores_str = conteudo.split()
valores_int = list(map(int, valores_str))

for i in valores_int:
    cache_simulation.load(i, length=8)

for i in valores_int:
    cache_simulation.load(i, length=8)

cache_simulation.force_write_back()
cache_simulation.print_stats()