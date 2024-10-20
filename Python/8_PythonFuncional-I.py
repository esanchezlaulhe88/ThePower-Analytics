def frecuencia_letras(cadena_texto):
  diccionario={}
  for letra in cadena_texto.lower():
    if letra != " ":
      if letra in diccionario:
        diccionario[letra]+=1
      else:
        diccionario[letra]=1
    else:
      continue
  return diccionario
mi_cadena_texto="Como Mi perro y mi gato"
print(frecuencia_letras(mi_cadena_texto))


def buscar_palabras(lista_palabras,palabra_objetivo):
  palabras_encontradas=[]
  for palabra in lista_palabras:
    if palabra_objetivo in palabra:
      palabras_encontradas.append(palabra)
  return palabras_encontradas
mi_lista=["carmen","elena","paco","paconeta"]
mi_objetivo="paco"
buscar_palabras
busqueda = buscar_palabras(mi_lista,mi_objetivo)
print(busqueda)
mi_lista2=["manzana", "banana", "naranja", "melocotón", "plátano"]
mi_objetivo2="na"
busqueda2=buscar_palabras(mi_lista2,mi_objetivo2)
print(busqueda2)

def calcular_promedio(lista_notas,nota_aprobado=5):
  for nota in lista_notas:
    suma=sum(lista_notas)
    media=suma/len(lista_notas)
    if media > nota_aprobado:
      print(f"Has aprobado. Tu nota media es: {media}")
    else:
      print(f"No has aprobado. Tu nota media es {media}. Debes hacer un repaso de los conceptos")
    return nota
notas_jaime = [6, 7, 8, 4, 5]
resultado = calcular_promedio(notas_jaime)
notas_elena = [2, 3, 6, 8, 1, 2, 9, 2, 1]
resultado = calcular_promedio(notas_elena)


def factorial(n):
  if n == 0:
    return 1
  else:
    return n * factorial(n-1)
numero=5
print(factorial(numero))

def funcion_args(*args):
  resultado=0
  for num in args:
    resultado += num
  return resultado
suma1=funcion_args(3,4,4)
print(suma1)

diccionario1={"Nombre":"MataPakos",
             "Edad":25}
for clave, valor in diccionario1.items():
  print(clave,valor)
  

def funcion_args(**kwargs):
  for clave,valor in kwargs.items():
    print(clave,valor)
  return clave,valor
funcion_args(nombre="Elena",altura=1.6,edad=32)

def combinar_listas(*args):
  diccionario2={}
  for indice, elemento in enumerate (list(zip(args))):
    print(f"El elemento es {elemento}, y el indice es {indice}")
    diccionario2[indice]=elemento
    print(f"El diccionario en este punto es {diccionario2}")
  return diccionario2
lista1 = [1, 2, 3]
lista2 = ['a', 'b', 'c']
lista3 = [True, False, True]

mi_diccionario2=combinar_listas(lista1,lista2)
print(f"El diccionario final es {mi_diccionario2}")
mi_diccionario3=combinar_listas(lista1,lista2,lista3)
print(f"El diccionario final es {mi_diccionario3}")

def area_figura (**kwargs):
  if "base" in kwargs and "altura" in kwargs:
    base=int(kwargs["base"])
    altura=kwargs["altura"]
    area = (base * altura)/2
  elif "lado" in kwargs:
    lado = kwargs["lado"]
    area=lado**2
  elif "radio" in kwargs:
    radio=kwargs["radio"]
    area=3.14*(radio**2)
  else:
    raise "No soportado"
  return area
area_triangulo = area_figura(base=3, altura=4)
print(area_triangulo)
area_circulo = area_figura(radio=2)
print(area_circulo)
area_cuadrado = area_figura(lado=5)
print(area_cuadrado)









