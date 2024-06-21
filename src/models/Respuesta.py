class Respuesta:
    def __init__(self, puntuacion, id_preg, id_cuest_det):
        self.puntuacion = puntuacion
        self.id_preg = id_preg
        self.id_cuest_det = id_cuest_det

    def to_json(self):
        return {
            'puntuacion': self.puntuacion,
            'id_preg': self.id_preg,
            'id_cuest_det': self.id_cuest_det
        }
