from src.database.db import db

# Define el modelo Paciente
class Paciente(db.Model):
    id_pac = db.Column(db.Integer, primary_key=True)
    nom_comp = db.Column(db.String(120))
    direc = db.Column(db.String(120))
    email = db.Column(db.String(80))
    contra = db.Column(db.Text)

    # Constructor para inicializar una instancia de Paciente
    def __init__(self, nom_comp, direc, email, contra) -> None:
        self.nom_comp = nom_comp
        self.direc = direc
        self.email = email
        self.contra = contra

    # Método para convertir una instancia de Paciente a formato JSON
    def to_json(self):
        return {
            'id_pac': self.id_pac,
            'nom_comp': self.nom_comp,
            'direc': self.direc,
            'email': self.email,
            'contra': self.contra
        }
