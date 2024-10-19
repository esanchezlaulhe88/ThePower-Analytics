lista_campañas = [
    {
        'nombre': 'Rebajas de Enero',
        'presupuesto': 35000,
        'inicio': '2023-01-02',
        'fin': '2023-01-31',
        'medios': ['Publicidad en línea', 'Redes Sociales', 'Email Marketing'],
        'segmentos_objetivo': ['Clientes regulares', 'Potenciales compradores'],
        'personas_alcanzadas': 50000,
        'tasa_conversion': 0.02
    },
    {
        'nombre': 'San Valentín',
        'presupuesto': 25000,
        'inicio': '2023-02-01',
        'fin': '2023-02-14',
        'medios': ['Redes Sociales', 'Email Marketing', 'Publicidad impresa'],
        'segmentos_objetivo': ['Parejas', 'Jóvenes'],
        'personas_alcanzadas': 30000,
        'tasa_conversion': 0.05
    },
    {
        'nombre': 'Día del Padre',
        'presupuesto': 20000,
        'inicio': '2023-06-01',
        'fin': '2023-06-15',
        'medios': ['Redes Sociales', 'Colaboraciones con influencers', 'Publicidad impresa'],
        'segmentos_objetivo': ['Jóvenes', 'Familias'],
        'personas_alcanzadas': 25000,
        'tasa_conversion': 0.03
    },
    {
        'nombre': 'Día de la Madre',
        'presupuesto': 22000,
        'inicio': '2023-04-20',
        'fin': '2023-05-10',
        'medios': ['Publicidad en línea', 'Redes Sociales', 'Email Marketing'],
        'segmentos_objetivo': ['Jóvenes', 'Familias'],
        'personas_alcanzadas': 28000,
        'tasa_conversion': 0.04
    },
    {
        'nombre': 'Día del Friki',
        'presupuesto': 18000,
        'inicio': '2023-05-20',
        'fin': '2023-05-25',
        'medios': ['Publicidad en tiendas físicas', 'Redes Sociales', 'Colaboraciones con influencers'],
        'segmentos_objetivo': ['Jóvenes'],
        'personas_alcanzadas': 20000,
        'tasa_conversion': 0.05
    },
    {
        'nombre': 'Black Friday',
        'presupuesto': 50000,
        'inicio': '2023-11-21',
        'fin': '2023-11-30',
        'medios': ['Redes Sociales', 'Email Marketing', 'Publicidad en línea'],
        'segmentos_objetivo': ['Todos los compradores'],
        'personas_alcanzadas': 100000,
        'tasa_conversion': 0.03
    },
    {
        'nombre': 'Navidad',
        'presupuesto': 60000,
        'inicio': '2023-12-01',
        'fin': '2023-12-24',
        'medios': ['Publicidad en tiendas físicas', 'Redes Sociales', 'Publicidad impresa'],
        'segmentos_objetivo': ['Todos los compradores'],
        'personas_alcanzadas': 120000,
        'tasa_conversion': 0.04
    }
]

from datetime import datetime
print("La duración de las campañas es:\n")
for campaña in lista_campañas:
  fecha_inicio= datetime.strptime(campaña["inicio"],"%Y-%m-%d")
  fecha_fin= datetime.strptime(campaña["fin"],"%Y-%m-%d")
  campaña["duracion_dias"]=(fecha_fin-fecha_inicio).days
  print(f"{campaña["nombre"]}: {campaña["duracion_dias"]} días\n")

campaña_mas_larga=("",0)
for campaña in lista_campañas:
  if campaña['duracion_dias'] > campaña_mas_larga[1]:
    campaña_mas_larga=(campaña['nombre'],campaña['duracion_dias'])
  else:
    pass
print(campaña_mas_larga)

nueva_campaña = { 
    'nombre': 'Oferta de Verano',
    'presupuesto': 0,
    'inicio': '2024-06-01',
    'fin': '2024-08-31',
    'medios': ['Redes Sociales', 'Publicidad en línea'],
    'segmentos_objetivo': ['Familias', 'Jóvenes'],
    'personas_alcanzadas': "0",   
}
lista_campañas.append(nueva_campaña)
conteo_campañas=len(lista_campañas)
print(conteo_campañas)

for campaña in lista_campañas:
  try:
    tasa_conversion=campaña["tasa_conversion"]
    print(f"La tasa de conversión de {campaña["nombre"]} es {campaña["tasa_conversion"]}")
  except KeyError:
    print(f"La tasa de conversión de {campaña["nombre"]} es desconocida")
    pass

for campaña in lista_campañas:
  try:
    personas_alcanzadas=int(campaña["personas_alcanzadas"])
    print(f"Conversión exitosa para {campaña["nombre"]}")
  except ValueError:
    print(f"Error en campaña {campaña["nombre"]}")

for campaña in lista_campañas:
  try:
    presupuesto_persona=campaña["presupuesto"]/int(campaña["personas_alcanzadas"])
    print (f"El presupuesto por persona para la campaña {campaña["nombre"]} es {presupuesto_persona} €")
  except ZeroDivisionError:
    print (f"Error: el valor de personas_alcanzadas de la campaña {campaña["nombre"]} es 0")
  except ValueError:
    print (f"Error: el valor de personas_alcanzadas de la campaña {campaña["nombre"]} no es de tipo numérico")
  

