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
elementos = ["nombre","presupuesto","personas_alcanzadas","tasa_conversion"]
print("Aquí tenemos las campañas:")
for campaña in lista_campañas:
  for elemento in elementos:
    print(f"{elemento} : {campaña[elemento]}\n")
    
medios_utilizados={medio for campaña in lista_campañas for medio in campaña["medios"]}
print(f"Los medios utilizados son: {medios_utilizados}")

conteo_medios={}
for campaña in lista_campañas:
  for medio in campaña["medios"]:
    if medio in conteo_medios:
      conteo_medios[medio] +=1
    else:
      conteo_medios[medio]=1
print(conteo_medios)
medio_mas_usado=max(conteo_medios)
print(f"El medio mas usado es {medio_mas_usado}")
medio_menos_usado=min(conteo_medios)
print(f"El medio menos usado es {medio_menos_usado}")

gasto_total=0
for campaña in lista_campañas:
  gasto_total += campaña["presupuesto"]
print(f"El gasto total en las campañas es: {gasto_total}")


for campaña in lista_campañas:
  campaña["conversiones"]=int(campaña["personas_alcanzadas"]*campaña["tasa_conversion"])
  print(f"Mi lista de campañas es {campaña["nombre"]} : {campaña["conversiones"]}")  

mayor_tasa_conversion= 0
campaña_buscada=[]
indice=0
print(len(lista_campañas))
while indice<len(lista_campañas):
  tasa_conversion_actual= lista_campañas[indice]["tasa_conversion"]
  print(tasa_conversion_actual)
  
  if tasa_conversion_actual>mayor_tasa_conversion:
    mayor_tasa_conversion=tasa_conversion_actual
    print(f"La mayor tasa de conversion actual es {mayor_tasa_conversion}")
    campaña_buscada = [lista_campañas[indice]["nombre"]]
  elif tasa_conversion_actual==mayor_tasa_conversion:
    campaña_buscada.append(lista_campañas[indice]["nombre"])
  indice += 1
  print(f"Las campañas buscadas son: {campaña_buscada}")
  
campañas_seleccionadas=[]
for campaña in lista_campañas:
  if campaña["tasa_conversion"] > 0.03 and campaña["presupuesto"] < 30000:
    campañas_seleccionadas.append((campaña["nombre"], campaña["tasa_conversion"], campaña["presupuesto"]))
print(f"Las campañas seleccionadas son: {campañas_seleccionadas}")
print(len(campañas_seleccionadas))