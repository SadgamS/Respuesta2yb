CREATE DATABASE academico;

USE academico;

CREATE TABLE identificador(
    ci INT PRIMARY KEY,
    nombre_c VARCHAR(50),
    fecha_nac DATE,
    lugar_red VARCHAR(20)
);


CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    ci INT UNIQUE,
    clave VARCHAR(50),
    login VARCHAR(20),
    color VARCHAR(20),
    FOREIGN KEY (ci) REFERENCES identificador(ci)
);


INSERT INTO identificador VALUES (15531, 'Juan Perez','2001-06-21' ,'02');
INSERT INTO identificador VALUES (34312, 'Pablo Ma.', '1999-11-12', '03');
INSERT INTO identificador VALUES (66431, 'Mario AA', '2013-01-05','04');
INSERT INTO identificador VALUES (75323, 'Ana BB', '2006-03-14','02');
INSERT INTO identificador VALUES (82341, 'Rosa CC', '2004-04-18','03');
INSERT INTO identificador VALUES(34123, 'Pablo Ma.', '2004-05-18','03'),
                                    (65423, 'Mario AA', '2006-06-21','04'),
                                    (75456, 'Marta BB', '2005-01-21','05'),
                                    (84231, 'Rocio CC', '2004-02-21','06'),
                                    (97655, 'Pedro DD','2002-05-21' ,'07'),
                                    (104312, 'Judas EE', '2001-02-21','08'),
                                    (13211, 'Marco FF', '2012-04-21','09'),
                                    (15312, 'Juana GG', '2011-12-21','04'),
                                    (1233, 'Marta HH', '2000-12-11','05');

SELECT ci,CONCAT(ci,SUBSTR(nombre_c,1,1),SUBSTR(nombre_c,LENGTH(SUBSTRING_INDEX(nombre_c, " ", 1))+2,1))
FROM identificador;


INSERT INTO usuario(ci,clave,login,color) SELECT ci,ci,CONCAT(ci,SUBSTR(nombre_c,1,1),SUBSTR(nombre_c,LENGTH(SUBSTRING_INDEX(nombre_c, " ", 1))+2,1)),'' FROM identificador;

CREATE TABLE notas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    ci INT,
    materia VARCHAR(20),
    nota INT,
    FOREIGN KEY (ci) REFERENCES identificador(ci)
);

INSERT INTO notas(ci,materia,nota) VALUES (15531, 'INF-317', 51);
INSERT INTO notas(ci,materia,nota) VALUES (34312, 'INF-324', 40);
INSERT INTO notas(ci,materia,nota) VALUES (66431, 'INF-121', 41);
INSERT INTO notas(ci,materia,nota) VALUES (75323, 'INF-111', 67);
INSERT INTO notas(ci,materia,nota) VALUES (82341, 'INF-281', 80);
INSERT INTO notas(ci,materia,nota) VALUES (34123, 'INF-131', 38);
INSERT INTO notas(ci,materia,nota) VALUES (65423, 'INF-111', 80);
INSERT INTO notas(ci,materia,nota) VALUES (75456, 'INF-151', 56);
INSERT INTO notas(ci,materia,nota) VALUES (84231, 'INF-121', 58);
INSERT INTO notas(ci,materia,nota) VALUES (97655, 'MAT-114', 31);
INSERT INTO notas(ci,materia,nota) VALUES (104312, 'MAT-115', 59);
INSERT INTO notas(ci,materia,nota) VALUES (13211, 'INF-111', 85);
INSERT INTO notas(ci,materia,nota) VALUES (15312, 'INF-331', 70);
INSERT INTO notas(ci,materia,nota) VALUES  (1233, 'INF-324', 60);

-- Repuesta a la pregunta 2 b
SELECT  SUM(CASE WHEN i.lugar_red='01' AND n.nota>=51 THEN 1 ELSE 0 end ) as CHQ,
        SUM(CASE WHEN i.lugar_red='02' AND n.nota>=51 THEN 1 ELSE 0 end ) as LPZ,
        SUM(CASE WHEN i.lugar_red='03' AND n.nota>=51 THEN 1 ELSE 0 end ) as CHB,
        SUM(CASE WHEN i.lugar_red='04' AND n.nota>=51 THEN 1 ELSE 0 end ) as ORU,
        SUM(CASE WHEN i.lugar_red='05' AND n.nota>=51 THEN 1 ELSE 0 end ) as PTS,
        SUM(CASE WHEN i.lugar_red='06' AND n.nota>=51 THEN 1 ELSE 0 end ) as TAJ,
        SUM(CASE WHEN i.lugar_red='07' AND n.nota>=51 THEN 1 ELSE 0 end ) as SC,
        SUM(CASE WHEN i.lugar_red='08' AND n.nota>=51 THEN 1 ELSE 0 end ) as BNI,
        SUM(CASE WHEN i.lugar_red='09' AND n.nota>=51 THEN 1 ELSE 0 end ) as PND
FROM identificador i, notas n
WHERE i.ci = n.ci;

--Consulta para PHP
SELECT lugar_red,nota
FROM identificador i, notas n
WHERE i.ci = n.ci;