from src import init_app
from src.database.db import db
from flask_cors import CORS

# Inicializa la aplicación Flask
app = init_app()

# Inicializa la extensión de la base de datos con la aplicación
db.init_app(app)

# Empuja el contexto de la aplicación para que esté disponible globalmente
app.app_context().push()

# Habilita CORS (Cross-Origin Resource Sharing) para permitir solicitudes desde otros dominios
CORS(app)

# Ejecuta el servidor en modo debug si el archivo se ejecuta directamente
if __name__ == '__main__':
    app.run(debug=True)
