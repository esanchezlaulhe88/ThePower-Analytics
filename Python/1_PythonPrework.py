# Escribe un programa que convierta una temperatura de grados Celsius a grados Fahrenheit.
celsius = float(input("Introduce la temperatura en grados Celsius: "))
fahrenheit = (celsius * 9/5) + 32
print(f"La temperatura en grados Fahrenheit es: {fahrenheit}")


# Crea un programa que calcule el monto total a pagar en un restaurante, incluye el 15% sobre el total de la cuenta.
total_cuenta = float(input("Introduce el total de la cuenta en euros: "))
propina = total_cuenta * 0.15
total_a_pagar = total_cuenta + propina
print(f"El monto total a pagar, incluyendo una propina del 15%, es: {total_a_pagar} euros")

# Escribe un programa que solicite la edad de un usuario y determine si es mayor de edad (mayor o igual a 18 años) o no
while True:
  try:
    edad_usuario=int(input('¡Hola! Por favor introduce tu edad: '))
    if edad_usuario>=18:
      print(f'Tienes {edad_usuario} años, por lo que eres mayor de edad.')
      break
    elif edad_usuario<18:
      print(f'Tienes {edad_usuario} años, por lo que eres menor de edad.')
      break
  except ValueError:
    print('Inserta un valor válido')