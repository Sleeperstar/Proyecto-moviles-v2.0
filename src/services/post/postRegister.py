from src.database.db import connection

from src.models.Paciente import Paciente

def postRegister(nombre, direccion, email, contra):
  try:
    conn = connection()
    inst =  '''
                INSERT INTO Paciente (nom_comp, direc, email, contra)
	                VALUES	(%(nombre)s, %(direccion)s, %(email)s, %(contra)s);
            '''
    with conn.cursor() as cursor:
      cursor.execute(inst, {'nombre': nombre, 'direccion':direccion, 'email':email, 'contra':contra})
      conn.commit()
      cursor.close()
    conn.close()
    return True
  except Exception as e:
    print("→ Error: "+e)
    return False