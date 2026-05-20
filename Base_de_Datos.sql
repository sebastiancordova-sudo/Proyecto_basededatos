USE `BiciSafe&TECH`;
INSERT INTO Cliente (Nombres, Telefono, Rol, Correo_Electronico)
VALUES
('Carlos Mendoza', '0991234567', 'Ciclista', 'carlos@gmail.com'),
('Andrea Lopez', '0987654321', 'Ciclista', 'andrea@gmail.com'),
('Luis Torres', '0971112233', 'Administrador', 'luis@gmail.com'),
('Maria Perez', '0962223344', 'Ciclista', 'maria@gmail.com'),
('Jorge Ramirez', '0953334455', 'Ciclista', 'jorge@gmail.com');

INSERT INTO Bicicleta (Marca, Modelo, Km_Totales, FK_ID_Usuario)
VALUES
('Trek', 'Marlin 7', 1200, 1),
('Giant', 'Escape 3', 850, 2),
('Specialized', 'Rockhopper', 2000, 3),
('Scott', 'Aspect 950', 430, 4),
('Cannondale', 'Trail 5', 1600, 5);

INSERT INTO Componente (Tipo_Pieza, Km_Actuales, Km_Limite, FK_ID_Bicicleta)
VALUES
('Cadena', 900, 1500, 1),
('Frenos', 400, 1000, 1),
('Llantas', 700, 2000, 2),
('Pedales', 300, 1200, 3),
('Suspension', 1500, 3000, 5);

INSERT INTO Contacto_Emergencia (Nombre_Emer, Tel_Emergencia, FK_ID_Usuario)
VALUES
('Ana Mendoza', '0998881111', 1),
('Pedro Lopez', '0987772222', 2),
('Sofia Torres', '0976663333', 3),
('Miguel Perez', '0965554444', 4),
('Lucia Ramirez', '0954445555', 5);

INSERT INTO Mecanico (Nombres, Especialidad)
VALUES
('Roberto Salazar', 'Frenos'),
('Diego Molina', 'Suspension'),
('Kevin Herrera', 'Transmision'),
('Pablo Castro', 'Llantas'),
('Fernando Ruiz', 'Mantenimiento General');

INSERT INTO Repuesto (Nombre_Pieza, Stock, Precio)
VALUES
('Cadena Shimano', 15, 35.50),
('Pastillas de Freno', 30, 18.75),
('Llanta Maxxis', 10, 45.00),
('Pedales Aluminio', 20, 28.90),
('Suspension Fox', 5, 250.00);

INSERT INTO Proveedor (Nombre_Emp, Telefono)
VALUES
('BikeParts Ecuador', '042223344'),
('CicloRepuestos SA', '042334455'),
('MountainBike Store', '042445566'),
('Bike World', '042556677'),
('FullBike Distribuidor', '042667788');

INSERT INTO Orden_Trabajo (Fecha, Diagnostico, Estado, Costo_Total, FK_ID_Bicicleta, FK_ID_Mecanico)
VALUES
('2026-05-01', 'Cambio de cadena', 'Finalizado', 45.00, 1, 3),
('2026-05-03', 'Revision de frenos', 'En Proceso', 25.00, 2, 1),
('2026-05-05', 'Cambio de llantas', 'Pendiente', 90.00, 3, 4),
('2026-05-07', 'Mantenimiento general', 'Finalizado', 120.00, 4, 5),
('2026-05-09', 'Ajuste de suspension', 'En Proceso', 80.00, 5, 2);

INSERT INTO Orden_Compra (Fecha, Monto_Total, FK_ID_Proveedor)
VALUES
('2026-05-02', 350.00, 1),
('2026-05-04', 420.00, 2),
('2026-05-06', 600.00, 3),
('2026-05-08', 275.00, 4),
('2026-05-10', 800.00, 5);

INSERT INTO Utiliza (FK_ID_Orden, FK_ID_Repuesto, Cantidad)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1);

INSERT INTO Incluye (FK_ID_Compra, FK_ID_Repuesto, Cantidad)
VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 15),
(4, 4, 12),
(5, 5, 4);

INSERT INTO Factura (Fecha, Subtotal, IVA, Total, Estado, FK_ID_Orden, FK_ID_Usuario)
VALUES
('2026-05-01', 40.00, 4.80, 44.80, 'Pagado', 1, 1),
('2026-05-03', 22.00, 2.64, 24.64, 'Pendiente', 2, 2),
('2026-05-05', 80.00, 9.60, 89.60, 'Pagado', 3, 3),
('2026-05-07', 110.00, 13.20, 123.20, 'Pagado', 4, 4),
('2026-05-09', 70.00, 8.40, 78.40, 'Pendiente', 5, 5);

INSERT INTO Alerta_SOS (Latitud, Longitud, FK_ID_Usuario)
VALUES
(-2.17099800, -79.92235900, 1),
(-2.18941200, -79.88906600, 2),
(-2.14563200, -79.90124500, 3),
(-2.20334400, -79.87543200, 4),
(-2.15670000, -79.91001100, 5);

