from src.database.db import connection

from src.models.Cuestionario import Cuestionario

def getCuestionarios():
  try:
    conn = connection()
    cuestionarios = []
    inst =  '''
                SELECT CUEST.* FROM Cuestionario CUEST;
            '''
    with conn.cursor() as cursor:
      cursor.execute(inst, )
      for row in cursor.fetchall():
        cuestionario = Cuestionario(row[1], row[2])
        cuestionario.id_cuest = row[0]
        cuestionarios.append(cuestionario.to_json())
      conn.commit()
      cursor.close()
    conn.close()
    return cuestionarios
  except Exception as e:
    print("→ Error: "+e)
    return ''