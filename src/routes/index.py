from flask import Blueprint, jsonify, request

# Importa las funciones de servicio necesarias
from src.services.post.postLogin import postLogin
from src.services.post.postRegister import postRegister
from src.services.get.getCuestionarios import getCuestionarios
from src.services.post.postObtenerCuestionario import postObtenerCuestionario
from src.services.post.postRegistrarRespuestas import postRegistrarRespuestas  # Asegúrate de agregar esta línea
from src.services.post.postObtenerRespuestas import postObtenerRespuestas  # Asegúrate de agregar esta línea


# Importa el modelo Paciente
from src.models.Paciente import Paciente

# Crea un Blueprint para agrupar rutas
main = Blueprint('index_blueprint', __name__)

# Ruta para iniciar sesión
@main.route("/iniciarSesion", methods=['POST'])
def iniciarSesion():
    try:
        data = request.get_json()  # Obtiene los datos del cuerpo de la solicitud
        email = data['email']
        contra = data['contra']
        paciente = postLogin(email, contra)  # Llama a la función de inicio de sesión
        if paciente != '':
            paciente = paciente.to_json()
            return jsonify({'message': 'COMPLETE', 'success': True, 'data': paciente})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})

# Ruta para registrar un nuevo paciente
@main.route("/registrar", methods=['POST'])
def register():
    try:
        data = request.get_json()  # Obtiene los datos del cuerpo de la solicitud
        nom_comp = data['nom_comp']
        direc = data['direc']
        email = data['email']
        contra = data['contra']
        registrado = postRegister(nom_comp, direc, email, contra)  # Llama a la función de registro
        if registrado:
            return jsonify({'message': 'COMPLETE', 'success': True})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})

# Ruta para obtener todos los cuestionarios
@main.route("/cuestionarios")
def cuestionarios():
    try:
        cuestionarios = getCuestionarios()  # Llama a la función para obtener cuestionarios
        if cuestionarios != '':
            return jsonify({'message': 'COMPLETE', 'success': True, 'data': cuestionarios})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})

# Ruta para obtener un cuestionario completo dado su ID
@main.route("/cuestionarioCompleto", methods=['POST'])
def cuestionario():
    try:
        data = request.get_json()  # Obtiene los datos del cuerpo de la solicitud
        id_cuest = data['id_cuest']
        cuestionario = postObtenerCuestionario(id_cuest)  # Llama a la función para obtener el cuestionario
        if cuestionario != '':
            return jsonify({'message': 'COMPLETE', 'success': True, 'data': cuestionario})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})

# Ruta para registrar respuestas
@main.route("/registrarRespuestas", methods=['POST'])
def registrarRespuestas():
    try:
        data = request.get_json()  # Obtiene los datos del cuerpo de la solicitud
        id_cuest = data['id_cuest']
        respuestas = data['respuestas']  # Lista de diccionarios con id_preg y respuesta
        registrado = postRegistrarRespuestas(id_cuest, respuestas)  # Llama a la función de registrar respuestas
        if registrado:
            return jsonify({'message': 'COMPLETE', 'success': True})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})
    
# Ruta para obtener respuestas de un cuestionario específico
@main.route("/obtenerRespuestas", methods=['POST'])
def obtenerRespuestas():
    try:
        data = request.get_json()  # Obtiene los datos del cuerpo de la solicitud
        id_cuest_det = data['id_cuest_det']
        respuestas = postObtenerRespuestas(id_cuest_det)  # Llama a la función para obtener respuestas
        if respuestas != '':
            return jsonify({'message': 'COMPLETE', 'success': True, 'data': respuestas})
        else:
            return jsonify({'message': 'NOT FOUND', 'success': True})
    except Exception as e:
        return jsonify({'message': 'ERROR', 'success': False})
    
