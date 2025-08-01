USE [master]
GO
/****** Object:  Database [TP_FINAL]    Script Date: 11/7/2024 9:23:58 PM ******/
CREATE DATABASE [TP_FINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_FINAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\TP_FINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_FINAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\TP_FINAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_FINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_FINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_FINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_FINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_FINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_FINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_FINAL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TP_FINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_FINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_FINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_FINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_FINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_FINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_FINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_FINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_FINAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TP_FINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_FINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_FINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_FINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_FINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_FINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_FINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_FINAL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP_FINAL] SET  MULTI_USER 
GO
ALTER DATABASE [TP_FINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_FINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_FINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_FINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_FINAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP_FINAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TP_FINAL] SET QUERY_STORE = ON
GO
ALTER DATABASE [TP_FINAL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TP_FINAL]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 11/7/2024 9:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_especialidad] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ESPECIALIDADES] PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorariosMedicos]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorariosMedicos](
	[id_horario_medico] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_HM] [int] NOT NULL,
	[dias] [varchar](30) NOT NULL,
	[horario_inicio] [char](5) NOT NULL,
	[horario_fin] [char](5) NOT NULL,
 CONSTRAINT [PK_HORARIOSMEDICOS] PRIMARY KEY CLUSTERED 
(
	[id_horario_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[id_provincia] [int] NOT NULL,
	[id_localidad] [int] NOT NULL,
	[nombre_localidad] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LOCALIDADES] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC,
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[id_provincia_P] [int] NOT NULL,
	[id_localidad_P] [int] NOT NULL,
	[dni_p] [char](8) NOT NULL,
	[nombre_p] [varchar](30) NOT NULL,
	[apellido_p] [varchar](30) NOT NULL,
	[sexo_p] [varchar](30) NOT NULL,
	[nacionalidad] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[fecha_nacimiento_p] [datetime] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_PACIENTES] PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre_provincia] [varchar](30) NOT NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[id_turno] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente_t] [int] NOT NULL,
	[id_usuario_t] [int] NOT NULL,
	[fecha_consulta] [datetime] NOT NULL,
	[hora_consulta] [char](5) NOT NULL,
	[observaciones] [varchar](50) NOT NULL,
	[realizado_t] [bit] NOT NULL,
 CONSTRAINT [PK_TURNOS] PRIMARY KEY CLUSTERED 
(
	[id_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/7/2024 9:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_especialidad_us] [int] NULL,
	[id_provincia_us] [int] NOT NULL,
	[id_localidad_us] [int] NOT NULL,
	[id_rol_us] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[sexo] [varchar](30) NULL,
	[nacionalidad] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[legajo] [char](4) NULL,
	[dni] [char](8) NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [UK_TURNOS_USUARIOS]    Script Date: 11/7/2024 9:24:00 PM ******/
ALTER TABLE [dbo].[Turnos] ADD  CONSTRAINT [UK_TURNOS_USUARIOS] UNIQUE NONCLUSTERED 
(
	[id_usuario_t] ASC,
	[fecha_consulta] ASC,
	[hora_consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ('0') FOR [realizado_t]
GO
ALTER TABLE [dbo].[HorariosMedicos]  WITH CHECK ADD  CONSTRAINT [FK_HORARIOSMEDICOS_USUARIOS] FOREIGN KEY([id_usuario_HM])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[HorariosMedicos] CHECK CONSTRAINT [FK_HORARIOSMEDICOS_USUARIOS]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_LOCALIDADES_PROVINCIAS] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[Provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_LOCALIDADES_PROVINCIAS]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_LOCALIDADES] FOREIGN KEY([id_provincia_P], [id_localidad_P])
REFERENCES [dbo].[Localidades] ([id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_PACIENTES_LOCALIDADES]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_PACIENTES] FOREIGN KEY([id_paciente_t])
REFERENCES [dbo].[Pacientes] ([id_paciente])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_TURNOS_PACIENTES]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_USUARIOS] FOREIGN KEY([id_usuario_t])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_TURNOS_USUARIOS]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ESPECIALIDADES] FOREIGN KEY([id_especialidad_us])
REFERENCES [dbo].[Especialidades] ([id_especialidad])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_USUARIOS_ESPECIALIDADES]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_lOCALIDADES] FOREIGN KEY([id_provincia_us], [id_localidad_us])
REFERENCES [dbo].[Localidades] ([id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_USUARIOS_lOCALIDADES]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ROLES] FOREIGN KEY([id_rol_us])
REFERENCES [dbo].[Roles] ([id_rol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_USUARIOS_ROLES]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD CHECK  (([sexo_p]='Masculino' OR [sexo_p]='Femenino'))
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD CHECK  (([activo]='0' OR [activo]='1'))
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD CHECK  (([activo]='0' OR [activo]='1'))
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD CHECK  (([realizado_t]='0' OR [realizado_t]='1'))
GO
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [UQ_Usuarios_DNI] UNIQUE ([dni]);
GO
ALTER TABLE [dbo].[Pacientes]
ADD CONSTRAINT [UQ_Pacientes_DNI] UNIQUE ([dni_p]);
GO
USE [master]
GO
ALTER DATABASE [TP_FINAL] SET  READ_WRITE 
GO
USE TP_FINAL;
GO
CREATE PROCEDURE SP_AgregarMedico
(
    @id_provincia_us INT,
    @id_localidad_us INT,
    @id_especialidad_us INT,
    @id_rol_us INT,
    @dni CHAR(8),
    @nombre VARCHAR(30),
    @apellido VARCHAR(30),
    @sexo VARCHAR(30),
    @nacionalidad VARCHAR(30),
    @direccion VARCHAR(50),
    @legajo CHAR(4),
    @correo_electronico VARCHAR(50),
    @telefono VARCHAR(50),
    @nombre_usuario VARCHAR(50),
    @contraseña VARCHAR (50),
    @activo BIT
)
AS
BEGIN
    INSERT INTO Usuarios
    (
      id_provincia_us,
       id_localidad_us,
       id_especialidad_us,
       id_rol_us,
       dni,
       nombre,
       apellido,
       sexo,
       nacionalidad,
       direccion,
       legajo,
       correo_electronico,
       telefono,
       nombre_usuario,
       contraseña,
       activo
    ) 
    VALUES 
    (
         @id_provincia_us, 
        @id_localidad_us,
        @id_especialidad_us,
        @id_rol_us,
        @dni,
        @nombre, 
        @apellido, 
        @sexo, 
        @nacionalidad, 
        @direccion,
        @legajo,
        @correo_electronico, 
        @telefono,
        @nombre_usuario,
        @contraseña,
        @activo
    );
    DECLARE @NuevoIdUsuario INT;
    SET @NuevoIdUsuario = SCOPE_IDENTITY();

    SELECT @NuevoIdUsuario AS id_usuario;

    -- Puedes retornar un valor para indicar éxito, opcional
    RETURN;
END;
GO

CREATE PROCEDURE SP_AgregarPaciente
(
    @id_provincia_P INT,
    @id_localidad_P INT,
	@dni_p CHAR(8),
    @nombre_p VARCHAR(30),
    @apellido_p VARCHAR(30),
    @sexo_p VARCHAR(30),
    @nacionalidad VARCHAR(30),
    @direccion VARCHAR(50),
    @correo_electronico VARCHAR(50),
    @telefono VARCHAR(50),
    @fecha_nacimiento_p DATETIME,
    @activo BIT
)
AS
BEGIN
    INSERT INTO Pacientes
    (
	   id_provincia_P,
	   id_localidad_P,
	   dni_p,
	   nombre_p,
	   apellido_p,
	   sexo_p,
	   nacionalidad,
	   direccion,
	   correo_electronico,
	   telefono,
	   fecha_nacimiento_p,
       activo
    ) 
    VALUES 
    (
        @id_provincia_P, 
        @id_localidad_P,
		@dni_p,
        @nombre_p, 
        @apellido_p, 
        @sexo_p, 
        @nacionalidad, 
        @direccion, 
        @correo_electronico, 
        @telefono, 
        @fecha_nacimiento_p,
        @activo
    );
    -- Puedes retornar un valor para indicar éxito, opcional
    RETURN;
END;
GO

CREATE PROCEDURE SP_EliminarPaciente
(
    @idpaciente INT
)
AS
BEGIN
    -- Eliminar las referencias en la tabla turnos
    DELETE FROM Turnos WHERE id_paciente_t= @idpaciente;

    -- Ahora, desactivar el registro de paciente
    UPDATE Pacientes SET activo = 0 WHERE id_paciente = @idpaciente;


    RETURN;
END;
GO

CREATE PROCEDURE SP_EliminarMedico
(
    @idusuario INT
)
AS
BEGIN
    -- Eliminar las referencias en la tabla HorariosMedicos
    DELETE FROM HorariosMedicos WHERE id_usuario_HM = @idusuario;

	-- Eliminar las referencias en la tabla turnos
	DELETE FROM Turnos WHERE id_usuario_t =@idusuario ;

    -- Ahora, desactivar el registro de Usuarios
     UPDATE Usuarios SET activo = 0 WHERE id_usuario = @idusuario;

    RETURN;
END
GO

/*Horarios*/

CREATE PROCEDURE Sp_Horario
(
    @id_usuario INT,
    @dias VARCHAR(10),
    @HorarioInicio VARCHAR(5),
    @HorarioFin VARCHAR(5)
)
AS
BEGIN
    INSERT INTO HorariosMedicos(id_usuario_HM,dias,horario_inicio,horario_fin)
    VALUES (@id_usuario,@dias,@HorarioInicio, @HorarioFin);
END;
GO

CREATE FUNCTION franja_horaria
(
    @hora_inicio TIME,
    @hora_fin TIME
)
RETURNS @Horas TABLE (Hora VARCHAR(5))
AS
BEGIN
    DECLARE @hora_actual TIME = @hora_inicio;
    
    -- Iterar desde la hora de inicio hasta la hora de fin en incrementos de 30 minutos
    WHILE @hora_actual <= @hora_fin
    BEGIN
        -- Insertar la hora actual en la tabla de resultados
        INSERT INTO @Horas (Hora)
        VALUES (CONVERT(VARCHAR(5),@hora_actual));
        
        -- Sumar 30 minutos a la hora actual
        SET @hora_actual = DATEADD(MINUTE, 30, @hora_actual);
    END
    
    RETURN;
END;
GO
Drop database tp_final
create database tp_final
USE TP_FINAL;

GO
INSERT INTO Provincias(nombre_provincia)
SELECT 'Buenos Aires'UNION
SELECT 'CABA' UNION
SELECT 'Santa Fe' UNION
SELECT 'Cordoba' UNION
SELECT 'Mendoza'; 

GO
INSERT INTO Localidades(id_provincia, id_localidad, nombre_localidad)
SELECT 1, 1, 'Bahia Blanca'UNION
SELECT 1, 2, 'La Plata'UNION
SELECT 1, 3, 'Mar del Plata' UNION
SELECT 2, 4, 'Almagro' UNION
SELECT 2, 5, 'Palermo' UNION
SELECT 3, 6, 'Rosario' UNION
SELECT 3, 7, 'Santa Fe' UNION
SELECT 4, 8, 'Cordoba' UNION 
SELECT 4, 9, 'Villa Carlos Paz' UNION 
SELECT 5, 10, 'Mendoza'UNION 
SELECT 5, 11, 'San Rafael'UNION
SELECT 1, 12, 'Tandil' UNION
SELECT 1, 13, 'Marcos Paz' UNION
SELECT 2, 14, 'Villa del Parque' UNION
SELECT 3, 15, 'Rafaela' UNION
SELECT 4, 16, 'Alta Gracia';

GO
INSERT INTO Roles (nombre_rol)
SELECT 'Administrador'UNION 
SELECT 'Medico';

GO
INSERT INTO Pacientes(id_provincia_P, id_localidad_P, dni_p, nombre_p, apellido_p, sexo_p, nacionalidad, direccion, correo_electronico, telefono, fecha_nacimiento_p, activo)
SELECT 1, 1, '12345678', 'Juan', 'Pérez', 'Masculino', 'Argentina', 'Calle Ficticia 123', 'juan.perez@email.com', '123456789', CONVERT(DATETIME, '1980-05-15', 120),1 UNION
SELECT 1, 2, '87654321', 'María', 'Gómez', 'Femenino', 'Argentina', 'Avenida Real 456', 'maria.gomez@email.com', '987654321', CONVERT(DATETIME, '1990-03-22', 120),1  UNION
SELECT 1, 3, '11223344', 'Carlos', 'Sánchez', 'Masculino', 'Argentina', 'Calle Verdadera 789', 'carlos.sanchez@email.com', '456123789', CONVERT(DATETIME, '1995-08-30', 120),1  UNION
SELECT 2, 4, '22334455', 'Lucía', 'Méndez', 'Femenino', 'Argentina', 'Ruta Nacional 987', 'lucia.mendez@email.com', '654321987', CONVERT(DATETIME, '1985-07-11', 120),1  UNION
SELECT 2, 5, '33445566', 'Pedro', 'Ramírez', 'Masculino', 'Argentina', 'Calle Falsa 12', 'pedro.ramirez@email.com', '789654123', CONVERT(DATETIME, '1992-10-05', 120) ,1 UNION
SELECT 3, 6, '44556677', 'Ana', 'Torres', 'Femenino', 'Argentina', 'Calle 456', 'ana.torres@email.com', '321654987', CONVERT(DATETIME, '1983-12-20', 120),1  UNION
SELECT 3, 7, '55667788', 'José', 'Molina', 'Masculino', 'Argentina', 'Avenida Los Pinos 34', 'jose.molina@email.com', '456987321', CONVERT(DATETIME, '1994-01-16', 120),1  UNION
SELECT 4, 8, '66778899', 'Verónica', 'Pérez', 'Femenino', 'Argentina', 'Calle Larga 123', 'veronica.perez@email.com', '654123789', CONVERT(DATETIME, '1996-02-08', 120),1  UNION
SELECT 4, 9, '77889900', 'Luis', 'González', 'Masculino', 'Argentina', 'Avenida Libertad 10', 'luis.gonzalez@email.com', '987321654', CONVERT(DATETIME, '1987-09-29', 120),1  UNION
SELECT 5, 10, '88990011', 'Sofía', 'Vega', 'Femenino', 'Argentina', 'Calle Real 567', 'sofia.vega@email.com', '321987654', CONVERT(DATETIME, '2000-06-18', 120),1 UNION
SELECT 1, 12, '99887766', 'Laura', 'Martínez', 'Femenino', 'Argentina', 'Calle 1 234', 'laura.martinez@email.com', '222333444', CONVERT(DATETIME, '1995-06-25', 120),1  UNION
SELECT 2, 14, '55443322', 'Carlos', 'Rodríguez', 'Masculino', 'Argentina', 'Avenida Las Heras 50', 'carlos.rodriguez@email.com', '555666777', CONVERT(DATETIME, '1989-02-15', 120),1  UNION
SELECT 3, 15, '66778890', 'Lucía', 'González', 'Femenino', 'Argentina', 'Calle Falsa 456', 'lucia.gonzalez@email.com', '666777888', CONVERT(DATETIME, '1992-09-10', 120),1  UNION
SELECT 4, 16, '88997766', 'José', 'Lopez', 'Masculino', 'Argentina', 'Avenida Larga 789', 'jose.lopez@email.com', '444555666', CONVERT(DATETIME, '1983-11-03', 120),1  UNION
SELECT 5, 10, '77665544', 'Ana', 'Ramírez', 'Femenino', 'Argentina', 'Calle Verde 123', 'ana.ramirez@email.com', '333444555', CONVERT(DATETIME, '1994-04-20', 120),1 ;

GO
INSERT INTO Especialidades (nombre_especialidad)
SELECT 'Medicina'UNION
SELECT 'Pediatria'UNION
SELECT 'Cardiologia'UNION
SELECT 'Oncologia'UNION
SELECT 'Neurologia'UNION
SELECT 'Dermatologia'UNION
SELECT 'Ginecologia'UNION
SELECT 'Cirugia'UNION
SELECT 'Psiquiatria'UNION
SELECT 'Odontologia';

GO


-- Medicos
INSERT INTO Usuarios (id_especialidad_us,id_provincia_us,id_localidad_us,id_rol_us,nombre,apellido,sexo,nacionalidad,direccion,correo_electronico,telefono,legajo,dni,nombre_usuario,contraseña, activo)
SELECT 1,1,2,2,'Juan', 'Perez', 'Masculino', 'Argentina', 'Calle Ficticia 123', 'juan.perez@email.com', '123456789', '0001', '12345678', 'juanperez', 'contraseña123', 1 UNION
SELECT 2,1,3,2,'Maria', 'Gomez', 'Femenino', 'Argentina', 'Avenida Real 456', 'maria.gomez@email.com', '987654321', '0002', '87654321', 'mariagomez', 'contraseña456', 1 UNION
SELECT 1,2,4,2,'Carlos', 'Sanchez', 'Masculino', 'Argentina', 'Calle Verdadera 789', 'carlos.sanchez@email.com', '456123789', '0003', '11223344', 'carlossanchez', 'contraseña789', 1 UNION
SELECT 2,2,5,2,'Lucia', 'Mendez', 'Femenino', 'Argentina', 'Ruta Nacional 987', 'lucia.mendez@email.com', '654321987', '0004', '22334455', 'luciamendez', 'contraseña012', 1 UNION
SELECT 1,3,6,2,'Pedro', 'Ramirez', 'Masculino', 'Argentina', 'Calle Falsa 12', 'pedro.ramirez@email.com', '789654123', '0005', '33445566', 'pedroramirez', 'contraseña345', 1 UNION
SELECT 2,3,7,2,'Ana', 'Torres', 'Femenino', 'Argentina', 'Calle 456', 'ana.torres@email.com', '321654987', '0006', '44556677', 'anatorres', 'contraseña678', 1 UNION
SELECT 1,4,8,2,'Jose', 'Molina', 'Masculino', 'Argentina', 'Avenida Los Pinos 34', 'jose.molina@email.com', '456987321', '0007', '55667788', 'josemolina', 'contraseña901', 1 UNION
SELECT 2,4,9,2,'Veronica', 'Perez', 'Femenino', 'Argentina', 'Calle Larga 123', 'veronica.perez@email.com', '654123789', '0008', '66778899', 'veronicaperez', 'contraseña234', 1 UNION
SELECT 1,5,10,2,'Luis', 'Gonzalez', 'Masculino', 'Argentina', 'Avenida Libertad 10', 'luis.gonzalez@email.com', '987321654', '0009', '77889900', 'luisgonzalez', 'contraseña567', 1 UNION
SELECT 2,5,11,2, 'Sofia', 'Vega', 'Femenino', 'Argentina', 'Calle Real 567', 'sofia.vega@email.com', '321987654', '0010', '88990011', 'sofiavega', 'contraseña890', 1 UNION
SELECT 1, 1, 12, 2, 'Javier', 'García', 'Masculino', 'Argentina', 'Calle Las Lomas 200', 'javier.garcia@email.com', '333444555', '0011', '99887766', 'javiergarcia', 'contraseña111', 1  UNION
SELECT 2, 2, 14, 2, 'Claudia', 'Martínez', 'Femenino', 'Argentina', 'Avenida Libertad 800', 'claudia.martinez@email.com', '444555666', '0012', '55443322', 'claudiamartinez', 'contraseña222', 1  UNION
SELECT 3, 3, 15, 2, 'Fernando', 'Pérez', 'Masculino', 'Argentina', 'Calle Real 123', 'fernando.perez@email.com', '555666777', '0013', '66778892', 'fernandoperez', 'contraseña333' , 1 UNION
SELECT 4, 4, 16, 2, 'Beatriz', 'Hernández', 'Femenino', 'Argentina', 'Calle Vieja 100', 'beatriz.hernandez@email.com', '666777888', '0014', '88997766', 'beatrizhernandez', 'contraseña444' , 1 UNION
SELECT 5, 5, 10, 2, 'Gabriel', 'Rodríguez', 'Masculino', 'Argentina', 'Avenida del Sur 500', 'gabriel.rodriguez@email.com', '777888999', '0015', '77665544', 'gabrielrodriguez', 'contraseña555', 1 ;
GO

-- Administrador
INSERT INTO Usuarios (id_especialidad_us,id_provincia_us,id_localidad_us,id_rol_us,nombre,apellido,sexo,nacionalidad,direccion,nombre_usuario,contraseña, activo)
SELECT NULL, 1, 1,1,'admin', 'admin', NULL, 'Argentina', NULL, 'admin', 'admin', 1;
GO

INSERT INTO Turnos (id_paciente_t,id_usuario_t,fecha_consulta,hora_consulta,observaciones,realizado_t)
SELECT 1, 1, CONVERT(datetime, '2024-11-25', 120), '09:00', 'Consulta de control', 0 UNION
SELECT 2, 2, CONVERT(datetime,'2024-11-26', 120), '10:00','Consulta de rutina', 1 UNION
SELECT 3,3,CONVERT(datetime,'2024-11-27',120), '11:00','Chequeo anual', 0 UNION
SELECT 4,4,CONVERT(datetime,'2024-11-28',120),'14:00','Primera consulta',1 UNION
SELECT 5,5, CONVERT(datetime, '2024-11-29', 120),'15:00', 'Revisión de tratamiento',0 UNION
SELECT 6, 6, CONVERT(datetime, '2024-12-01', 120),'16:00','Consulta para receta',1 UNION
SELECT 7,7,CONVERT(datetime, '2024-12-02', 120),'08:00','Chequeo general',0  UNION
SELECT 8,8, CONVERT(datetime, '2024-12-03', 120),'09:30','Consulta urgente',1  UNION
SELECT 9,9,CONVERT(datetime, '2024-12-04', 120),'10:30', 'Control post-operatorio', 0 UNION
SELECT 10,10, CONVERT(datetime, '2024-12-05', 120),'11:30','Consulta de seguimiento',1 UNION
SELECT 1, 11, CONVERT(datetime, '2024-12-10', 120), '10:00', 'Chequeo de salud', 0 UNION
SELECT 2, 12, CONVERT(datetime, '2024-12-12', 120), '11:00', 'Consulta pediátrica', 1 UNION
SELECT 3, 13, CONVERT(datetime, '2024-12-15', 120), '14:00', 'Control de presión', 0 UNION
SELECT 4, 14, CONVERT(datetime, '2024-12-18', 120), '09:30', 'Revisión de tratamiento', 1 UNION
SELECT 5, 15, CONVERT(datetime, '2024-12-20', 120), '16:00', 'Consulta neurológica', 0 UNION
SELECT 3, 13, CONVERT(datetime, '2024-12-15', 120), '14:00', 'Control de presión', 0 UNION
SELECT 4, 1, CONVERT(datetime, '2023-11-18', 120), '09:30', 'Revisión de tratamiento', 1 UNION
SELECT 5, 2, CONVERT(datetime, '2023-09-20', 120), '16:00', 'Consulta', 0 UNION
SELECT 2, 15, CONVERT(datetime, '2023-09-20', 120), '16:00', 'Consulta medicina', 1 UNION
SELECT 4, 1, CONVERT(datetime, '2022-11-18', 120), '09:30', 'Revisión de tratamiento', 1 UNION
SELECT 5, 5, CONVERT(datetime, '2022-09-20', 120), '16:00', 'Revisión de tratamiento', 0;

GO
INSERT INTO HorariosMedicos (id_usuario_HM, dias, horario_inicio, horario_fin)
SELECT 1, 'Lunes', '09:00', '13:00' UNION
SELECT 2, 'Martes', '14:00', '18:00' UNION
SELECT 2, 'Miércoles', '09:00', '13:00' UNION
SELECT 3, 'Lunes', '10:00', '14:00' UNION
SELECT 4, 'Miércoles', '09:00', '13:00' UNION
SELECT 4, 'Martes', '08:00', '12:00' UNION
SELECT 5, 'Lunes', '07:00', '11:00' UNION
SELECT 6, 'Miércoles', '09:00', '13:00' UNION
SELECT 6, 'Miércoles', '09:00', '13:00' UNION
SELECT 7, 'Lunes', '15:00', '19:00' UNION
SELECT 8, 'Jueves', '10:00', '14:00' UNION
SELECT 9, 'Lunes', '12:00', '16:00' UNION
SELECT 10, 'Miércoles', '09:00', '13:00' UNION
SELECT 10, 'Martes', '13:00', '17:00'UNION
SELECT 11, 'Lunes', '08:00', '12:00' UNION
SELECT 12, 'Martes', '09:00', '13:00' UNION
SELECT 13, 'Miércoles', '10:00', '14:00' UNION
SELECT 14, 'Viernes', '08:00', '12:00' UNION
SELECT 15, 'Jueves', '14:00', '18:00';
