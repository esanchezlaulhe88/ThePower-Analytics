#Ejercicio1-Define una variable llamada numero con el valor 10 y otra llamada nombre con tu nombre
Numero<-10
Nombre<-"Elena"
#Ejercicio2-Utiliza las funciones class e is.numeric para determinar el tipo de dato de numero
class(Numero)
is.numeric(Numero)
# Ejercicio3-Realiza una operación aritmética que sume numero y el doble de numero
Doble_de_Numero=(Numero*2)+Numero
#Ejercicio4-Crea un vector llamado edades con las edades de tres personas y una lista llamada informacion con el nombre y la edad de una persona.
edades<-c(29,32,11)
informacion<-list(edades[1],"Nombre"="Marta")
#Ejercicio5-Verifica si nombre es de tipo caracter y si numero es de tipo lógico.
is.character(Nombre)
is.logical(Numero)
#Ejercicio6-Crea una variable llamada mayor_de_edad que sea TRUE si la edad de la primera persona en edades es mayor o igual a 18.
mayor_de_edad<-edades[1]>17
#Ejercicio7-Utiliza el operador %in% para verificar si el valor 30 está presente en el vector edades.
edades%in%30
#Ejercicio8-Compara si el doble de numero es mayor que edades[3]
Doble_de_Numero>edades[3]
#Ejercicio9-Define dos variables lógicas, condicion1 y condicion2 , ambas con valor TRUE . Comprueba si ambas condiciones son verdaderas
edades>Numero
Doble_de_Numero>edades[3]
(edades[3])&(Numero)<Doble_de_Numero
#Ejercicio10-Define una variable lógica, verdadero , con valor TRUE . Comprueba que su valor NO sea verdadero.
mayor_de_edad<17
edades[1]<edades[3]
edades[1]!=mayor_de_edad
