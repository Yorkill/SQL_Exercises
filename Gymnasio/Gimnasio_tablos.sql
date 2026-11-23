INSERT INTO gim.planes (id_plan, nombre_plan, meses, costo) 
VALUES(1,'Mensual',3,32000);

INSERT INTO gim.entrenadores (documento_entrenador, nombre_entrenador, area) 
VALUES('323123','Rudeus Greyrat','circuitos de fuerza');   
    

INSERT INTO gim.socios (documento_socio, nombre_socio, telefono, fecha_inscripcion, id_plan) 
VALUES('12345','Ariel Gonzales','3121234567','2026/01/10', 1);

INSERT INTO gim.clases (id_clase, nombre_clase, hora_clase, documento_entrenador) 
VALUES(3,'speed test ','Lunes 10:00 p.m.','323123');   
    

INSERT INTO gim.tarjetas (id_tarjeta, fecha_fin, documento_socio) 
VALUES('TS003','2026/04/22','43432');   
    

INSERT INTO gim.asistencias (id_asistencia, documento_socio, id_clase, dia) 
VALUES(3,'34567',23,'2026/12/11');   
    
