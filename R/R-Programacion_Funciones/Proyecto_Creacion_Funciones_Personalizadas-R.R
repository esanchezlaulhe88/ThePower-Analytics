#Construir una función salario que, al indicarle el salario por hora, el nº de horas trabajadas por semana y la retención, calcule y devuelva
#el salario neto y bruto. Si el nº de horas trabajadas semanalmente es mayor a 45 se considerarán horas extras y se paga un 50% mas. Por defecto
#las horas trabajadas semanalmente son 40 y la retención de un 2%
salario<-function(coste_hora,horas=40,retenciones=0.02){
  if (horas>45) {
    horas_extras=horas-45
    coste_extra=coste_hora*1.5
    bruto=45*coste_hora+horas_extras*coste_extra
  } else {
    bruto=horas*coste_hora
  }
  neto=bruto*(1-retenciones)
  return(list("Salario Bruto"=bruto,"Salario Neto"=neto))
}
salario(20,50,0.2)

salario(35)

#Calcular la media de un vector numerico, sumando todos sus elementos y dividiendo entre el numero de elementos, sin emplear las funciones 
#de R (mean()). Emplear un bucle for
media<-function(x) {
  resultado<-0
  for(i in 1:length(x)){
    resultado<-resultado+x[i]
  }
  resultado/length(x)
}
media(1:11)

#Bucle While

media<-function(x){
  resultado<-0
  i<-1
  while(i<=length(x)){
    resultado<-resultado+x[i]
    i<-i+1
  }
  resultado/length(x)
}
media(20:30)

#Vectorización
media<-function(x){
  sum(x)/length(x)
}
media(20:30)
