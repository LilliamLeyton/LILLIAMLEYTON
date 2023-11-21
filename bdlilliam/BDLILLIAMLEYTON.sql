CREATE DATABASE EQ
GO
USE EQ
GO
CREATE TABLE  Usuarios
(
    UsuarioID int identity,
    Nombre varchar(50) NOT NULL,
    CorreoElectronico varchar(50),
    Telefono varchar(15),
    CONSTRAINT pk_UsuarioID PRIMARY KEY (UsuarioID)
)
GO
CREATE TABLE Equipos
(
    EquipoID int identity,
    TipoEquipo varchar(50) NOT NULL,
    Modelo varchar(50),
    UsuarioID int,
    CONSTRAINT pk_EquipoID PRIMARY KEY (EquipoID),
	CONSTRAINT fk_UsuarioID FOREIGN KEY(UsuarioID) REFERENCES Usuarios(UsuarioID)
)
GO
CREATE TABLE Tecnicos
(
    TecnicoID int identity,
    Nombre varchar(50),
    Especialidad varchar,
   CONSTRAINT pk_TecnicoID PRIMARY KEY (TecnicoID)
)
GO

CREATE TABLE Reparaciones
(
    ReparacionID int identity,
	EquipoID int,
    FechaSolicitud DATE constraint df_fecha DEFAULT GETDATE(),
    Estado char(1),
    CONSTRAINT pk_ReparacionID PRIMARY KEY (ReparacionID),
    CONSTRAINT fk_EquipoID FOREIGN KEY(EquipoID) REFERENCES Equipos(EquipoID),

)
GO
CREATE TABLE Asignaciones 
(
    AsignacionID int identity,
    ReparacionID int,
    TecnicoID int,
    FechaAsignacion DATE constraint df_fecha DEFAULT GETDATE(),
    CONSTRAINT pk_AsignacionID PRIMARY KEY (AsignacionID),
	CONSTRAINT fk_TecnicoID FOREIGN KEY(TecnicoID) REFERENCES Tecnicos(TecnicoID),
	CONSTRAINT fk_ReparacionID FOREIGN KEY(ReparacionID) REFERENCES Reparaciones(ReparacionID)
	
)
GO
CREATE TABLE DetallesReparacion
(
    DetalleID int identity,
    ReparacionID int,
    Descripcion varchar(50),
    FechaInicio DATE constraint df_fecha DEFAULT GETDATE(),
    FechaFin DATE constraint df_fecha DEFAULT GETDATE(),
    CONSTRAINT pk_DetalleID PRIMARY KEY (DetalleID),
    CONSTRAINT fk_ReparacionID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
)
go

/*AGREGAR*/

INSERT INTO Equipos (ID, Nombre) VALUES ('1'),('Equipo1');
INSERT INTO Usuarios (ID, Nombre) VALUES ('1'),( 'Usuario1');
INSERT INTO Tecnicos (ID, Nombre) VALUES ('1'), ( 'Tecnico1');
INSERT INTO DetallesReparacion VALUES (('2023/11/20'),GETDATE());


---STORE PROCEDURE == PROCEDIMIENTO ALMACENADOS - SP

CREATE PROCEDURE CONSULTARUSUARIOS
AS
BEGIN
 SELECT * FROM USUARIOS
END

CREATE PROCEDURE BORRARUSUARIOS
@CODIGO INT
AS
BEGIN
  DELETE Usuarios WHERE ID=@CODIGO
 END

CREATE PROCEDURE CONSULTARUSUARIO_FILTRO
AS
BEGIN
 SELECT * FROM USUARIOS  WHERE ID=@CODIGO
END

CREATE PROCEDURE ACTUALIZARUSUARIO
@CODIGO INT,
@DESCRIPCION VARCHAR(50)
AS
BEGIN
 UPDATE Usuarios SET DESCRIPCION = @DESCRIPCION WHERE ID = @CODIGO
END

CREATE PROCEDURE INGREARUSUARIO
@DESCRIPCION VARCHAR(50)
AS
BEGIN
  INSERT INTO USUARIOS (DESCRIPCION) VALUES (@DESCRIPCION)
END


 EXEC BORRARUSUARIOS
 EXEC CONSULTARUSUARIOS
 EXEC CONSULTARUSUARIOS_FILTRO
 EXEC ACTUALIZARUSUARIOS
