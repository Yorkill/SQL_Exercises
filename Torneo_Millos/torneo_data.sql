INSERT INTO torneo.arbitros (id_arbitro, cedula, nombre_arbitro, telefono)
VALUES (1,'735129846','Julian Cifuentes','3045556677');

INSERT INTO torneo.canchas (id_cancha, nombre_cancha, zona, cupo)
VALUES (1,'La Bombonera','Sur',150);

INSERT INTO torneo.fichas (id_ficha, carrera, horario)
VALUES (1,'Contabilidad','Diurna');

INSERT INTO torneo.equipos (id_equipo, nombre_equipo, color, id_ficha)
VALUES (1,'Halcones','Negro',1);

INSERT INTO torneo.jugadores (id_jugador, cedula, nombre_jugador, nacimiento, numero, id_equipo, capitan)
VALUES (1,'1098765432','Andres Villalba','2004/09/12',11,1,TRUE);

INSERT INTO torneo.partidos (id_partido, dia, hora_inicio, ronda, id_cancha, equipo_local, equipo_visitante, goles_local, goles_visitante)
VALUES (1,'2026/12/11','18:00','semifinal',1,1,1,0,0);

INSERT INTO torneo.participaciones (id_jugador, id_partido, goles_marcados, amarillas, rojas, minutos)
VALUES (1,1,1,0,0,60);

INSERT INTO torneo.arbitrajes (id_arbitro, id_partido, puesto)
VALUES (1,1,'central');