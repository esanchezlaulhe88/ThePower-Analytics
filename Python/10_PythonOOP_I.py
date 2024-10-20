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
    info += "Fecha de entrega: " + str(self.envio().strftime("%Y-%m-%d")) + "\n"
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
libro1=Libro("La Comunidad del Anillo","J.R.R.Tolkien",29.99)
libro1.establecer_qty()

libro_fisico=LibroFisico ("La Fundación","Isaac Asimov",22.11,"Libro Fisico",500)
libro_fisico.establecer_qty()

audio_libro=AudioLibro("La Buena Tierra","Pearl S. Book",12.35,"Audio Libro",110000)
audio_libro.establecer_qty()

print(libro1.info_libro())
print(libro_fisico.info_libro())
print(audio_libro.info_libro())
