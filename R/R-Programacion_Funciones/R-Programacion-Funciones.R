#Ejercicio_1:Define una función llamada saludo que imprima en la consola el mensaje "Hola, bienvenido a R"
#Utiliza una función sin parámetros
saludo<-function(){
  mensaje<-"Hola,bienvenida a R"
  return(mensaje)
}
print(saludo())
#Ejercicio_2:Crea una función llamada calificar_edad que tome un parámetro numérico llamado edad y muestre en la consola si la persona es "menor de edad" o "mayor de edad"
#Utiliza parámetros y condicionales
calificar_edad<-function(edad){
  if (!is.numeric(edad)){
    return("Edad debe ser de tipo numérico")
  }else if (edad<18){
    clasificacion<-"Eres menor de edad"
  }else{
    clasificacion<-"Eres mayor de edad"
  }
return(clasificacion)
}
calificar_edad("A")
calificar_edad(11)
calificar_edad(20)
#Ejercicio_3:Define una función llamada tabla_multiplicar que tome un parámetro numérico n e imprima la tabla de multiplicar del 1 al 10 de ese número.
#Utiliza un bucle con operaciones aritméticas
tabla_multiplicar<-function(n){
  for (i in 1:10){
    resultado<-i*n
    i<-i+1
  print(resultado)
  }
}
tabla_multiplicar(2)
tabla_multiplicar(8)
tabla_multiplicar(5)
#Ejercicio_4:Crea una función llamada numeros_pares que tome un parámetro numérico limite e imprima los números pares hasta ese límite.
#Utiliza un bucle con condicionales y operaciones con vectores
numeros_pares <- function(limite){
  pares <- c()
  for (i in 1:limite) {
    if (i %% 2 == 0) {
      pares <- c(pares, i)
    }
  }
  print(pares)
}
numeros_pares(50)
numeros_pares(16)
#Ejercicio_5:Define una función llamada matriz_cuadrada que tome un parámetro numérico n e imprima una matriz cuadrada de tamaño n x n donde los
#elementos son el resultado de la suma de sus índices de fila y columna
#Utiliza Bucle Anidado con Condicionales y Operaciones de Listas
matriz_cuadrada <- function(n) {
  matriz <- matrix(0, nrow = n, ncol = n)
  for (i in 1:n) {
    for (j in 1:n) {
      matriz[i, j] <- i + j
    }
  }
  print(matriz)
}
matriz_cuadrada(4)
matriz_cuadrada(2)
matriz_cuadrada(10)
