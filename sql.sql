-- SECUENCIAS

CREATE SEQUENCE paciente_seq
	AS INT
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    MAXVALUE 1999;

CREATE SEQUENCE pac_exp_seq
	AS INT
    START WITH 10000
    INCREMENT BY 1
    MINVALUE 10000
    MAXVALUE 19999;

CREATE SEQUENCE expediente_seq
	AS INT
    START WITH 20000
    INCREMENT BY 1
    MINVALUE 20000
    MAXVALUE 29999;

CREATE SEQUENCE exp_cuest_det_seq
	AS INT
    START WITH 100000
    INCREMENT BY 1
    MINVALUE 100000
    MAXVALUE 199999;

CREATE SEQUENCE cuest_det_seq
	AS INT
    START WITH 200000
    INCREMENT BY 1
    MINVALUE 200000
    MAXVALUE 299999;

CREATE SEQUENCE cuestionario_seq
	AS INT
    START WITH 100
    INCREMENT BY 1
    MINVALUE 100
    MAXVALUE 199;

CREATE SEQUENCE cuest_preg_seq
	AS INT
    START WITH 200
    INCREMENT BY 1
    MINVALUE 200
    MAXVALUE 599;

CREATE SEQUENCE pregunta_seq
	AS INT
    START WITH 600
    INCREMENT BY 1
    MINVALUE 600
    MAXVALUE 999;

CREATE SEQUENCE det_preg_seq
	AS INT
    START WITH 1000000
    INCREMENT BY 1
    MINVALUE 1000000
    MAXVALUE 2999999;



-- TABLAS

CREATE TABLE Paciente (
	id_pac INT DEFAULT NEXTVAL('paciente_seq') PRIMARY KEY,
	nom_comp VARCHAR(120) NOT NULL,
    direc VARCHAR(120),
	email VARCHAR(80) UNIQUE NOT NULL,
	contra TEXT NOT NULL
);

CREATE TABLE Expediente (
    id_exp INT DEFAULT NEXTVAL('expediente_seq') PRIMARY KEY,
    fecha_creacion DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    tratamiento_recib TEXT,
    medic_curso TEXT,
    hosp_cirug TEXT,
    alerg_reac TEXT
);

CREATE TABLE Pac_Exp (
    id_pac_exp INT DEFAULT NEXTVAL('pac_exp_seq') PRIMARY KEY,
    id_pac INT,
    id_exp INT,
    FOREIGN KEY (id_pac) REFERENCES Paciente(id_pac),
    FOREIGN KEY (id_exp) REFERENCES Expediente(id_exp)
);

CREATE TABLE Cuestionario (
    id_cuest INT DEFAULT NEXTVAL('cuestionario_seq') PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    descripcion TEXT
);


CREATE TABLE Pregunta (
    id_preg INT DEFAULT NEXTVAL('pregunta_seq') PRIMARY KEY,
    pregunta TEXT NOT NULL
);

CREATE TABLE Cuest_Preg (
    id_cuest_preg INT DEFAULT NEXTVAL('cuest_preg_seq') PRIMARY KEY,
    id_cuest INT,
    id_preg INT,
    FOREIGN KEY (id_cuest) REFERENCES Cuestionario(id_cuest),
    FOREIGN KEY (id_preg) REFERENCES Pregunta(id_preg)
);

CREATE TABLE Cuest_Det (
    id_cuest_det INT DEFAULT NEXTVAL('cuest_det_seq') PRIMARY KEY,
    punt_total INT,
    fecha DATE,
    id_cuest INT,
    FOREIGN KEY (id_cuest) REFERENCES Cuestionario(id_cuest)
);

CREATE TABLE Det_Preg (
    id_det_preg INT DEFAULT NEXTVAL('det_preg_seq') PRIMARY KEY,
    puntuacion INT,
    id_preg INT,
    id_cuest_det INT,
    FOREIGN KEY (id_preg) REFERENCES Pregunta(id_preg),
    FOREIGN KEY (id_cuest_det) REFERENCES Cuest_Det(id_cuest_det)
);

CREATE TABLE Exp_Cuest_Det (
    id_exp_cuest_det INT DEFAULT NEXTVAL('exp_cuest_det_seq') PRIMARY KEY,
    id_exp INT,
    id_cuest_det INT,
    FOREIGN KEY (id_exp) REFERENCES Expediente(id_exp),
    FOREIGN KEY (id_cuest_det) REFERENCES Cuest_Det(id_cuest_det)
);



-- Scripts

-- Datos inciales
INSERT INTO Paciente (nom_comp, direc, email, contra)
	VALUES	('Alberto Piedra Soto', 'Av. Arequipa', 'apiedra@gmail.com', 'apiedra'),
			('Maria Cuadros Echevarria', 'Av. Brasil', 'mcuadros@gmail.com', 'mcuadros');

INSERT INTO Cuestionario (titulo, descripcion)
	VALUES	('Cuest. Ansiedad de Zung', 'Cuestionario para evaluar la depresión.'),
			('Cuest. Ansiedad Estado-Rasgo (STAI) - A/E', 'Evalua la ansiedad como estado en individuos'),
			('Cuest. Ansiedad Estado-Rasgo (STAI) - A/R', 'Evalua la ansiedad como rasgo en individuos'),
			('Inventario de Ansiedad de Beck (BAI)', 'Mide la severidad de la ansiedad en adultos y adolescentes.');

INSERT INTO Pregunta(pregunta)
	VALUES	('¿Se ha sentido últimamente más nervioso y ansioso?'),
			('¿Se ha sentido temeroso/asustado sin razón?'),
			('¿Se ha irritado fácilmente o ha sentido pánico?'),
			('¿Ha sentido que se está derrumbando?'),
			('¿Ha sentido que nada malo va a pasar/que va todo bien?'),
			('¿Se ha sentido tembloroso?'),
			('¿Le ha dolido el cuello, la espalda o la cabeza?'),
			('¿Se ha sentido débil y se cansa fácilmente?'),
			('¿Se ha sentido calmado y puede mantenerse quieto?'),
			('¿Ha sentido palpitaciones, taquicardia, últimamente?'),
			('¿Se ha sentido últimamente mareado?'),
			('¿Se ha desmayado o ha sentido síntomas de desmayo?'),
			('¿Ha podido respirar con facilidad?'),
			('¿Ha sentido hormigueo/falta de sensibilidad en los dedos?'),
			('¿Ha sentido náuseas y malestar en el estómago?'),
			('¿Ha orinado con mayor frecuencia de lo normal?'),
			('¿Ha sentido sus manos secas y calientes?'),
			('¿Se ha ruborizado con frecuencia?'),
			('¿Ha dormido bien y descansado toda la noche?'),
			('¿Ha tenido pesadillas?');

INSERT INTO Cuest_Preg(id_cuest, id_preg)
	VALUES 	(100, 600),
			(100, 601),
			(100, 602),
			(100, 603),
			(100, 604),
			(100, 605),
			(100, 606),
			(100, 607),
			(100, 608),
			(100, 609),
			(100, 610),
			(100, 611),
			(100, 612),
			(100, 613),
			(100, 614),
			(100, 615),
			(100, 616),
			(100, 617),
			(100, 618),
			(100, 619);

INSERT INTO Pregunta(pregunta)
	VALUES	('Me siento calmado'),
			('Me siento seguro'),
			('Estoy tenso'),
			('Estoy contrariado'),
			('Me siento comodo (estoy a gusto)'),
			('Me siento alterado'),
			('Estoy preocupado por posibles desgracias futuras'),
			('Me siento descansado'),
			('Me siento angustiado'),
			('Me siento confortable'),
			('Tengo confianza en mi mismo'),
			('Me siento nervioso'),
			('Estoy desasosegado'),
			('Me siento muy "atado" (como oprimido)'),
			('Estoy relajado'),
			('Me siento satisfecho'),
			('Estoy preocupado'),
			('Me siento aturdido y sobreexcitado'),
			('Me siento alegre'),
			('En este momento me siento bien');

INSERT INTO Cuest_Preg(id_cuest, id_preg)
	VALUES 	(101, 620),
			(101, 621),
			(101, 622),
			(101, 623),
			(101, 624),
			(101, 625),
			(101, 626),
			(101, 627),
			(101, 628),
			(101, 629),
			(101, 630),
			(101, 631),
			(101, 632),
			(101, 633),
			(101, 634),
			(101, 635),
			(101, 636),
			(101, 637),
			(101, 638),
			(101, 639);


INSERT INTO Pregunta(pregunta)
	VALUES	('Me siento bien'),
			('Me canso rápidamente'),
			('Siento ganas de llorar'),
			('Me gustaria estar tan feliz como otros'),
			('Pierdo oportunidades por no decidirme pronto'),
			('Me siento descansado'),
			('Soy una persona tranquila, serena y sosegada'),
			('Veo que las dificultades se amontonan y no puedo con ellas'),
			('Me preocupo demasiado por cosas sin importancia'),
			('Soy feliz'),
			('Suelo tomar las cosas demasiado seriamente'),
			('Me falta confianza em mi mismo'),
			('Me siento seguro'),
			('Evito enfrentarme a las crisis o dificultades'),
			('Me siento triste (melancolico)"'),
			('Estoy satisfecho'),
			('Me rondan y molestan pensamientos sin importancia'),
			('Me afectan tanto los desengaños que no puedo olvidarlos'),
			('Soy una persona estable'),
			('Cuando pienso sobre asuntos y preocupaciones actuales, me pongo tenso y agitado');

INSERT INTO Cuest_Preg(id_cuest, id_preg)
	VALUES 	(102, 640),
			(102, 641),
			(102, 642),
			(102, 643),
			(102, 644),
			(102, 645),
			(102, 646),
			(102, 647),
			(102, 648),
			(102, 649),
			(102, 650),
			(102, 651),
			(102, 652),
			(102, 653),
			(102, 654),
			(102, 655),
			(102, 656),
			(102, 657),
			(102, 658),
			(102, 659);

INSERT INTO Pregunta(pregunta)
	VALUES	('Insensibilidad fisica o cosquilleo'),
			('Acaloramiento'),
			('Debilidad en las piernas'),
			('Incapacidad para relajarme'),
			('Temor a que suceda lo peor'),
			('Mareos o vertigos'),
			('Aceleracion del ritmo cardiaco'),
			('Sensacion de inestabilidad e inseguridad fisica'),
			('Sensacion de estar aterrorizado'),
			('Nerviosismo'),
			('Sensacion de ahogo'),
			('Temblor en las manos'),
			('Temblor generalizado o estremecimiento'),
			('Miedo a perder el control'),
			('Dificultad para respirar'),
			('Miedo a morir'),
			('Estar asustado'),
			('Indigestion o malestar en el abdomen'),
			('Sensacion de irse a desmayar'),
			('Rubor facial'),
			('Sudor (no debido al calor)');

INSERT INTO Cuest_Preg(id_cuest, id_preg)
	VALUES 	(103, 660),
			(103, 661),
			(103, 662),
			(103, 663),
			(103, 664),
			(103, 665),
			(103, 666),
			(103, 667),
			(103, 668),
			(103, 669),
			(103, 670),
			(103, 671),
			(103, 672),
			(103, 673),
			(103, 674),
			(103, 675),
			(103, 676),
			(103, 677),
			(103, 678),
			(103, 679),
			(103, 680);







-- Obtener paciente por correo y contraseña
SELECT PAC.* FROM Paciente PAC
	WHERE PAC.email = 'apiedra@gmail.com'
		AND PAC.contra = 'apiedra';

-- Registro de paciente
INSERT INTO Paciente (nom_comp, direc, email, contra)
	VALUES	('Estefano Puerta Trelo', 'Av. Peru', 'epuerta@gmail.com', 'epuerta');
select * from paciente;

-- Obtener cuestionarios
SELECT CUEST.* FROM Cuestionario CUEST;

-- Obtener preguntas de un cuestionario por id_cuest
SELECT PREG.* FROM Pregunta PREG, Cuest_Preg CPREG
	WHERE CPREG.id_preg = PREG.id_preg
		AND CPREG.id_cuest = '101';

-- Guardar test del usuario
-- Requiere id_cuest, todos los id_preg, todas las respuestas
DO $$
DECLARE
    nuevo_id_cuest_det INT;
	--nuevo_id_exp INT;
BEGIN
    -- Insertar nuevo cuest_det
    INSERT INTO Cuest_Det(fecha, id_cuest)
		VALUES	(TO_DATE(CURRENT_DATE::text, 'YYYY-MM-DD'), '100')
		RETURNING id_cuest_det INTO nuevo_id_cuest_det;
	
	INSERT INTO Det_Preg(puntuacion, id_preg, id_cuest_det)
		VALUES	('2', 601, nuevo_id_cuest_det),
				('3', 602, nuevo_id_cuest_det),
				('4', 603, nuevo_id_cuest_det),
				('1', 604, nuevo_id_cuest_det),
				('2', 605, nuevo_id_cuest_det),
				('3', 606, nuevo_id_cuest_det),
				('4', 607, nuevo_id_cuest_det),
				('1', 608, nuevo_id_cuest_det),
				('1', 609, nuevo_id_cuest_det),
				('1', 610, nuevo_id_cuest_det),
				('2', 611, nuevo_id_cuest_det),
				('2', 612, nuevo_id_cuest_det),
				('3', 613, nuevo_id_cuest_det),
				('3', 614, nuevo_id_cuest_det),
				('2', 615, nuevo_id_cuest_det),
				('4', 616, nuevo_id_cuest_det),
				('4', 617, nuevo_id_cuest_det),
				('1', 618, nuevo_id_cuest_det),
				('2', 619, nuevo_id_cuest_det);
	
	--INSERT INTO Expediente(fecha_creacion, estado)
	--	VALUES 	(TO_DATE(CURRENT_DATE::text), 'Abierto')
	--	RETURNING id_exp INTO nuevo_id_exp;
	
	--INSERT INTO Exp_Cuest_Det
	
	
END $$;

-- Ver todos los cuest_det
select * from cuest_det;

-- Ver preguntas por un cuestionario detalle
SELECT * from Det_Preg WHERE id_cuest_det = 200002;