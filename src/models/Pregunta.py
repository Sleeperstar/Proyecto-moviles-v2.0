from src.database.db import db

class Pregunta(db.Model):
  id_preg = db.Column(db.Integer, primary_key=True)
  pregunta = db.Column(db.Text)

  def __init__(self, pregunta) -> None:
    self.pregunta = pregunta
  
  def to_json(self):
    return {
      'id_preg': self.id_preg,
      'pregunta' : self.pregunta
    }