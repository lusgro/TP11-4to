USE [master]
GO
/****** Object:  Database [BD_TP11]    Script Date: 21/11/2023 08:37:38 ******/
CREATE DATABASE [BD_TP11]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_TP11', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_TP11.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_TP11_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_TP11_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_TP11] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_TP11].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_TP11] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_TP11] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_TP11] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_TP11] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_TP11] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_TP11] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_TP11] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_TP11] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_TP11] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_TP11] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_TP11] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_TP11] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_TP11] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_TP11] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_TP11] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_TP11] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_TP11] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_TP11] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_TP11] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_TP11] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_TP11] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_TP11] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_TP11] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_TP11] SET  MULTI_USER 
GO
ALTER DATABASE [BD_TP11] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_TP11] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_TP11] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_TP11] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_TP11] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_TP11', N'ON'
GO
ALTER DATABASE [BD_TP11] SET QUERY_STORE = OFF
GO
USE [BD_TP11]
GO
/****** Object:  User [alumno]    Script Date: 21/11/2023 08:37:38 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albumes](
	[ID_Album] [int] IDENTITY(1,1) NOT NULL,
	[ID_Artista] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[CantCanciones] [int] NOT NULL,
	[DuracionTotal] [float] NOT NULL,
	[FotoPortada] [varchar](max) NOT NULL,
	[CantReproducciones] [int] NULL,
 CONSTRAINT [PK_Discos] PRIMARY KEY CLUSTERED 
(
	[ID_Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artistas]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistas](
	[ID_Artista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Oyentes] [int] NOT NULL,
	[FotoPerfil] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Artistas] PRIMARY KEY CLUSTERED 
(
	[ID_Artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canciones]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[ID_Cancion] [int] NOT NULL,
	[ID_Album] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Duracion] [float] NOT NULL,
	[FechaPublicacion] [date] NOT NULL,
	[CantReproducciones] [int] NOT NULL,
 CONSTRAINT [PK_Canciones] PRIMARY KEY CLUSTERED 
(
	[ID_Cancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comunidades]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comunidades](
	[ID_Comunidad] [int] IDENTITY(1,1) NOT NULL,
	[ID_Artista] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[FotoPerfil] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Comunidades] PRIMARY KEY CLUSTERED 
(
	[ID_Comunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[ID_Mensaje] [int] IDENTITY(1,1) NOT NULL,
	[ID_Comunidad] [int] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Contenido] [varchar](max) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[ID_Mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasDeRecuperacion]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasDeRecuperacion](
	[ID_Pregunta] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](max) NULL,
 CONSTRAINT [PK_PreguntasDeRecuperacion] PRIMARY KEY CLUSTERED 
(
	[ID_Pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Contraseña] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[FotoPerfil] [varchar](max) NULL,
	[ID_Pregunta] [int] NULL,
	[RespuestaSeguridad] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosXComunidades]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosXComunidades](
	[ID_Usuario] [int] NOT NULL,
	[ID_Comunidad] [int] NOT NULL,
 CONSTRAINT [PK_UsuariosXArtistas] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_Comunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artistas] ON 

INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil]) VALUES (2, N'carlos', N'loremsadjfodjsofjsdokfjsdofsdf', 123, N'fsdfsdf')
SET IDENTITY_INSERT [dbo].[Artistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Comunidades] ON 

INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (8, 2, N'dsffsd', N'sdfsdf')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (9, 2, N'afds', N'xvcvc')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (10, 2, N'fdsfdscv', N'sdfgfgd')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (11, 2, N'bvcbcvb', N'dfgfgdg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (12, 2, N'vfv', N'dfg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (13, 2, N'fdg', N'cvb')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (14, 2, N'fdsfsd', N'bvcb')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (15, 2, N'dfgdfg', N'cvb')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (16, 2, N'dsdad', N'cvbdsa')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (17, 2, N'dfsfddsfsdfsdf', N'xcvcxv')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (18, 2, N'xcvcxv', N'dsa')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (19, 2, N'xcvcxvdsada', N'gdfg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (20, 2, N'bvcbcvb', N'dfgdfg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (21, 2, N'cvbcvb', N'adsfsd')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (22, 2, N'cvbcbv', N'sdfsdf')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (23, 2, N'bcvbv', N'dfgdfgdfg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (25, 2, N'xcvcxvwewq', N'nbvm')
SET IDENTITY_INSERT [dbo].[Comunidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensajes] ON 

INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1, 8, 1, N'Hola123', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (4, 8, 1, N'Hola1234', CAST(N'2023-09-08' AS Date))
SET IDENTITY_INSERT [dbo].[Mensajes] OFF
GO
SET IDENTITY_INSERT [dbo].[PreguntasDeRecuperacion] ON 

INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (1, N'¿Cómo se llamó tu primer mascota?')
INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (18, N'¿A qué primaria fuiste?')
INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (19, N'¿Quién era tu mejor amigo de la infancia?')
SET IDENTITY_INSERT [dbo].[PreguntasDeRecuperacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [ID_Pregunta], [RespuestaSeguridad]) VALUES (1, N'Hola', N'fdssfd', N'qwdqwd@gmdsdf.com', N'', 1, N'Jorge')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 8)
GO
ALTER TABLE [dbo].[Albumes]  WITH CHECK ADD  CONSTRAINT [FK_Discos_Artistas] FOREIGN KEY([ID_Artista])
REFERENCES [dbo].[Artistas] ([ID_Artista])
GO
ALTER TABLE [dbo].[Albumes] CHECK CONSTRAINT [FK_Discos_Artistas]
GO
ALTER TABLE [dbo].[Canciones]  WITH CHECK ADD  CONSTRAINT [FK_Canciones_Discos] FOREIGN KEY([ID_Album])
REFERENCES [dbo].[Albumes] ([ID_Album])
GO
ALTER TABLE [dbo].[Canciones] CHECK CONSTRAINT [FK_Canciones_Discos]
GO
ALTER TABLE [dbo].[Comunidades]  WITH CHECK ADD  CONSTRAINT [FK_Comunidades_Artistas] FOREIGN KEY([ID_Artista])
REFERENCES [dbo].[Artistas] ([ID_Artista])
GO
ALTER TABLE [dbo].[Comunidades] CHECK CONSTRAINT [FK_Comunidades_Artistas]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Comunidades] FOREIGN KEY([ID_Comunidad])
REFERENCES [dbo].[Comunidades] ([ID_Comunidad])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Comunidades]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_PreguntasDeRecuperacion] FOREIGN KEY([ID_Pregunta])
REFERENCES [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_PreguntasDeRecuperacion]
GO
ALTER TABLE [dbo].[UsuariosXComunidades]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosXComunidades_Comunidades] FOREIGN KEY([ID_Comunidad])
REFERENCES [dbo].[Comunidades] ([ID_Comunidad])
GO
ALTER TABLE [dbo].[UsuariosXComunidades] CHECK CONSTRAINT [FK_UsuariosXComunidades_Comunidades]
GO
ALTER TABLE [dbo].[UsuariosXComunidades]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosXComunidades_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[UsuariosXComunidades] CHECK CONSTRAINT [FK_UsuariosXComunidades_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[sp_CambiarContraseña]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CambiarContraseña]
	@pIDUsuario int, @pNuevaContraseña varchar(max)
AS
BEGIN
	UPDATE Usuarios SET Contraseña = @pNuevaContraseña WHERE ID_Usuario = @pIDUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_editarMensaje]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editarMensaje]
	@pIDMensaje int, @pContenido varchar(max)
as
begin
	Update Mensajes set Contenido = @pContenido where ID_Mensaje = @pIDMensaje
end
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarMensaje]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_eliminarMensaje]
	@pIDMensaje int
as
begin
	Delete from Mensajes where ID_Mensaje = @pIDMensaje
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarComunidadesPertenecientes]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_listarComunidadesPertenecientes]
	@pIDUsuario int
as
begin
	select C.ID_Comunidad, C.ID_Artista, C.Nombre, C.FotoPerfil from Comunidades C
	inner join UsuariosXComunidades UC on C.ID_Comunidad = UC.ID_Comunidad
	where UC.ID_Usuario = @pIDUsuario
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_login]
	@pUsuario varchar(max), @pContraseña varchar(max)
as
begin
	SELECT * FROM Usuarios WHERE Username like @pUsuario AND Contraseña like @pContraseña;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerComunidad]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerComunidad]
	@pIDComunidad int
as
begin
	select * from Comunidades where ID_Comunidad = @pIDComunidad
end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesComunidad]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerMensajesComunidad]
	@pIDComunidad int
AS
BEGIN
	SELECT * FROM Mensajes WHERE ID_Comunidad = @pIDComunidad order by Fecha desc
END

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesDeUser]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerMensajesDeUser]
	@pIDUsuario int
AS
BEGIN
	SELECT * FROM Mensajes WHERE ID_Usuario = @pIDUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerPerfil]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerPerfil]
	@pIDUsuario int
as
begin
	select * from Usuarios where ID_Usuario = @pIDUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestaSeguridad]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerRespuestaSeguridad]
	@pIDUsuario varchar(max)
as
begin
	SELECT RespuestaSeguridad FROM Usuarios WHERE ID_Usuario = @pIDUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerTodasComunidades]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerTodasComunidades]
as
begin
	select * from Comunidades
end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuarioByID]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerUsuarioByID]
	@pIDUsuario int
AS
BEGIN
	SELECT * FROM Usuarios WHERE ID_Usuario = @pIDUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_publicarMensaje]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_publicarMensaje]
	@pIDComunidad int, @pIDUsuario int, @pContenido varchar(max)
as
begin
	insert into Mensajes(ID_Comunidad, ID_Usuario, Contenido, Fecha) Values(@pIDComunidad, @pIDUsuario, @pContenido, GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registroUsuario]    Script Date: 21/11/2023 08:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registroUsuario]
	@pUsuario varchar(max), @pContraseña varchar(max), @pEmail varchar(max)
as
begin
	INSERT INTO Usuarios (Username, Contraseña, Email) VALUES (@pUsuario, @pContraseña, @pEmail)
end

GO
USE [master]
GO
ALTER DATABASE [BD_TP11] SET  READ_WRITE 
GO
