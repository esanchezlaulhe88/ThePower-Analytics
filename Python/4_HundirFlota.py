import random
BARCO = "B"
AGUA = "~"
HUNDIDO = "X"
FALLO = "O"
BARCOS_TIPOS = [2,3,3,4,5]
TABLERO_SIZE = 10

def crear_tablero():
  tablero=[["~" for _ in range(10)] for i in range (10)]
  return tablero

def imprimir_tablero(tablero,ocultar_barcos=True):
  print(" "+" ".join(str(i) for i in range(10)))
  for i in range(10):
    fila= [str(i)]
    for j in range(10):
      if ocultar_barcos and tablero [i][j] == BARCO:
        fila.append(AGUA)
      else:
        fila.append(tablero[i][j])
    print((" ").join(fila))
def colocar_barcos(tablero):
  for size in BARCOS_TIPOS:
    while True:
      fila = random.randint(0, TABLERO_SIZE - 1)
      columna = random.randint(0, TABLERO_SIZE - 1)
      direccion = random.choice(["horizontal","vertical"])
      if es_posicion_valida(tablero,fila,columna,size,direccion):
        colocar_barco(tablero,fila,columna,size,direccion)
        break
def es_posicion_valida(tablero,fila,columna,size,direccion):
  if direccion == "horizontal":
    if columna + size > TABLERO_SIZE-1:
      return False
    return all(tablero[fila][columna+i]== AGUA for i in range(size))
  elif direccion == "vertical":
    if fila + size > TABLERO_SIZE-1:
      return False
    return all(tablero[fila+i][columna]== AGUA for i in range(size))
def colocar_barco(tablero,fila,columna,size,direccion):
  if direccion == "horizontal":
    for i in range(size):
      tablero[fila][columna + i]  = BARCO
  elif direccion == "vertical":
    for i in range(size):
      tablero[fila + i][columna]  = BARCO
def disparar(tablero,fila,columna):
  if tablero[fila][columna]==BARCO:
    tablero[fila][columna]=HUNDIDO
    return True
  elif tablero[fila][columna]==AGUA:
    tablero[fila][columna]=FALLO
    return False
def hundir_la_flota():
  tablero=crear_tablero()
  colocar_barcos(tablero)
  while True:
    imprimir_tablero(tablero)
    try:
      fila=int(input("Ingresa la fila para disparar: "))
      columna=int(input("Ingresa la columna para disparar: "))
      if fila < 0 or fila >= TABLERO_SIZE or columna < 0 or columna >= TABLERO_SIZE:
        print("Posición fuera del tablero. Inténtelo otra vez")
      if disparar(tablero,fila,columna):
        print("¡Tocado!")
      else:
        print("¡Agua!")
      if all(all(casilla!=BARCO for casilla in fila) for fila in tablero):
        imprimir_tablero(tablero,ocultar_barcos=False)
        print("¡Felicidades! Has hundido la flota de tu rival")
        break
    except ValueError:
      print("Error. Ingresa unas coordenadas válidas")
if __name__ =="__main__":
  hundir_la_flota()
  
      
