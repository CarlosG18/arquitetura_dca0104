from operator import length_hint
from urllib.request import CacheFTPHandler
from cachesim import CacheSimulator, Cache, MainMemory

mem_principal = MainMemory(65536)

cache = Cache("L1",4096,16,1,"LRU")
mem_principal.load_to(cache)
mem_principal.store_from(cache)
cache_simulation = CacheSimulator(cache, mem_principal)

ref1 = open("../../referencia1.txt", "r")
read = ref1.read()
valores = read.strip().split("/n")

for i in valores:
    cache_simulation.store(i, length=8)

for i in valores:
    cache_simulation.load(i, length=8)

cache_simulation.force_write_back()
cache_simulation.print_stats()