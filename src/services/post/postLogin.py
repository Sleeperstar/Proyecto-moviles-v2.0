from src.database.db import connection
from src.models.Paciente import Paciente

# Función para manejar el inicio de sesión
def postLogin(correo, contra):
    try:
        conn = connection()  # Conecta a la base de datos
        paciente = ''
        inst = '''
            SELECT PAC.* FROM Paciente PAC
            WHERE PAC.email = %(email)s
            AND PAC.contra = %(contra)s;
        '''
        # Ejecuta la consulta SQL y obtiene el resultado
        with conn.cursor() as cursor:
            cursor.execute(inst, {'email': correo, 'contra': contra})
            for row in cursor.fetchall():
                paciente = Paciente(row[1], row[2], row[3], row[4])
                paciente.id_pac = row[0]
            conn.commit()
            cursor.close()
        conn.close()
        return paciente  # Devuelve el paciente encontrado
    except Exception as e:
        print("→ Error: " + str(e))
        return ''
