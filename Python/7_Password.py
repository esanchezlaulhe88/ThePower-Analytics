while True:
  contraseña=input("Introduce una contraseña que contega al menos una letra mayúscula, una minúscula y un valor numérico: ")
  if any(letra.isupper() for letra in contraseña) and any(letra.islower() for letra in contraseña) and any(letra.isnumeric() for letra in contraseña):
    print("Contraseña válida \n")
    repetir_contaseña=input("Introduce nuevamente la contraseña: ")
    if contraseña==repetir_contaseña:
      print("Contraseña establecida correctamente")
      break
    else:
      print("Las contraseñas no coinciden")
  else:
    print("Contraseña no válida")
  