#Ejercicio1-Define una variable llamada numero con el valor 10 y otra llamada nombre con tu nombre
numero<-10
mi_nombre<-"Elena"
#Ejercicio2-Utiliza las funciones class e is.numeric para determinar el tipo de dato de numero
class(numero)
is.numeric(numero)
# Ejercicio3-Realiza una operación aritmética que sume numero y el doble de numero
(numero*2)+numero
#Ejercicio4-Crea un vector llamado edades con las edades de tres personas y una lista llamada informacion con el nombre y la edad de una persona.
edades<-c(11,5,28)
list("Julia",22)
#Ejercicio5-Verifica si nombre es de tipo caracter y si numero es de tipo lógico.
is.character(mi_nombre)
is.logical(numero)
#Ejercicio6-Crea una variable llamada mayor_de_edad que sea TRUE si la edad de la primera persona en edades es mayor o igual a 18.
mayor_de_edad<-edades[1]>=18
print(mayor_de_edad)
#Ejercicio7-Utiliza el operador %in% para verificar si el valor 30 está presente en el vector edades.
edades%in%30
#Ejercicio8-Compara si el doble de numero es mayor que edades[3]
(numero*2)>edades[3]
#Ejercicio9-Define dos variables lógicas, condicion1 y condicion2 , ambas con valor TRUE . Comprueba si ambas condiciones son verdaderas
condicion1<-TRUE
condicion2<-TRUE
condicion1&condicion2==TRUE
#Ejercicio10-Define una variable lógica, verdadero , con valor TRUE . Comprueba que su valor NO sea verdadero.
verdadero<-TRUE
verdadero!=TRUE