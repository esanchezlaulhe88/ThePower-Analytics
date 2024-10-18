def crear_tablero():
  tablero=[[" " for iterador in range (3)] for iterador in range(3)]
  return tablero
def imprimir_tablero(tablero):
  print("-" * 9)
  for fila in tablero:
    print(" | ".join(fila))
    print("-" * 9)
def tablero_lleno(tablero):
  return all(all(casilla != " " for casilla in fila) for fila in tablero)
def comprobar_ganador(tablero,jugador):
  for i in range (3):
      if all(tablero [i][j] ==jugador for j in range (3)) or all(tablero[j][i]==jugador for j in range (3)) == jugador:
        return True
  if all(tablero[i][i]== jugador for j in range (3)) or all(tablero[i][2-i] == jugador for j in range (3)):
      return True
  return False

def tres_en_linea():
  tablero=crear_tablero()
  jugador_actual="x"
  
  print("¡Bienvenid@ al tres en línea!")
  while True:
    imprimir_tablero(tablero)
    print(f"Turno del jugador {jugador_actual}")
    fila= int(input("Elige fila 0, 1 o 2: "))
    columna = int(input("Elige columna 0, 1 o 2: "))
    if tablero[fila][columna] == " ":
      tablero[fila][columna]=jugador_actual
      if comprobar_ganador(tablero,jugador_actual):
        print(f"El jugador {jugador_actual} ha ganado")
        break
      elif tablero_lleno(tablero):
        print("Empate")
        break
      jugador_actual="o" if jugador_actual== "x" else "x"
    else:
      print("Casilla ocupada")
      
if __name__=="__main__":
  tres_en_linea()