INSERT INTO restaurante.categorias (id_categoria, entrada, plato_fuerte, bebida)
VALUES (1,'Sopa de cuchuco','Chuletas de cerdo','Chocolate santafereno');

INSERT INTO restaurante.clientes (cedula_cliente, nombre_cliente, telefono, domicilio, zona)
VALUES ('1048295731','Diego Salazar','3204567812','Carrera 9 # 4-77','Norte');

INSERT INTO restaurante.motos (id_placa, marca, fecha_limite, numero_soat)
VALUES (1,'AKT NKD 125','2027/06/18','SO0098712');

INSERT INTO restaurante.domiciliarios (id_repartidor, nombre_repartidor, id_placa)
VALUES (1,'Oscar Benavides',1);

INSERT INTO restaurante.platos (id_plato, nombre_plato, precio_hoy, id_categoria)
VALUES (1,'Sopa de cuchuco',9000,1);

INSERT INTO restaurante.pedidos (id_pedido, unidades, precio_cada_uno, id_repartidor, id_plato, cedula_cliente, situacion)
VALUES (1,2,9000,1,1,'1048295731','recibido');

INSERT INTO restaurante.solicitud (id_solicitud, id_plato, id_pedido)
VALUES (1,1,1);