from src.database.db import connection
from src.models.Pregunta import Pregunta

def postObtenerRespuestas(id_cuest_det):
    try:
        conn = connection()
        respuestas = []
        inst = '''
            SELECT DP.puntuacion, PREG.pregunta FROM Det_Preg DP
            JOIN Pregunta PREG ON DP.id_preg = PREG.id_preg
            WHERE DP.id_cuest_det = %(id_cuest_det)s;
        '''
        with conn.cursor() as cursor:
            cursor.execute(inst, {'id_cuest_det': id_cuest_det})
            for row in cursor.fetchall():
                respuesta = {
                    'puntuacion': row[0],
                    'pregunta': row[1]
                }
                respuestas.append(respuesta)
            conn.commit()
            cursor.close()
        conn.close()
        return respuestas
    except Exception as e:
        print("→ Error: " + str(e))
        return ''
