from src.database.db import connection

def postRegistrarRespuestas(id_cuest, respuestas):
    try:
        conn = connection()
        # Insertar nuevo registro en Cuest_Det
        inst_cuest_det = '''
            INSERT INTO Cuest_Det(fecha, id_cuest)
            VALUES (CURRENT_DATE, %(id_cuest)s)
            RETURNING id_cuest_det;
        '''
        with conn.cursor() as cursor:
            cursor.execute(inst_cuest_det, {'id_cuest': id_cuest})
            id_cuest_det = cursor.fetchone()[0]
            conn.commit()
        
        # Insertar respuestas en Det_Preg
        inst_det_preg = '''
            INSERT INTO Det_Preg(puntuacion, id_preg, id_cuest_det)
            VALUES (%(puntuacion)s, %(id_preg)s, %(id_cuest_det)s);
        '''
        with conn.cursor() as cursor:
            for respuesta in respuestas:
                cursor.execute(inst_det_preg, {
                    'puntuacion': respuesta['puntuacion'],
                    'id_preg': respuesta['id_preg'],
                    'id_cuest_det': id_cuest_det
                })
            conn.commit()
            cursor.close()
        conn.close()
        return True
    except Exception as e:
        print("→ Error: " + str(e))
        return False
