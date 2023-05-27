import random

def gerar_vetor_aleatorio(inicio, fim, tamanho):
  vetor = []
  for _ in range(tamanho):
    valor = random.randint(inicio, fim)
    vetor.append(valor)
  return vetor