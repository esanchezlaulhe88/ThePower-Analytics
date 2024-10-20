from datetime import datetime,timedelta
class Libro:
  def __init__(self,titulo,autor,precio):
    self.titulo=titulo
    self.autor=autor
    self.precio=precio
    self.qty=0
  def establecer_qty(self):
    while True:
      try:
        qty=int(input(f"Ingrese el nº de libros de {self.titulo} actualmente en stock: "))
        if qty < 0:
          print("Error. Cantidad negativa introducida")
        else:
          self.qty=qty
          break
      except ValueError:
        print("Error. Ingrese un nº entero válido")
    return qty
  def info_libro(self):
    info=""
    info+="Titulo: " + self.titulo + "\n"
    info+="Autor: " + self.autor + "\n"
    info+="Precio en €: " + str(self.precio) + "\n"
    info+="Cantidad en stock: " + str(self.qty) + "\n"
    return info
class LibroFisico(Libro):
  def __init__(self,titulo,autor,precio,categoria,peso):
    super().__init__(titulo,autor,precio)
    self.categoria=categoria
    self.peso=peso
  def envio(self,dias_envio=5):
    hoy = datetime.now()
    fecha_entrega= hoy + timedelta(days=dias_envio)
    return fecha_entrega
  def info_libro(self):
    info = super().info_libro()
    info += "Categoría: " + self.categoria + "\n"
    info += "Peso en gramos: " + str(self.peso) + "\n"
    if self.qty >0:
      info += "Fecha de entrega: " + str(self.envio().strftime("%Y-%m-%d")) + "\n"
    else:
      info+="No disponemos de stock en este momento \n"
    return info
class AudioLibro(Libro):
  def __init__(self,titulo,autor,precio,categoria,duracion):
    super().__init__(titulo,autor,precio)
    self.categoria=categoria
    self.duracion=duracion
  def obtener_duracion(self):
    horas=self.duracion//3600
    minutos=(self.duracion%3600)//60
    segundos=self.duracion%60
    formato_duracion= str(horas)+":"+str(minutos)+":"+str(segundos)
    return formato_duracion
  def info_libro(self):
    info = super().info_libro()
    info += "Categoría: " + self.categoria + "\n"
    info += "Duración: " + str(self.obtener_duracion()) + "\n"
    return info
class Ecommerce:
  def __init__(self):
    self.carrito=[]
    self.inventario={}
  def agregar_al_inventario(self,producto):
    self.inventario[producto.titulo.lower()]=producto
  def ver_producto(self,nombre_producto):
    nombre_producto=nombre_producto.strip().lower()
    if nombre_producto in self.inventario:
      producto=self.inventario[nombre_producto]
      print(producto.info_libro())
    else:
      print(f"El producto {nombre_producto} no se encuentra")
  def ver_inventario(self):
    print("\nInventario: ")
    for producto in self.inventario.values():
      print(producto.info_libro())
  def agregar_al_carrito(self,nombre_producto):
    nombre_producto=nombre_producto.strip().lower()
    if nombre_producto in self.inventario:
      producto=self.inventario[nombre_producto]
      if producto.qty > 0:
        self.carrito.append(producto)
        producto.qty-=1
    else:
      print(f"El producto {nombre_producto} no se encuentra")
      
  def calcular_precio_total(self):
    total_precio=sum(producto.precio for producto in self.carrito)
    print(f"El precio a pagar es: {total_precio}")
    return (total_precio)
  def pagar (self):
    total_precio=self.calcular_precio_total()
    while True:
      try:
        monto=float(input("Por favor,ingrese el dinero correspondiente a su compra: "))
        if monto >= total_precio:
          cambio=monto-total_precio
          print(f"Compra realizada correctamente. La vuelta de su pago es {cambio}. Muchas gracias por su pedido.\n")
          self.carrito=[]
          break
        else:
          print("La cantidad aportada no es suficiente para realizar su pedido")
      except ValueError:
        print("Por favor, ingrese una cantidad válida")

  def ver_carrito(self):
    if len(self.carrito)>0:
      print("\nProducto en el carrito:")
      for producto in self.carrito:
        print(producto.titulo)

      
libro1=LibroFisico("La Comunidad del Anillo","J.R.R.Tolkien",29.99,"Libro Físico",950)

libro1.establecer_qty()
libro1.envio(11)
print(libro1.info_libro())

libro2=AudioLibro("La Fundación","Isaac Asimov",12.15,"Audiolibro",5955)
libro2.establecer_qty()
print(libro2.info_libro())

ecommerce=Ecommerce()
ecommerce.agregar_al_inventario(libro1)
ecommerce.agregar_al_inventario(libro2)

while True:
  opcion=input("¿Qué producto deseas agregar al carrito?: ")
  if opcion.lower()=="fin":
    ecommerce.ver_carrito()
    ecommerce.calcular_precio_total()
    ecommerce.pagar()
    break
  else:
    ecommerce.agregar_al_carrito(opcion)

print("Este es el stock actual, tras procesar el último pedido: ")
ecommerce.ver_inventario()

