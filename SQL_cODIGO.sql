CREATE DATABASE IF NOT EXISTS BiciSafe;
USE BiciSafe;

CREATE TABLE Cliente (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Rol VARCHAR(50) DEFAULT 'Ciclista',
    Correo_Electronico VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Bicicleta (
    ID_Bicicleta INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50),
    Km_Totales INT DEFAULT 0 CHECK (Km_Totales >= 0),

    FK_ID_Usuario INT NOT NULL,

    FOREIGN KEY (FK_ID_Usuario)
        REFERENCES Cliente(ID_Usuario)
        ON DELETE CASCADE
);

CREATE TABLE Componente (
    ID_Componente INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Pieza VARCHAR(100) NOT NULL,
    Km_Actuales INT DEFAULT 0 CHECK (Km_Actuales >= 0),
    Km_Limite INT CHECK (Km_Limite > 0),

    FK_ID_Bicicleta INT NOT NULL,

    FOREIGN KEY (FK_ID_Bicicleta)
        REFERENCES Bicicleta(ID_Bicicleta)
        ON DELETE CASCADE
);

CREATE TABLE Alerta_SOS (
    ID_SOS INT PRIMARY KEY AUTO_INCREMENT,
    Latitud DECIMAL(10,8) NOT NULL,
    Longitud DECIMAL(11,8) NOT NULL,
    Fecha_Hora DATETIME DEFAULT CURRENT_TIMESTAMP,

    FK_ID_Usuario INT NOT NULL,

    FOREIGN KEY (FK_ID_Usuario)
        REFERENCES Cliente(ID_Usuario)
        ON DELETE CASCADE
);

CREATE TABLE Contacto_Emergencia (
    ID_Contacto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Emer VARCHAR(100) NOT NULL,
    Tel_Emergencia VARCHAR(20) NOT NULL,

    FK_ID_Usuario INT NOT NULL,

    FOREIGN KEY (FK_ID_Usuario)
        REFERENCES Cliente(ID_Usuario)
        ON DELETE CASCADE
);

CREATE TABLE Mecanico (
    ID_Mecanico INT PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100)
);

CREATE TABLE Orden_Trabajo (
    ID_Orden INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Diagnostico TEXT,
    Estado VARCHAR(50) DEFAULT 'Pendiente',
    Costo_Total DECIMAL(10,2) DEFAULT 0.00 CHECK (Costo_Total >= 0),

    FK_ID_Bicicleta INT NOT NULL,
    FK_ID_Mecanico INT,

    FOREIGN KEY (FK_ID_Bicicleta)
        REFERENCES Bicicleta(ID_Bicicleta),

    FOREIGN KEY (FK_ID_Mecanico)
        REFERENCES Mecanico(ID_Mecanico)
        ON DELETE SET NULL
);

CREATE TABLE Repuesto (
    ID_Repuesto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Pieza VARCHAR(100) NOT NULL,
    Stock INT DEFAULT 0 CHECK (Stock >= 0),
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Emp VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20)
);

CREATE TABLE Orden_Compra (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Monto_Total DECIMAL(10,2) NOT NULL CHECK (Monto_Total >= 0),

    FK_ID_Proveedor INT NOT NULL,

    FOREIGN KEY (FK_ID_Proveedor)
        REFERENCES Proveedor(ID_Proveedor)
);

CREATE TABLE Utiliza (
    FK_ID_Orden INT,
    FK_ID_Repuesto INT,
    Cantidad INT NOT NULL DEFAULT 1 CHECK (Cantidad > 0),

    PRIMARY KEY (FK_ID_Orden, FK_ID_Repuesto),

    FOREIGN KEY (FK_ID_Orden)
        REFERENCES Orden_Trabajo(ID_Orden)
        ON DELETE CASCADE,

    FOREIGN KEY (FK_ID_Repuesto)
        REFERENCES Repuesto(ID_Repuesto)
);

CREATE TABLE Incluye (
    FK_ID_Compra INT,
    FK_ID_Repuesto INT,
    Cantidad INT NOT NULL DEFAULT 1 CHECK (Cantidad > 0),

    PRIMARY KEY (FK_ID_Compra, FK_ID_Repuesto),

    FOREIGN KEY (FK_ID_Compra)
        REFERENCES Orden_Compra(ID_Compra)
        ON DELETE CASCADE,

    FOREIGN KEY (FK_ID_Repuesto)
        REFERENCES Repuesto(ID_Repuesto)
);

CREATE TABLE Factura (
    ID_Factura INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL CHECK (Subtotal >= 0),
    IVA DECIMAL(10,2) NOT NULL CHECK (IVA >= 0),
    Total DECIMAL(10,2) NOT NULL CHECK (Total >= 0),
    Estado VARCHAR(20) DEFAULT 'PENDIENTE',

    FK_ID_Orden INT NOT NULL,
    FK_ID_Usuario INT NOT NULL,

    FOREIGN KEY (FK_ID_Orden)
        REFERENCES Orden_Trabajo(ID_Orden)
        ON DELETE CASCADE,

    FOREIGN KEY (FK_ID_Usuario)
        REFERENCES Cliente(ID_Usuario)
        ON DELETE CASCADE
);
