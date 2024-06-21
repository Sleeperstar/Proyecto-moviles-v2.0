from flask_sqlalchemy import SQLAlchemy
from config import dbname, host, password, port, user
import psycopg2

# Inicializa la extensión SQLAlchemy
db = SQLAlchemy()

# Función para conectarse a la base de datos PostgreSQL
def connection():
    db_config = {
        'dbname': dbname,
        'user': user,
        'password': password,
        'host': host,
        'port': port
    }

    try:
        # Intenta conectarse a la base de datos
        conn = psycopg2.connect(**db_config)
        print("→ Conexión a la BD exitosa")
        return conn
    except Exception as e:
        # Maneja cualquier error de conexión
        print(f"→ Error de conexión: {e}")
        return None
