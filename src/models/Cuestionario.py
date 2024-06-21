from src.database.db import db

class Cuestionario(db.Model):
  id_cuest = db.Column(db.Integer, primary_key=True)
  titulo = db.Column(db.String(120))
  descripcion = db.Column(db.Text)

  def __init__(self, titulo, descripcion) -> None:
    self.titulo = titulo
    self.descripcion = descripcion
  
  def to_json(self):
    return {
      'id_cuest': self.id_cuest,
      'titulo' : self.titulo,
      'descripcion' : self.descripcion
    }