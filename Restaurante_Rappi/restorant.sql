CREATE SCHEMA IF NOT EXISTS restaurante;   
    

-- categorias
CREATE TABLE IF NOT EXISTS restaurante.categorias (
    id_categoria INT UNIQUE NOT NULL PRIMARY KEY,
    entrada VARCHAR(70) NOT NULL,
    plato_fuerte VARCHAR(70) NOT NULL,
    bebida VARCHAR(70) NOT NULL
);   
    

-- clientes
CREATE TABLE IF NOT EXISTS restaurante.clientes (
    cedula_cliente INT UNIQUE NOT NULL PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    domicilio VARCHAR(30) NOT NULL,
    zona VARCHAR(50) NOT NULL,
    CONSTRAINT chk_celular CHECK (telefono ~ '^[0-9]{10}$')
);   
    

-- motos
CREATE TABLE IF NOT EXISTS restaurante.motos (
    id_placa INT UNIQUE NOT NULL PRIMARY KEY,
    marca VARCHAR(70) NOT NULL,
    fecha_limite DATE NOT NULL,
    numero_soat VARCHAR(50) NOT NULL,
    CONSTRAINT unq_soat_moto UNIQUE (numero_soat)
);   
    

-- domiciliarios
CREATE TABLE IF NOT EXISTS restaurante.domiciliarios (
    id_repartidor INT UNIQUE NOT NULL PRIMARY KEY,
    nombre_repartidor VARCHAR(50) NOT NULL,
    id_placa INT UNIQUE NOT NULL,
    CONSTRAINT fkey_placa FOREIGN KEY (id_placa) REFERENCES restaurante.motos (id_placa)
);   
    

-- platos
CREATE TABLE IF NOT EXISTS restaurante.platos (
    id_plato INT UNIQUE NOT NULL PRIMARY KEY,
    nombre_plato VARCHAR(50) NOT NULL,
    precio_hoy DECIMAL(10,0) NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT chk_precio_actual CHECK (precio_hoy > 0),
    CONSTRAINT fkey_categoria FOREIGN KEY (id_categoria) REFERENCES restaurante.categorias (id_categoria)
);   
    

-- pedidos
CREATE TABLE IF NOT EXISTS restaurante.pedidos (
    id_pedido INT UNIQUE NOT NULL PRIMARY KEY,
    unidades INT NOT NULL,
    precio_cada_uno DECIMAL(10,0) NOT NULL,
    id_repartidor INT NOT NULL,
    id_plato INT NOT NULL,
    cedula_cliente INT NOT NULL,
    situacion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_cantidad CHECK (unidades > 0),
    CONSTRAINT chk_precio_uni CHECK (precio_cada_uno > 0),
    CONSTRAINT chk_estado CHECK (situacion IN ('recibido', 'en preparación', 'en camino', 'entregado')),
    CONSTRAINT fkey_domiciliario FOREIGN KEY (id_repartidor) REFERENCES restaurante.domiciliarios (id_repartidor),
    CONSTRAINT fkey_plato FOREIGN KEY (id_plato) REFERENCES restaurante.platos (id_plato),
    CONSTRAINT fkey_cedula FOREIGN KEY (cedula_cliente) REFERENCES restaurante.clientes (cedula_cliente)
);   
    

-- solicitud
CREATE TABLE IF NOT EXISTS restaurante.solicitud (
    id_solicitud INT UNIQUE NOT NULL PRIMARY KEY,
    id_plato INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT unq_pedido_plato UNIQUE (id_pedido, id_plato),
    CONSTRAINT fkey_pedido FOREIGN KEY (id_pedido) REFERENCES restaurante.pedidos (id_pedido),
    CONSTRAINT fkey_plato FOREIGN KEY (id_plato) REFERENCES restaurante.platos (id_plato)
);   
    
