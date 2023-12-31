USE [master]
GO
/****** Object:  Database [BD_TP11]    Script Date: 30/11/2023 13:14:02 ******/
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
/****** Object:  User [alumno]    Script Date: 30/11/2023 13:14:02 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 30/11/2023 13:14:02 ******/
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
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_Discos] PRIMARY KEY CLUSTERED 
(
	[ID_Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artistas]    Script Date: 30/11/2023 13:14:02 ******/
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
	[GeneroMusical] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Artistas] PRIMARY KEY CLUSTERED 
(
	[ID_Artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canciones]    Script Date: 30/11/2023 13:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[ID_Cancion] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Comunidades]    Script Date: 30/11/2023 13:14:02 ******/
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
/****** Object:  Table [dbo].[Mensajes]    Script Date: 30/11/2023 13:14:02 ******/
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
/****** Object:  Table [dbo].[PreguntasDeRecuperacion]    Script Date: 30/11/2023 13:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasDeRecuperacion](
	[ID_Pregunta] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PreguntasDeRecuperacion] PRIMARY KEY CLUSTERED 
(
	[ID_Pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/11/2023 13:14:02 ******/
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
	[ID_Pregunta] [int] NOT NULL,
	[RespuestaSeguridad] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosXComunidades]    Script Date: 30/11/2023 13:14:02 ******/
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
SET IDENTITY_INSERT [dbo].[Albumes] ON 

INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1004, 2, N'Desde El Fin Del Mundo', 18, 57.9, N'/img/Imagenes-Albumes/1004.jpg', 100000, 2021)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1005, 3, N'mp3', 13, 35.5, N'/img/Imagenes-Albumes/1005.jpg', 230000, 2023)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1006, 4, N'Porfiado', 8, 49.2, N'/img/Imagenes-Albumes/1006.jpg', 230000, 2012)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1007, 5, N'illuminate', 13, 44.4, N'/img/Imagenes-Albumes/1007.jpg', 80000, 2017)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1008, 6, N'Cancion Animal', 10, 41, N'/img/Imagenes-Albumes/1008.jpg', 100000, 1990)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1009, 7, N'3MEN2 KBRN', 18, 54, N'/img/Imagenes-Albumes/1009.jpg', 100000, 2023)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1010, 8, N'Sueño Dorado', 12, 44, N'/img/Imagenes-Albumes/1010.jpg', 93000, 2012)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1011, 2, N'Antes De Ameri', 16, 40, N'/img/Imagenes-Albumes/1011.jpg', 13000, 2023)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1012, 2, N'Temporada De Reggaeton', 7, 22.14, N'/img/Imagenes-Albumes/1012.jpg', 1320000, 2021)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1013, 3, N'Tu Crees En Mi?', 8, 22, N'/img/Imagenes-Albumes/1013.jpg', 960000, 2022)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1014, 4, N'Habla Tu Espejo', 9, 33.2, N'/img/Imagenes-Albumes/1014.jpg', 530000, 2015)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1015, 4, N'Lamina Once', 8, 33.56, N'/img/Imagenes-Albumes/1015.jpg', 545000, 2014)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1016, 5, N'Wonder', 14, 42, N'/img/Imagenes-Albumes/1016.jpg', 234000, 2020)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1017, 5, N'Handwritten', 17, 55, N'/img/Imagenes-Albumes/1017.webp', 11000, 2015)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1018, 6, N'Nada personal', 10, 40, N'/img/Imagenes-Albumes/1018.jpg', 120000, 1985)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1019, 6, N'Signos', 8, 36, N'/img/Imagenes-Albumes/1019.jpg', 120000, 1986)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1020, 7, N'Sauce Boyz', 16, 51, N'/img/Imagenes-Albumes/1020.jpg', 530000, 2022)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1021, 7, N'Monarca', 14, 42, N'/img/Imagenes-Albumes/1021.jpg', 123000, 2022)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1022, 8, N'11', 11, 33, N'/img/Imagenes-Albumes/1022.jpg', 14200, 2016)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1023, 8, N'Único', 16, 64, N'/img/Imagenes-Albumes/1023.jpg', 19000, 2014)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1024, 2, N'Súper Sangre Joven', 10, 31.9, N'/img/Imagenes-Albumes/1024.jpg', 100000, 2019)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1025, 3, N'El Plan', 1, 3.55, N'/img/Imagenes-Albumes/1025.jpg', 24300, 2012)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1026, 4, N'Bipolar', 9, 36, N'/img/Imagenes-Albumes/1026.jpg', 20000, 2009)
INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (1027, 5, N'MTV Unplugged', 11, 49, N'/img/Imagenes-Albumes/1027.jpg', 86300, 2017)
SET IDENTITY_INSERT [dbo].[Albumes] OFF
GO
SET IDENTITY_INSERT [dbo].[Artistas] ON 

INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (2, N'Duki', N'Duki, nombre real Mauro Lombardo, es un destacado cantante y rapero argentino conocido por su estilo único en el trap y el rap. Nacido el 24 de junio de 1996 en Buenos Aires, ganó popularidad tras participar en "El Quinto Escalón". Sus letras ingeniosas y colaboraciones con artistas prominentes lo han posicionado como una figura destacada en la escena musical latinoamericana. Su música fusiona influencias urbanas con ritmos pegajosos, contribuyendo a su éxito tanto a nivel nacional como internacional.', 100000, N'/img/Imagenes-Artistas/2.jpg', N'Trap')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (3, N'Emilia Mernes', N'Emilia Mernes es una cantante y compositora argentina, reconocida por su talento en el ámbito musical. Nació el 14 de diciembre de 1996 en Paraná, Entre Ríos. Su carrera se catapultó a la fama como miembro del grupo musical Rombai, conocido por su fusión de cumbia, pop y reguetón. Emilia se destacó por su voz cautivadora y su presencia escénica.', 100000, N'/img/Imagenes-Artistas/3.jpg', N'Reggaeton')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (4, N'Cuarteto De Nos', N'Cuarteto de Nos es una banda de rock alternativo y pop rock uruguaya conocida por su estilo innovador y letras inteligentes. Originaria de Montevideo, Uruguay, la banda fue fundada en 1984 por los hermanos Roberto y Ricardo Musso. A lo largo de su carrera, han experimentado con diferentes géneros musicales, desde el rock hasta la música folklórica y el pop.', 240000, N'/img/Imagenes-Artistas/4.jpg', N'Rock')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (5, N'Shawn Mendes', N'Cantante y compositor canadiense conocido por su estilo pop contemporáneo.', 15000000, N'/img/Imagenes-Artistas/5.jpg', N'Pop')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (6, N'Soda Stereo', N'Soda Stereo fue una influyente banda de rock en español formada en Buenos Aires, Argentina, en 1982. Compuesta por Gustavo Cerati, Zeta Bosio y Charly Alberti, la banda se convirtió en una de las más destacadas del rock latinoamericano. Su música fusiona elementos de rock, new wave y pop, creando un sonido distintivo y vanguardista.', 156000, N'/img/Imagenes-Artistas/6.jpg', N'Rock')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (7, N'Eladio Carrion', N'Eladio Carrion es un reconocido cantante y compositor de música urbana, específicamente dentro del género de reguetón y trap. Nació el 6 de febrero de 1994 en Fajardo, Puerto Rico. Carrion ha ganado prominencia en la escena musical latina por sus colaboraciones con otros artistas destacados y por su estilo versátil.', 130000, N'/img/Imagenes-Artistas/7.jpg', N'Trap')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (8, N'Abel Pintos', N'Abel Pintos es un reconocido cantante y compositor argentino, nacido el 11 de mayo de 1984 en Bahía Blanca, Buenos Aires. Es una figura destacada en la escena musical de América Latina, especialmente en el género de la música folklórica y pop.', 34000, N'/img/Imagenes-Artistas/8.jpg', N'Pop')
INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES (10, N'Bad Bunny', N'Benito Antonio Martínez Ocasio,conocido artísticamente como Bad Bunny o El Conejo Malo, es un cantante, compositor, productor musical, luchador profesional y actor puertorriqueño', 1000000, N'https://media.revistavanityfair.es/photos/641c6381130ff665e534b26e/1:1/w_3000,h_3000,c_limit/GettyImages-1412405003.jpg', N'Trap')
SET IDENTITY_INSERT [dbo].[Artistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Canciones] ON 

INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1002, 1004, N'Pintao', 3, CAST(N'2021-04-21' AS Date), 5000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1003, 1004, N'Chico Estrella', 2.47, CAST(N'2021-04-21' AS Date), 7000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 1004, N'Malbec', 2.55, CAST(N'2021-04-21' AS Date), 9000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, 1004, N'Sol', 4.03, CAST(N'2021-04-21' AS Date), 11000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 1004, N'Rapido', 2.1, CAST(N'2021-04-21' AS Date), 9000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 1005, N'GTA.mp3', 2.31, CAST(N'2023-11-03' AS Date), 12000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, 1005, N'Exclusive.mp3', 2, CAST(N'2023-11-03' AS Date), 15000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 1005, N'24_Hs.mp3', 2.56, CAST(N'2023-11-03' AS Date), 13000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 1005, N'No_Se_Ve.mp3', 4.1, CAST(N'2023-11-03' AS Date), 18000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 1005, N'A_1000_KM.mp3', 2.35, CAST(N'2023-11-03' AS Date), 18000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 1006, N'Cuando Sea Grande', 4.09, CAST(N'2012-04-27' AS Date), 22000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 1006, N'Buen Dia Benito', 3.5, CAST(N'2012-04-27' AS Date), 25000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 1006, N'Lo Malo De Ser Bueno', 4.02, CAST(N'2012-04-27' AS Date), 28000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 1006, N'Solo Estoy Sobreviviendo', 4.3, CAST(N'2012-04-27' AS Date), 10000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, 1006, N'Buen Dia Benito', 4.1, CAST(N'2012-04-27' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1017, 1007, N'Ruin', 3.9, CAST(N'2017-04-20' AS Date), 30000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 1007, N'Like This', 3.06, CAST(N'2017-04-20' AS Date), 35000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 1007, N'No Promises', 2.46, CAST(N'2017-04-20' AS Date), 40000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 1007, N'Honest', 2.45, CAST(N'2017-04-20' AS Date), 65000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, 1007, N'Patience', 3.4, CAST(N'2017-04-20' AS Date), 41200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, 1008, N'El Septimo DIa', 4.23, CAST(N'1990-09-09' AS Date), 45000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, 1008, N'Un Milon De Años Luz', 3.09, CAST(N'1990-09-09' AS Date), 50000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 1008, N'De Musica Ligera', 4.07, CAST(N'1990-09-09' AS Date), 53000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 1008, N'1990', 4.3, CAST(N'1990-09-09' AS Date), 125000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1026, 1008, N'Cae El Sol', 5.1, CAST(N'1990-09-09' AS Date), 45000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 1009, N'Padre Tiempo', 3.39, CAST(N'2023-03-17' AS Date), 60000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 1009, N'Coco Chanel', 3.28, CAST(N'2023-03-17' AS Date), 65000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1029, 1009, N'Si La Calle Llama', 4.1, CAST(N'2023-03-17' AS Date), 70000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1030, 1009, N'El Hokae', 3.5, CAST(N'2023-03-17' AS Date), 120000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1031, 1009, N'Mbappe - Remix ', 3.2, CAST(N'2023-03-17' AS Date), 900000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1032, 1010, N'Quien Pudiera', 3.27, CAST(N'2012-07-01' AS Date), 75000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1033, 1010, N'La LLave	', 4.2, CAST(N'2012-07-01' AS Date), 80000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1034, 1010, N'No Me Olvides', 3.32, CAST(N'2012-07-01' AS Date), 85000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1035, 1010, N'Sueño Dorado', 3.4, CAST(N'2012-07-01' AS Date), 856000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1036, 1010, N'El Beso/ Quisiera', 4.1, CAST(N'2012-07-01' AS Date), 123000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1037, 1011, N'Dont Lie', 3.8, CAST(N'2023-08-01' AS Date), 90000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1038, 1011, N'Troya', 4, CAST(N'2023-08-01' AS Date), 95000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1039, 1011, N'uNO dOs', 3.5, CAST(N'2023-08-01' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1040, 1011, N'Jefes Del Sudoeste', 2.4, CAST(N'2023-08-01' AS Date), 14000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1041, 1011, N'O1 dE ENEro', 3, CAST(N'2023-08-01' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1042, 1012, N'MidTown', 23.25, CAST(N'2021-11-25' AS Date), 15000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1043, 1012, N'En movimiento', 2.5, CAST(N'2021-11-25' AS Date), 12000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1044, 1012, N'Ley de Atracción', 3, CAST(N'2021-11-25' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1045, 1012, N'YIN YAN', 3.09, CAST(N'2021-11-25' AS Date), 14000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1046, 1012, N'Unfollow', 3.16, CAST(N'2021-11-25' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1047, 1013, N'Latin Girl', 2.46, CAST(N'2012-07-01' AS Date), 75000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1048, 1013, N'Como Si No Importara', 2.53, CAST(N'2012-07-02' AS Date), 80000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1049, 1013, N'Cuatro Veinte', 2.13, CAST(N'2012-07-03' AS Date), 85000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1050, 1013, N'Intoxicao', 2.48, CAST(N'2012-07-03' AS Date), 856000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1051, 1013, N'Mi Otra Mitad', 2.46, CAST(N'2012-07-03' AS Date), 123000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1052, 1014, N'El Aprendiz', 3.57, CAST(N'2015-06-03' AS Date), 22000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1053, 1014, N'Como Pasa El Tíempo', 4.21, CAST(N'2015-06-03' AS Date), 25000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1054, 1014, N'Whisky En Uruguay', 3.09, CAST(N'2015-06-03' AS Date), 28000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1055, 1014, N'Roberto', 4.09, CAST(N'2015-06-03' AS Date), 10000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1056, 1014, N'Caminamos', 3.32, CAST(N'2015-06-03' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1057, 1015, N'Flan', 3.56, CAST(N'2023-06-08' AS Date), 22000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1058, 1015, N'Frankestein Posmo', 4.07, CAST(N'2023-06-08' AS Date), 25000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1059, 1015, N'Chivo Expiatorio', 4.48, CAST(N'2023-06-08' AS Date), 28000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1060, 1015, N'El CInturon Gris', 3.45, CAST(N'2023-06-08' AS Date), 10000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1061, 1015, N'Rorschach', 3.57, CAST(N'2023-06-08' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1062, 1016, N'Monster', 2.41, CAST(N'2023-01-23' AS Date), 8800)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1063, 1016, N'Wonder', 2.36, CAST(N'2023-01-23' AS Date), 82000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1064, 1016, N'Intro', 2.56, CAST(N'2023-01-23' AS Date), 34000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1065, 1016, N'24 Hours', 2.4, CAST(N'2023-01-23' AS Date), 21000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1066, 1016, N'Higher', 4, CAST(N'2023-01-23' AS Date), 52000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1067, 1017, N'Air', 3, CAST(N'2015-06-08' AS Date), 8800)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1068, 1017, N'Crazy', 3.12, CAST(N'2015-06-08' AS Date), 82000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1069, 1017, N'Strings', 3.45, CAST(N'2015-06-08' AS Date), 34000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1070, 1017, N'Stitiches', 2.43, CAST(N'2015-06-08' AS Date), 21000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1071, 1017, N'Aftertaste', 2, CAST(N'2015-06-08' AS Date), 52000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1072, 1018, N'Si No Fuera Por...', 3.28, CAST(N'1985-11-15' AS Date), 10000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1073, 1018, N'Estoy Azulado', 5.2, CAST(N'1985-11-15' AS Date), 84000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1074, 1018, N'Nada Personal', 4.54, CAST(N'1985-11-15' AS Date), 33550)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1075, 1018, N'Ecos', 4.2, CAST(N'1985-11-15' AS Date), 112000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1076, 1018, N'Danza Rota', 4.2, CAST(N'1985-11-15' AS Date), 52000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1077, 1019, N'Profugos.', 5.2, CAST(N'1986-11-10' AS Date), 170000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1078, 1019, N'Persiana Americana', 4.53, CAST(N'1986-11-10' AS Date), 13000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1079, 1019, N'Signos', 5.16, CAST(N'1986-11-10' AS Date), 56550)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1080, 1019, N'En Camino', 4.3, CAST(N'1986-11-10' AS Date), 994000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1081, 1019, N'No Existes', 4.3, CAST(N'1986-11-10' AS Date), 322000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1082, 1020, N'Hennesy.', 3.05, CAST(N'2022-01-31' AS Date), 14200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1083, 1020, N'Actriz ', 3.05, CAST(N'2022-01-31' AS Date), 15000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1084, 1020, N'Hielo', 3.11, CAST(N'2022-01-31' AS Date), 56550)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1085, 1020, N'Rapido', 5.06, CAST(N'2022-01-31' AS Date), 994000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1086, 1020, N'3 AM', 3.28, CAST(N'2022-01-31' AS Date), 322000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1087, 1021, N'Tata.', 2.46, CAST(N'2022-01-08' AS Date), 13200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1088, 1021, N'4 AM ', 2.42, CAST(N'2022-01-08' AS Date), 16000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1089, 1021, N'Intro', 2.58, CAST(N'2022-01-08' AS Date), 100000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1090, 1021, N'Toretto', 3.03, CAST(N'2022-01-08' AS Date), 44000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1091, 1021, N'Adios', 2.41, CAST(N'2022-01-08' AS Date), 542000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1092, 1022, N'Alguien', 2.44, CAST(N'2016-07-07' AS Date), 14200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1093, 1022, N'3', 4.08, CAST(N'2016-07-07' AS Date), 167000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1094, 1022, N'Mariposa', 3.35, CAST(N'2016-07-07' AS Date), 1310000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1095, 1022, N'Caceria', 3.3, CAST(N'2016-07-07' AS Date), 99000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1096, 1022, N'Primavera', 3.58, CAST(N'2016-07-07' AS Date), 74000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1097, 1023, N'Aventura', 3.55, CAST(N'2014-01-10' AS Date), 19200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1098, 1023, N'Lo Que Soy', 3.5, CAST(N'2014-01-10' AS Date), 10000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1099, 1023, N'Ya Estuve Aqui', 3.33, CAST(N'2014-01-10' AS Date), 1243000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1100, 1023, N'Motivos', 3.17, CAST(N'2014-01-10' AS Date), 66000)
GO
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1101, 1023, N'Juntos', 3.25, CAST(N'2014-01-10' AS Date), 753000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1102, 1024, N'Hitboy', 2.58, CAST(N'2019-11-01' AS Date), 10200)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1103, 1024, N'A Punta De Espada', 3.23, CAST(N'2019-11-01' AS Date), 1420000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1104, 1024, N'Perdon', 3.39, CAST(N'2019-11-01' AS Date), 452000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1105, 1024, N'Señorita', 2.42, CAST(N'2019-11-01' AS Date), 120000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1106, 1024, N'Me Gusta Lo Simple', 3.17, CAST(N'2019-11-01' AS Date), 730000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1107, 1025, N'El Plan', 3.55, CAST(N'2022-04-20' AS Date), 120000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1108, 1026, N'Bipolar', 4.07, CAST(N'2009-07-20' AS Date), 16000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1109, 1026, N'Razones', 3.39, CAST(N'2009-07-20' AS Date), 1420000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1110, 1026, N'Mirenme', 3.29, CAST(N'2009-07-20' AS Date), 452000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1111, 1026, N'Miguel Gritar', 4.07, CAST(N'2009-07-20' AS Date), 120000)
INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1112, 1027, N'Primavera', 3.33, CAST(N'2009-07-20' AS Date), 730000)
SET IDENTITY_INSERT [dbo].[Canciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Comunidades] ON 

INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2009, 2, N'Duki', N'/img/Imagenes-Artistas/2.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2010, 3, N'Emilia Mernes', N'/img/Imagenes-Artistas/3.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2011, 4, N'Cuarteto De Nos', N'/img/Imagenes-Artistas/4.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2012, 5, N'Shawn Mendes', N'/img/Imagenes-Artistas/5.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2013, 6, N'Soda Stereo', N'/img/Imagenes-Artistas/6.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2014, 7, N'Eladio Carrion', N'/img/Imagenes-Artistas/7.jpg')
INSERT [dbo].[Comunidades] ([ID_Comunidad], [ID_Artista], [Nombre], [FotoPerfil]) VALUES (2015, 8, N'Abel Pintos', N'/img/Imagenes-Artistas/8.jpg')
SET IDENTITY_INSERT [dbo].[Comunidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensajes] ON 

INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1, 2011, 1, N'Que buena banda chicos, Escuchenla !

', CAST(N'2023-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Mensajes] OFF
GO
SET IDENTITY_INSERT [dbo].[PreguntasDeRecuperacion] ON 

INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (1, N'¿Cómo se llamó tu primer mascota?')
INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (2, N'¿A qué primaria fuiste?')
INSERT [dbo].[PreguntasDeRecuperacion] ([ID_Pregunta], [Contenido]) VALUES (3, N'¿Quién era tu mejor amigo de la infancia?')
SET IDENTITY_INSERT [dbo].[PreguntasDeRecuperacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [ID_Pregunta], [RespuestaSeguridad]) VALUES (1, N'Franco', N'123456', N'Francobronsztein@gmail.com', N'/img/Imagenes-Usuarios/1.jpg', 1, N'Athos')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [ID_Pregunta], [RespuestaSeguridad]) VALUES (2, N'Ilan', N'11111111', N'iasdjdhaskj@h', N'/img/Imagenes-Usuarios/perfil-default.png', 2, N'Athos')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [ID_Pregunta], [RespuestaSeguridad]) VALUES (3, N'Nicolas', N'FRANCOGAY', N'nicolas.simone321@gmail.com', N'/img/Imagenes-Usuarios/perfil-default.png', 1, N'Lola')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [ID_Pregunta], [RespuestaSeguridad]) VALUES (4, N'Fran06', N'franlachupa', N'Francobronsztein06@gmail.com', N'/img/Imagenes-Usuarios/perfil-default.png', 1, N'Fran')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 2010)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 2011)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 2012)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 2013)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 2014)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (2, 2010)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (2, 2012)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (2, 2013)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (3, 2010)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (3, 2012)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (4, 2010)
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
/****** Object:  StoredProcedure [dbo].[sp_CambiarContraseña]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_editarMensaje]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_editarMensaje]
	@pIDMensaje int, @pContenido varchar(max)
as
begin
	Update Mensajes set Contenido = @pContenido where ID_Mensaje = @pIDMensaje
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editarPerfil]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_editarPerfil]
	@pIdUsuario INT, @pUsername NVARCHAR(MAX) = NULL, @pEmail NVARCHAR(MAX) = NULL, @pFotoPerfil NVARCHAR(MAX)
AS
BEGIN
	if(@pFotoPerfil like '')
	begin
		set @pFotoPerfil = Null
	end

    Update Usuarios
    set Username = ISNULL(@pUsername, Username),
        Email = isnull(@pEmail, Email),
        FotoPerfil = isnull(@pFotoPerfil, FotoPerfil)
    where ID_Usuario = @pIdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarMensaje]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_eliminarMensaje]
	@pIDMensaje int
as
begin
	Delete from Mensajes where ID_Mensaje = @pIDMensaje
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarComunidadesPertenecientes]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerAlbum]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerAlbum]
	@pIdAlbum INT
AS
BEGIN
	SELECT * FROM Albumes WHERE ID_Album = @pIdAlbum
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerAlbumes]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerAlbumes]
	@pIdArtista INT
AS
BEGIN
	SELECT * FROM Albumes WHERE ID_Artista = @pIdArtista
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCanciones]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_obtenerCanciones]
	@pIdAlbum INT
AS
BEGIN
	SELECT * FROM Canciones WHERE ID_Album = @pIdAlbum
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerComunidad]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerComunidadesPopulares]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_obtenerComunidadesPopulares]
as
begin
	select C.ID_Comunidad, C.ID_Artista, C.Nombre, C.FotoPerfil from Comunidades C
	left join UsuariosXComunidades UC on C.ID_Comunidad = UC.ID_Comunidad
	group by C.ID_Comunidad, C.ID_Artista, C.Nombre, C.FotoPerfil
	order by count(UC.ID_Usuario) desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensaje]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_obtenerMensaje]
	@pIdMensaje int
as
begin
	select * from Mensajes where ID_Mensaje = @pIdMensaje
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesComunidad]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_obtenerMensajesComunidad]
	@pIDComunidad int
AS
BEGIN
	SELECT M.ID_Mensaje, M.ID_Comunidad, M.ID_Usuario, M.Contenido, M.Fecha, U.Username, U.FotoPerfil FROM Mensajes M
	inner join Usuarios U on M.ID_Usuario = U.ID_Usuario
	WHERE M.ID_Comunidad = @pIDComunidad order by Fecha
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesDeUser]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerPerfil]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerPreguntasDeRecuperacion]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerPreguntasDeRecuperacion]
AS
BEGIN
	SELECT * FROM PreguntasDeRecuperacion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestaSeguridad]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerTodasComunidades]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuarioByID]    Script Date: 30/11/2023 13:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuarios]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerUsuarios]
AS
BEGIN
	select * from Usuarios;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuariosComentarios]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerUsuariosComentarios]
	@pIDComunidad int
AS
BEGIN
	SELECT U.ID_Usuario, U.Username, U.Contraseña, U.Email, U.FotoPerfil, U.RespuestaSeguridad FROM Mensajes M
	inner join Usuarios U on M.ID_Usuario = U.ID_Usuario
	WHERE M.ID_Comunidad = @pIDComunidad order by M.Fecha
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuariosXComunidad]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtenerUsuariosXComunidad]
AS
BEGIN
	SELECT ID_Comunidad, COUNT(UC.ID_Comunidad) AS CantidadUsuarios FROM UsuariosXComunidades UC GROUP BY (ID_Comunidad) ORDER BY CantidadUsuarios DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuarioXComunidad]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_obtenerUsuarioXComunidad]
	@pIdUsuario int, @pIdComunidad int
as
begin
	(select count(*) from UsuariosXComunidades where ID_Usuario = @pIdUsuario and ID_Comunidad = @pIdComunidad)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_publicarMensaje]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_publicarMensaje]
	@pIDComunidad int, @pIDUsuario int, @pContenido varchar(max)
as
begin
	insert into Mensajes(ID_Comunidad, ID_Usuario, Contenido, Fecha) Values(@pIDComunidad, @pIDUsuario, @pContenido, GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_registroUsuario]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_registroUsuario]
	@pUsuario varchar(max), @pContraseña varchar(max), @pEmail varchar(max), @pPreguntaRecuperacion int, @pRespuestaPregunta varchar(max)
as
begin
	INSERT INTO Usuarios (Username, Contraseña, Email, FotoPerfil, ID_Pregunta, RespuestaSeguridad) VALUES (@pUsuario, @pContraseña, @pEmail, '/img/Imagenes-Usuarios/perfil-default.png', @pPreguntaRecuperacion, @pRespuestaPregunta)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_salirComunidad]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_salirComunidad]
	@pIdUsuario int, @pIdComunidad int
as
begin
	delete from UsuariosXComunidades where ID_Usuario = @pIdUsuario and ID_Comunidad = @pIdComunidad
end
GO
/****** Object:  StoredProcedure [dbo].[sp_unirseComunidad]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_unirseComunidad]
	@pIdUsuario int, @pIdComunidad int
as
begin
	Insert UsuariosXComunidades(ID_Usuario, ID_Comunidad) values(@pIdUsuario, @pIdComunidad);
end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarioByUsername]    Script Date: 30/11/2023 13:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_usuarioByUsername]
	@pUsername varchar(MAX)
as
begin
	SELECT * FROM Usuarios WHERE username = @pUsername
end
GO
USE [master]
GO
ALTER DATABASE [BD_TP11] SET  READ_WRITE 
GO
