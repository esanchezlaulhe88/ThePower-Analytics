#Ejercicio_1:Define una función llamada saludo que imprima en la consola el mensaje "Hola, bienvenido a R"
#Utiliza una función sin parámetros
saludo<-function(){
  mensaje_bienvenida<-"Hola, bienvenido a R"
  return(mensaje_bienvenida)
}
print(saludo())

#Ejercicio_2:Crea una función llamada calificar_edad que tome un parámetro numérico llamado edad y muestre en la consola si la persona es "menor de edad" o "mayor de edad"
#Utiliza parámetros y condicionales
calificar_edad<-function(edad){
  if (edad<18)
    print("menor de edad")
  else
    print("mayor de edad")
}
calificar_edad(15)

#Ejercicio_3:Define una función llamada tabla_multiplicar que tome un parámetro numérico n e imprima la tabla de multiplicar del 1 al 10 de ese número.
#Utiliza un bucle con operaciones aritméticas
tabla_multiplicar<-function(n){
  for (i in 1:10){
    print(i*n)
  }
}
tabla_multiplicar(5)
tabla_multiplicar(11)
tabla_multiplicar(7)

#Ejercicio_4:Crea una función llamada numeros_pares que tome un parámetro numérico limite e imprima los números pares hasta ese límite.
#Utiliza un bucle con condicionales y operaciones con vectores
numeros_pares <- function(limite) {
  for (i in 1:limite) {
    if (i %% 2 == 0) {
      print(i)
    }
  }
}
numeros_pares(10)
numeros_pares(57)

#Ejercicio_5:Define una función llamada matriz_cuadrada que tome un parámetro numérico n e imprima una matriz cuadrada de tamaño n x n donde los
#elementos son el resultado de la suma de sus índices de fila y columna
#Utiliza Bucle Anidado con Condicionales y Operaciones de Listas
matriz_cuadrada<-function(n){
  resultado<-matrix(0,nrow=n,ncol=n)
  for (i in 1:n){
    for (j in 1:n){
      resultado[i,j]<-i+j
    }
  }
  print(resultado)
}
matriz_cuadrada(8)
matriz_cuadrada(15)
