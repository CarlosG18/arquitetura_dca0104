from cachesim import CacheSimulator, Cache, MainMemory

mem = MainMemory()
l3 = Cache("L3", 20480, 16, 64, "LRU")  # 20MB: 20480 sets, 16-ways with cacheline size of 64 bytes
mem.load_to(l3)
mem.store_from(l3)
l2 = Cache("L2", 512, 8, 64, "LRU", store_to=l3, load_from=l3)  # 256KB
l1 = Cache("L1", 64, 8, 64, "LRU", store_to=l2, load_from=l2)  # 32KB
cs = CacheSimulator(l1, mem)

cs.load(2342)  # Loads one byte from address 2342, should be a miss in all cache-levels
cs.store(512, length=8)  # Stores 8 bytes to addresses 512-519,
                         # will also be a load miss (due to write-allocate)
cs.load(512, length=8)  # Loads from address 512 until (exclusive) 520 (eight bytes)

cs.force_write_back()
cs.print_stats()