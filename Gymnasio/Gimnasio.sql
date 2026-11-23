CREATE SCHEMA IF NOT EXISTS gym;   
    

-- planes
CREATE TABLE IF NOT EXISTS gym.planes (
    id_plan INT NOT NULL PRIMARY KEY,
    nombre_plan VARCHAR(50) NOT NULL,
    meses INT NOT NULL,
    costo NUMERIC(10,2) NOT NULL,
    CONSTRAINT chk_planes_duracion CHECK (meses > 0),
    CONSTRAINT chk_planes_precio CHECK (costo > 0)
);   
    

-- entrenadores
CREATE TABLE IF NOT EXISTS gym.entrenadores (
    documento_entrenador VARCHAR(20) NOT NULL PRIMARY KEY,
    nombre_entrenador VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL
);   
    

-- socios
CREATE TABLE IF NOT EXISTS gym.socios (
    documento_socio VARCHAR(20) NOT NULL PRIMARY KEY,
    nombre_socio VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE,
    id_plan INT NOT NULL,
    CONSTRAINT fkey_socios_plan FOREIGN KEY (id_plan) REFERENCES gym.planes (id_plan)
);   
    

-- clases
CREATE TABLE IF NOT EXISTS gym.clases (
    id_clase INT NOT NULL PRIMARY KEY,
    nombre_clase VARCHAR(50) NOT NULL,
    hora_clase VARCHAR(50) NOT NULL,
    documento_entrenador VARCHAR(20) NOT NULL,
    CONSTRAINT fkey_clases_entrenador FOREIGN KEY (documento_entrenador) REFERENCES gym.entrenadores (documento_entrenador)
);   
    

-- tarjetas
CREATE TABLE IF NOT EXISTS gym.tarjetas (
    id_tarjeta VARCHAR(30) NOT NULL PRIMARY KEY,
    fecha_fin DATE NOT NULL,
    documento_socio VARCHAR(20) NOT NULL,
    CONSTRAINT unq_tarjetas_socio UNIQUE (documento_socio),
    CONSTRAINT fkey_tarjetas_socio FOREIGN KEY (documento_socio) REFERENCES gym.socios (documento_socio)
);   
    

-- asistencias
CREATE TABLE IF NOT EXISTS gym.asistencias (
    id_asistencia INT NOT NULL PRIMARY KEY,
    documento_socio VARCHAR(20) NOT NULL,
    id_clase INT NOT NULL,
    dia DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT unq_asistencias UNIQUE (documento_socio, id_clase, dia),
    CONSTRAINT fkey_asistencias_socio FOREIGN KEY (documento_socio) REFERENCES gym.socios (documento_socio),
    CONSTRAINT fkey_asistencias_clase FOREIGN KEY (id_clase) REFERENCES gym.clases (id_clase)
);   
    
