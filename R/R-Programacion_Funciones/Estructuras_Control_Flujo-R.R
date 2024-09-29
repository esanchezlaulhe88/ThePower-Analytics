edad<-69
if (edad>=18){
  print("Eres mayor de Edad")
}

if (edad>=18){
  print("Eres mayor de Edad")
} else{
  print("Eres menor de edad")
}
if (edad>=67){
  print("Ya te puedes jubilar")
} else if (edad>=18){
  print("Tienes edad de trabajar")
} else {
  print("Tienes edad de aprender")
}

ifelse(14:20 > 18,"Adulto","Menor")

numeros<-5:10
for (i in numeros) {
  print (i**2)
}

contador<-1
while (contador<=5){
  print(paste("Iteración:", contador))
  contador<-contador+1
}