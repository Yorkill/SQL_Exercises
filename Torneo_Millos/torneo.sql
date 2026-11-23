CREATE SCHEMA IF NOT EXISTS torneo;   
    

-- arbitros
CREATE TABLE IF NOT EXISTS torneo.arbitros (
    id_arbitro INT UNIQUE NOT NULL PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre_arbitro VARCHAR(80) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);   
    

-- canchas
CREATE TABLE IF NOT EXISTS torneo.canchas (
    id_cancha INT UNIQUE NOT NULL PRIMARY KEY,
    nombre_cancha VARCHAR(60) UNIQUE NOT NULL,
    zona VARCHAR(50) NOT NULL,
    cupo INT NOT NULL,
    CONSTRAINT chk_canchas_capacidad CHECK (cupo > 0)
);   
    

-- fichas
CREATE TABLE IF NOT EXISTS torneo.fichas (
    id_ficha INT UNIQUE NOT NULL PRIMARY KEY,
    carrera VARCHAR(50) NOT NULL,
    horario VARCHAR(15) NOT NULL
);   
    

-- equipos
CREATE TABLE IF NOT EXISTS torneo.equipos (
    id_equipo INT UNIQUE NOT NULL PRIMARY KEY,
    nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
    color VARCHAR(30) NOT NULL,
    id_ficha INT NOT NULL UNIQUE,
    CONSTRAINT fkey_codigo FOREIGN KEY (id_ficha) REFERENCES torneo.fichas (id_ficha)
);   
    

-- jugadores
CREATE TABLE IF NOT EXISTS torneo.jugadores (
    id_jugador INT UNIQUE NOT NULL PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL UNIQUE,
    nombre_jugador VARCHAR(50) NOT NULL,
    nacimiento DATE NOT NULL,
    numero INT NOT NULL,
    id_equipo INT NOT NULL,
    capitan BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT unq_camiseta_equipo UNIQUE (id_equipo, numero),
    CONSTRAINT chk_numero_camiseta CHECK (numero > 0),
    CONSTRAINT fkey_equipo FOREIGN KEY (id_equipo) REFERENCES torneo.equipos (id_equipo)
);   
    

-- partidos
CREATE TABLE IF NOT EXISTS torneo.partidos (
    id_partido INT UNIQUE NOT NULL PRIMARY KEY,
    dia DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    ronda VARCHAR(10) NOT NULL,
    id_cancha INT NOT NULL,
    equipo_local INT NOT NULL,
    equipo_visitante INT NOT NULL,
    goles_local INT NOT NULL DEFAULT 0,
    goles_visitante INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_partidos_fase CHECK (ronda IN ('grupos','cuartos','semifinal','final')),
    CONSTRAINT chk_partidos_marcador_local CHECK (goles_local >= 0),
    CONSTRAINT chk_partidos_marcador_visitante CHECK (goles_visitante >= 0),
    CONSTRAINT chk_partidos_equipos_distintos CHECK (equipo_local <> equipo_visitante),
    CONSTRAINT fkey_cancha FOREIGN KEY (id_cancha) REFERENCES torneo.canchas (id_cancha),
    CONSTRAINT fkey_local FOREIGN KEY (equipo_local) REFERENCES torneo.equipos (id_equipo),
    CONSTRAINT fkey_visitante FOREIGN KEY (equipo_visitante) REFERENCES torneo.equipos (id_equipo)
);   
    

-- participaciones
CREATE TABLE torneo.participaciones (
    id_jugador INT NOT NULL,
    id_partido INT NOT NULL,
    goles_marcados INT NOT NULL DEFAULT 0,
    amarillas INT NOT NULL DEFAULT 0,
    rojas INT NOT NULL DEFAULT 0,
    minutos INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_jugador, id_partido),
    CONSTRAINT chk_participaciones_goles CHECK (goles_marcados >= 0),
    CONSTRAINT chk_participaciones_amarillas CHECK (amarillas >= 0),
    CONSTRAINT chk_participaciones_roja CHECK (rojas >= 0),
    CONSTRAINT chk_participaciones_minutos CHECK (minutos >= 0),
    CONSTRAINT fkey_jugador FOREIGN KEY (id_jugador) REFERENCES torneo.jugadores (id_jugador),
    CONSTRAINT fkey_partido FOREIGN KEY (id_partido) REFERENCES torneo.partidos (id_partido)
);   
    

-- arbitrajes
CREATE TABLE torneo.arbitrajes (
    id_arbitro INT NOT NULL,
    id_partido INT NOT NULL,
    puesto VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_arbitro, id_partido),
    CONSTRAINT chk_arbitrajes_rol CHECK (puesto IN ('central', 'asistente','VAR')),
    CONSTRAINT fkey_arbitro FOREIGN KEY (id_arbitro) REFERENCES torneo.arbitros (id_arbitro),
    CONSTRAINT fkey_partido FOREIGN KEY (id_partido) REFERENCES torneo.partidos (id_partido)
);   
    
