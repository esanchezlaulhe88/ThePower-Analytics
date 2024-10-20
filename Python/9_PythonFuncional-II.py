
def procesar_datos(operacion,*args,**kwargs):
  if operacion == "sumar":
    suma=kwargs.get("valor_inicial",0)
    for dato in args:
      suma+=dato
    return suma
  elif operacion == "restar":
    resta=args[0]
    for dato in args[1:]:
      resta-=dato
    return resta
  elif operacion == "multiplicar":
    multiplicacion=kwargs.get("factor",1)
    for dato in args:
      multiplicacion*=dato
    return multiplicacion
  elif operacion == "dividir":
    division=args[0]
    for dato in args[1:]:
      division/=dato
    return division
  else:
    raise ValueError (f"Error en operacion {operacion}")
resultado_suma = procesar_datos('sumar', 1, 2, 3, 4, 25, 34, valor_inicial=10)
resultado_resta = procesar_datos('restar', 89, 32, 81)
resultado_multiplicacion = procesar_datos('multiplicar', 22, 3, 4, factor=5)
resultado_division = procesar_datos('dividir', 100, 5, 2)

print([resultado_suma,resultado_resta,resultado_multiplicacion,resultado_division])



strings = ["hello", "world", "python", "programming", "is", "fun"]
strings_ordenadas_desc=sorted(strings,reverse=True)
strings_ordenadas_asc=sorted(strings)
strings_lambda_oedenada=sorted(strings, key=lambda x: len(x))
print(strings_ordenadas_asc)
print(strings_ordenadas_desc)
print(strings_lambda_oedenada)


numbers = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
numbers_filtrados=[number for number in numbers if number > 10 and number %3==0]
print(numbers_filtrados)

people = {"Alice": 30, "Bob": 25, "Charlie": 35, "David": 40}
orden_edad = sorted(people.items(), key = lambda tuple: tuple[1])
print(dict(orden_edad))

numbers2 = [1, 2, 3, 4, 5]
map_numbers=map(lambda x:x**2,numbers2)
print(list(map_numbers))

numbers3 = [1, 2, 6, 7, 8, 3, 9, 10, 13]
numbers3_filter= list(filter(lambda numbers: numbers>5,numbers))
print(numbers3_filter) 
print(len(numbers3_filter))




