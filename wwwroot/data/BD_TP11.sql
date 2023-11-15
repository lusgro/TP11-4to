USE [master]
GO
/****** Object:  Database [BD_TP11]    Script Date: 15/11/2023 11:06:58 ******/
CREATE DATABASE [BD_TP11]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_TP11', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BD_TP11.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_TP11_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BD_TP11_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [BD_TP11] SET QUERY_STORE = OFF
GO
USE [BD_TP11]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  Table [dbo].[Artistas]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  Table [dbo].[Canciones]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  Table [dbo].[Comunidades]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  Table [dbo].[Mensajes]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 15/11/2023 11:06:58 ******/
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
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosXComunidades]    Script Date: 15/11/2023 11:06:58 ******/
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
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil]) VALUES (1, N'Hola', N'fdssfd', N'qwdqwd@gmdsdf.com', N'')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_editarMensaje]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_eliminarMensaje]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_listarComunidadesPertenecientes]    Script Date: 15/11/2023 11:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listarComunidadesPertenecientes]
	@pIDUsuario int
as
begin
	select * from Comunidades C
	inner join UsuariosXComunidades UC on C.ID_Comunidad = UC.ID_Comunidad
	where UC.ID_Usuario = @pIDUsuario
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerComunidad]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerPerfil]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerTodasComunidades]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_publicarMensaje]    Script Date: 15/11/2023 11:06:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_registroUsuario]    Script Date: 15/11/2023 11:06:58 ******/
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
