USE [master]
GO
/****** Object:  Database [BD_TP11]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Albumes]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Artistas]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Canciones]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Comunidades]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Mensajes]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/11/2023 21:20:40 ******/
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
	[RespuestaSeguridad] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosXComunidades]    Script Date: 22/11/2023 21:20:40 ******/
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

INSERT [dbo].[Albumes] ([ID_Album], [ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES (3, 2, N'paor', 12, 132, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRYWFhYZGRgaHR4fHBwcHR8hHh4fHBwhHx0cHRoeJC4lHB4rHyMaJjgmLC8xNTU1HCQ7QDszPy40NTEBDAwMEA8QHxISHjQrJSs0NDQ0NDQ0NDQ0NDQ0NDE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAEBQIDAAEGB//EAEQQAAECBAQDBAgEBgECBQUAAAECEQADITEEEkFRBSJhMnGBkQYTQlKhscHwcrLR4SMzYoKS8RRTogdDc7PCFSRjdIP/xAAYAQEBAQEBAAAAAAAAAAAAAAABAgADBP/EACERAQEAAwEBAAICAwAAAAAAAAABAhEhMUESYQMiMkJR/9oADAMBAAIRAxEAPwBTOTzqezpfyEMMNhkrQE1BzUpWgqHI3r4xRPl803vT8RBsjMJbpdwomz6nUHYxytdpA/8Ax0glKakXPzqL1pEVyyxvbc/WDkoGQb6sdWPvCkDmVctpo2/QwbbS6TJBQj8Kd/dEAYOWSVDqIaoAyop7I392BeHoqo92+0bZ0NwaC57jv06xXNlkJav2O+CsOgc1BY6RrES6WHkInbFs1B06/d++BOCLLMCbnXrSHCpLG3daFnAgyOpJ8sxh3xtdE51HMXVY06i1RE8RPVlyOpxV3JdIqBXV2ETl9qtdDbU9W3ieLHIki6mH+IJPybxjM53FOAansnU2akYkKKe0p6amCcSjlWf6SfMEwPImU+Pj9mK3wa6ExJWKZlXOpjcpa2PMqx9o7RbjnLU8fB4lJl8p7lQ74NdAS1mjqVYWJ1YfWGM2VmdedQAAzVarbdaQEEMEfhG2xP6QwxSVBSRXKWd3ALOBUP0+Ea1pAiFrblUsDTmUPGh+2jciYvOjnWK+8dj4wRipQBDbDUbPqx1iqRLZaKan5HrBvh0umlZB51/5K2HWK0TFhKmWux9pQuO+L1tt8DsIlJsfOx0rE74rRbiFrCVDOqhAopTeUWYVa2Sc62yp9pXTr0EaxIOUku5Nb6UgjCSuRNPZH03pDbxMnRqJsz1aOddx7XQ9e7ygTEzl5u2ug976vaGEtAyI7+kDTpTrLAWfTpEyq0S8TmLyHnU2YUzPVi1oOw+MmZSQtdxZR6sbxRxhDSzvnTr0V+nzgqUGQwsLva5cVHdFW8TJ0PmX/wBSZ5n9YyKnG6fhGRtk/mCs3vT8EQXh0cqUAMVKNW6kn4NAE6a2csDzpFS3sQVLWtkMVAa5QFB61e7ftGYdkIQBVwoi76EawP6umh6kB77iLlKcXLuDTMkWG/UGBzKv2W0s99xAy+QoZUBvZG/uiKcAmqv7aeHSNo7AYVyj5CkTwieY/wBp12G0ZhklNVU0PziU1FBG5I7XcYsWaQKDzEH4dNrwm4CgZAwu4/7tvu0PlkHxhRwGX/DQDoVfBZh+J+ignKfL4eXSNLQoOGDIfL3mr+TwUqXfUfezRvEVCToznxYfLNEqJceg5JhFmV8oUYeYwFLDzh5ikcizqyvy9IUyZbJD1BSSDFY3ib6oxKrUsDBEnsH8J+UUYk7e7BKFHKdOUw3xoFEsHICNEaaGhg1csrzKFMmVxUVJc17oCK+YJYdlOrGzn76QahS8ywpSmLhimjGlMpqqCtFuPRz3LONvdT70ChDLQ4FzYN7KtvpF89IWaEsWueg0UIGEtiiody5A/pVt4QRhJIILj57CKcPPBNGF9/u0QxyS1KP0P28DYWSQWYl9hbrWGTjW9E4wOKWenxIi7Ao5E0J5U6d28aWigHxPdfvieAByJP8ASnToOvWC+GejMOnkR47biIrlnMdadIJkjkT4/PzjS5jKP7RKiD0gR/Dq/bTt7qtoJkynSwFK17yoXahtGvSEAyg2i0+Fx8zBkmWOc9400UrcRe/6p10BlPuo+/GMg31K9/gP1jInatKMSsArBy9sXB90WaDcOkqSMrAp90gl2cFjYVMK8YvnWMzc2z+yPKGfD5lCwSssl8tDrd7Rd8c/piaNmPuvmGvNYigigzCxZJG7l/rG1Lqq45mZnFAAzgRCbOUUqDpCtACOu8BbWjketUpsL0sPCCsImqv7fyxRKSFITS4Tt7ogrD9pX9vyG8ZhMoXHQ7RKaKf6+sZLP6aaxta6ViWUNUd/SA+CpZH9yx/3naDlqqC/xgPhQORVW511/vMPxhqgX8R11EQnIZJ2q3+KjaMJOm/Q2rEscqjd9j0bXvgUV4tAyL7lXFbHXugaXKcAM1PJxqPKCsWeRQJBoqhJexiuQ+rWFBfpWFifiSGKeoP0icuqSxplMS41Uo7jTxiuQHSWtlVD8T9CBYKj2LJ3B8TvaGmHlKKwpLkEucpSQzggAmvWFMpXMHWLpooUp+kOZCyEUQCAg8wIAFNo2TRFawB71rOC1GJL10ilKyVIDMKs9+wvrF6ppFq0HaDaDWB1LdcuoIq4BB9hcCkcTLYpYEjYD5wTw5bqPkKHTuOtfKNTJT1aw6ajvivh0sAeMb4Pq8oonqeugMW4JAyIr7KdvdEYUF028uh6xPArGRFfZTqNhEkXKDpT3nWKZqOaCUKoALX+f7RpZqKwEj4wj+Eu903PWGiQQ4DPUs/9R+EAcZB9Sv8At394frDBenM16UrzdYq+N9bfp8YyIZenwH6xqJU5/EK5lVVcW/Cm8NpErkYnMDkBox7O4B+UKVr510UWUDTuTesHYacStgsNnqlQajAO58vAR2vjjDaQAEkJcMo3BFykihiKqUKVP7xDg+LwQs1HUCotfd4FUsOWKlVslVLWYmkSV+BUMqN8qdvdi5C+dXcNtusUYNXIih7Kd/dFbxNKXWTYMBp7o3jMMQt/1/1Fy1UgaVToNnvFyrfvEqYoP/swPg5bJU3vr+KyYKSsfbxVhxRX41/OFKak+VfkdojjVaXor6bxYs+F/kYhiS5B/o+bQKLcSnkUWA5VW8YimWXe4KR8o3iQAhQzHsqp4GLELGUb5R8ntGYi4yeZDe6fpFEgAP8AhV8os4wrmQ2x+f7xTJqlXQH5R0+I+q8MnMtIdQvcUol4YmQCA4chAZgdgwYD66wvQuhLKFFVZx2CGENuErUVqOdChRjY9Q0GRxWYhD2eySK3B0rAhPOhklNaggD2FwdOIb3RlArSzWrAeXnQAFEZrkuOwuxd4mGipLMWaw2/SB0Blgb/AK93fBYTTXbX9YDL53ANhvvAR5RUft7pijh83+Ggf0p1G3dBKO0n99oGwCD6tPcn2tG2Ag+Eykkfr0+Gn6RkwV/3G5QOvhU06V8I1Mv/ALgYt4pLeWt/d66Fx8oOWgubtVrH2tjFWPA9XM/ArQ7HWCV0JLfbxt8b6oyn7QIyL8w2PkYyAuWRLdaw3tbkaJJPlBBQpCkqJcFZZKgCwzZa2YudxA0meM6wo5Rmu9uVO9P9QbkZSClQIVqWLHNVsorr4x3rkaYmUSUlyjs0dnvsSIpXL5rMHvQv8HgnEJdQZ9NSLdIGxLOxJJ0dLgU0IERDVkhJyywB7Ke7sjrBMlfOod36WinDKbJWyUi/d0iMpX8Vfhvs8LGKFD9K/tEjMYeMUII1+vnEVu7fr9NIFDUGgp84qlHtBvaVcd0TMws2ukDIPacntHR9RtAwlamDFtdekRxi8qUqI0ax6Rita6Gx77vGY4Olkn3vl+0DAZ6s0tX4VfWK1Gg7trUb77/K3FI5FvolQ30MDrlknMr3R4uKffWFiXipGZHcRFMkcq9sp+Rgjioql9H+P38YoR2VkbKH7x0n+KL6vw0slByuCaO+uzEHUiDeFZhMWlTLI1YPRg7uKeEBYMpUEhSik5k6itq1hlwtLLWCQwzCgvXcW10iaYz1FVOSeUcrnYHV4qyc6KMp6BhbIvUDvg1Kb6U3fycQvQAZiCn3i5KWJIQujszfpBKoVlU1fp46xT6shQYUt8TasGIOm/X9oiR1+3gLJS+bu/SJcNXmlIP9Kd9hFaLxDhR/go/CnfaD4xkGDt4+X38IhMVzgNtvGlVB3/eKUElTn9bN1gKWPT/DmU9hen9JiSg5UwD13B84jxBbomfgXt7p6xFALnmrW4IFw1RT/cb4F/rB9rjIhXcf5RkYuYly2WtRzJdTVS6RypIdwe/wg0SDyLSqrm1mzljlNA9dNIrVinWpOVQdYcs7DIAe7v6wfxKfkRLHUXvQuzGOttRoZOWxyqDnK73BrTSmkDzZwBb2moHv4QROWCEqWoDlZxRnq4O8L8VjXD3KQWUGY2rWor8oJGvBctYCUl9E69B9+MTTRaj3flhVMxTIAcDlD+Xwj1GbMw0oKVNTLSkqSASgGplpU1EnqYdC1xSFh/D9IgtTFya+DbeEdmONcP3lbfyzr/bGJ4zw82Mo/wD8z3n2bQab8v0431ltvD6xX6ypt2juDVtqR6Jgp2Em/wAv1KzsEpf/ABIeCkYCVX+FLufYT+kb8W/L9OAkspqg+R0tvBWILjuPhVxHbTMLKSkqKEAJBJOVNAKk2gH/AOoYSvY68h0/tjXD9j89/HB4lToW4oAq2tKCJKbIO4V8I9BlSsPMQVIRLUkgjsjShBBEEf8ABlf9NH+Kf0jfi35PF+JFyPH5jzgbIyFtsW8v9R7cvhsjWTLP9if0hNxHiGAlhaSJJLGiUJU1NcqWHiYrWoPy28uwUs8oJHaTcaMDcGlHMM+GgCYoJJy1uQdetTd7w4n8GXiVqxOGQn1K2yJGVBdCQhXLQDmCoAThVonETEFCiVMFBsw3SdQ20TkrFtSwGDaag272gT1qc6ALOagjRCm1pf4QYqwctSlWen35xqTw6csy1JlrKHXzBJbsKD5u94mKrE2v9+e0UzlUNi9C9aPWDpfCp5DiVMIIcHKbHYtFUzhOJY/wZn+Cj9O+M2wijQD7pGYAAS0fhTtfKN4ipJDg0IuP1ETwH8tHRCdtoL4RSXCXBrUad/z1ipCWJD+bU8W3iAnVI0uO8gfpGZ63+P7QFPFdiZ+Be3umIoLKVUa+0d9iGHhGscs+rmVpkVr/AEnpEUS1OS4L9TqetI3xvoj13X4pjcV+qV1+H6RkZnPScQFLJTTMUcwuHQmngXh7PwyVJCe0+tCaJDP96xzXCCEzVPQhjUsGyp0bWOvwaSoUIAuQ3eND02jplypx7OlqsIpSspLFJY72FtN4um8KQBXMWIoQ4Zx4bwbxWWQ6wpiliSz0atG2+QjSlEkgEF7mo8t3g3W1CqUt5aSzciQ3cNfutY7D04DSUn/8qP8A2BHFy5n8JDhnQhVNyhra1B7mMdx6byicP3TEnvAkh7RUTfY5PhWAXPWUSwCrKVcxYZQQDfvHxgxfoRjNEoLW5x/qLf8Aw8mD/mKJIH8JVXpVaGEelqxCBdafMQyJyteN+rXJWULzIWk2cuDcEEaWIIj0v0R4scRJUVEFaFqSo76pU3UfEGOT9MMTLnYlJQoKyICSoVBIKlMCKKABvuTDj/w8lEJxJqxWEjvTmen9w84J6b/js39KMcEISjWYT/ikOfjlHiY45cztF7KUKijsTUt0PlBHHsf63FrHsoGRLuOyakaHmJrsBDjh3C8+CmG6lutD1bK+UDv5v8oL2mf1gf0P4iSrESSlu0tJBcEjlUOhbL5GO1EeN4PGiVNE5ACslTl5RlIIU4djRx3mPTfSPHerwk2Yg1KAEkbrISlQ/wAn8IqeJynXDemvpOuatUiUoplJcLILFZF6+5RgNbmkLuDcHnzkrMtHIyklaiyRQUe6iOgPhAOAwnrZ6JeYArUEggVAJqfCPV+K4hGDwqlJRySwlISC1FKCNdavW++sb1vPCfgPEZeDQnCTuVctyVJqjnUVpYllGig/Ld46dcqXOQHyrSqoIqO9JFj1EeecUxKZ0z10skSpmXKpSTUoCUqAB1CgddNqlz6D4laSZai6VDMkVoUsDqQxvTaDfdVrObhTxrhK5EwpAdCg6VXprTQj7vHU8FJGBTvlmdPfPhFvpdICsOpWqCDZ6E5T8/hA3A54/wCJKBIfnGV6kc+hqHAg1qne4Nm8dw8rKhcwJUEpplUaEAioDWizCcdw8xQSiakqNgQoP3ZgHuI849IMSFTQSG5Upv7oykjvZ/EQDKzLUkShmUVEJAqSTT6Rt1vxj0niXC0YiQpSmC2JQqxDCgO4LOQfejzvDp5ECo5U0r7seoLlqVJQmxyOe9KKP/cQfCPMsTMBJKbFyGe14Kca1MSClqUc6Pc6vtC4zACTmPgVfQs8WpUSNur7m3wMCLYEj71vGkVaYYgvKWXshW+x6xcZ4zlOZJ/p1vqTaBpih6maQK5FadDG52IIU7KFTy5QRrVwYNNsTze7/wBwjcKmR081xkOjsklzilal+0CL9miU0PxjsOEYnOwdLk0yKu1T+ascQqil0N6toyU3GusO+FYjKpJVlIaoKdKOBs7O4i8sdxGOR9xQKUjKS5UUtQg9r3hFfDp6lJDhQANACFUJ113tvEhxBCgjLmSyQ7B/g30jXDEfgBoDUhRYCrPHP4ul89SjLkgAZlIG/RTBrO4j0T0slgyEg6rT8JQ/SOEkS1FSC4b1KFa+6Aabx33pWHlIf3x/7QiviPsefT8PmVkRJKlpckISTQChAS5ZyNIBHCp5A/8At5tz/wCWvUp/pjtvQxDYxb2VKUe7mQGbz8zHcT1BPw+2HdDLwZXunmfo96OYlbPKUhNiqYClhuEllHy00jvpgRhMOvLo7Oe0tRZz/cR3AdIZYea43G4jkPTfHcyZIejrVUUcZU01DZnHURuTrbuV0RyZYUtBJqpgSVOkWqXt39I9BRxHDS0oR66WkAAJBWkUSG3jzzASVzVKRLllRlgZiGYZnYPvQ0gvFcExRWWkrIIu6aeGYQTcNkv0u9KpaQqaEKSpF0lJcMas42s3SHysUZ/CpiPblZUka5UqSUv/AG0/tMc36Q8OnS0KVMlqSkkgKG9SkEAnT5Qf6IYwCeqRMA9XPSUHqcvL58ye9UMGRV6PzRLxclSqMsA2sqhU/R38I9L9MMOpeDnIQkrUQlki550v8HMeX8V4ZMkTVy1hyHKVGykGyh37Vq4jqOD+mqfVGVPC1KShQEwB35S2YCoPUP1haz6XTOKzsPJGACJYUgErUuoJX/ESEPSgUA9aimhhx6FoKpySAWQhTl3S/Zbv/QwGvg8zF4j/AJEsH1SwnKtRTkOVCEnlPOOZJHZq3jHZ8F4UnDSyHClHmWpmdhoNAKsOsGt1rdRX6WTijDLYO+UXb2g5eFvA8Jnw0hbrzqKx2iRdY7PZ+ECelnFgoiTt2wzjMQ2Vx7r/AB6QT6Pz5iJEgBKMuZTMXF5hUAHdhv4AGC2WtJqG3CZKEpUlSUOlRuBYgHWrXhlKlJS+VKR3ADU7R5Z6UIWuepRFDlZhoRe9A3jHZeiHFCqQETDzo5b1UluU94AI8BvGlmhcb6D9LfScSwqXJIKwFJUWLILga3VfxjhJSTlQ3uD5CH/pLgVLE3E+yVZadAwPdavUQmEkZEED2RtsP0jb2vGaV4lLJpRyK9AH+pgWbKJKi48Lvf6wyRLC+VTdmlrmgZ7awumrbxA06AVgjVi1AS5l+wru7NItllJWQg95CyLu4YuDFayfVzA3sL/KYJJBNbAluyXroHf/AFGpWeoR76/8x+kZFX/JHuK/x/aMjdPCLEyhnWr2s4F9MifvxhlgpIWqWglipypxUBlgAeQijEyUjEzQAMgYsLDLLQ4/yZ++N4DtJV3dDRj8Xi7eIk6PxWBUgJN0gDnRVrdoaQVw3HMoBRS6tWYqIIHgrfdoZ4mRmSClQHKLAGj2buhKvDATUBwkgoKQXYkLZkg1tlcPrES79VZofKkACQTrKCT/AIpI+Rjv+L8MVPQEpKQQsHmdm9WBRgaxxWT+EggVSlBFqskU8Q48YqwU8n1hClEFQI5tMiesaUWeOu4D6PTJE/1qlIIKFIZOZ3KkqBqOh12joCgLDKFbR5JxuesIKgtYykE1O/fCvDYlZcZ1kPoovs4PizWLRU8TZdvbhKKSGAA6DrX5xwGP9EcXOxOInetlgKXROZdBlASCMmiQkeEcnisVNyhOdShQpfMFD41HUGF8qfMKlALVo5JPu3v3RUnB5Xs/onwNWFkqQspUtaipRS7WASASASwD11Jh4RHhmHxEwhwtf+attifD5xZOxyxNTzqJcaqZ9oN/G/HfXrfpJw/1+HmyrFSXSo6KScyfBxXo8cefQjEuhSVygpOUguq6ag9jeOMx2KWQo+sIpYLPu2u9xFS8evKkZ12HtK1EOjrT2riHC5eKlBE5HcUkulTVKVbPvQtURy2N9DJiUKyLSsBKmzOlVj0IOu0ef4DGLBHOtnPtHUEV+EO5q1mWsFagcqtTsesTl+2xl+Oy4RxWXg5KMNNChMRQhIdPMcwZRbQjueKeK+kMxbJlpCEFnc85H08K9Y5JQWpCEqclu12i7Uq8NJCaJzUIcAvQjN1iblTMYqz94NNHHjv+8dJwvjMhEuQhROdKlWS985/QxzswpSXDA03tsG1hZ/yklaC+Y5rPSiVnVtdIIqzZ9x5aJk1a0F3ygUAsGZu/eF2FmlBJQvmYirOAQRo0CzMVRsoy3y0iSMWlhmSw8PpakbVM07DFekGEGHWg5ijKpDZDUBLP3vV+6OKBSEJ15U1YB6BqaRnEJaMimVlGUffyjSFBka8osz6NTvh+CTSE1RAOho1rO+kB4hAUtJZPiP33gjEKDF/2f7bzitY5goA2GzVeGCpFHIuvsLOleUxCQmgeqjVyKb6UMQUjkX+Feg90xvDkgPlAT0cKt3NGIj1St0xkUeu/pV/mYyAt8QkZkLIQzTBUmqc0qXdrufjAvD8SCGJZwRbUAECnQN1eGkyYkiekKGYzE5Q4r/DRCHBPnZQ197fP9flFTsT9dlgJuaWK1SAD4NSn3WE8yaVTZS1AAIWUkpVQsdUmo0N943wyTOClhJyp1OUFiAml6Hw0i/FYRIl5cwKqNuSASCXrdoialX7DnCDkl/gT+URz/wDylSVLQEuFLGVSiyQ6U8pPQ/BobcK4gkSJRILBCHUX0TWgEc5jeIeszoQl0qWKnoE2BBhk6i8iWIxqlAheUJNwBcBTEV8/MQPhsysoFGABURtqAYsw3DiSCutzlH12gheH0UAwPYBAJ7z998VuTkGr7Qy5gZSUAEMxWoEuWApX9oDmJyrIRVJY3qzB37rQzl5UOpSA70Tys272+GkBTkOtd0pKywuMzJoehDWisaMosVMy5b2OlHL6i9YrxwSlfNQqCSCk7u5Jo3+4mEglPsNQixBFW2/3FPEJwBKUnkUBdiaPsaRp6L4r4ilSUkleZ3FRW2790DTZ5ZIIag/3GT2TmYG1joCIrnqYMDt8gYqJtHcPmhlaa+WjQ/mrAQovdB+T1/ToY5PCAl23hoiaQhYNXQaE/dh84nLHrpjlx0UybyI3pVzbq0Qkr5QxcuNdMoL1hWjFEIGrAXLG4gnA4gFBzBmFKv7NyfCIs1FbiSCVM5LkBnv5ikUIkklBf2vedhlXakGYcAObBqEPo5vFaEBJlgp9oPu2VRApXbSDZ0kcMWfpq/6X7oqlMFc3SlW0qKMYZme6dB0Yk+MUpkDKDsa3jTI3Eu4lRCnJtdz1iiTiCQkE0yh7eUH8QwxMpZL0teoamtv1hUiWpgCDYOzinlSKmrEWWUYqa5QAQw2/QGlYwkVSLNfz2MBiY2Ymzu0WqmpUzJ8HG56bxtDe1OKRlCrdlf5TF2BnKWdgNXB+A+7RHF0QsEEOhV+iT0f7MDYaWHIJ5n5S3lbwjexrymWc+8f8TGQJkm7K8zGQaVsDwtKvWZkgslaSdgwS5f6QXLYrpbMkBtTmVbakE8L4d61U1S3CHoHapQhifMUirCSQuYkJfJmToHJAUSB4A/GKt2MZo9w02YorbKEmgU3N7L5NPE3i2WhCMt3vUuT1c1cwPipwQrKkM4FhVuUUBiMtQMxLAkoFaOXJYuqwbyjj2uviGFxSgiUjJRSEUtdIcnd3BgPAYAlKubKoLAcOW5RVhTzgeW6pKCo1SEEd2UCjHRhTp1ivAzmJIoyg/Wm236x0mPEWmy/XoDnJlGoBcuQDpSBESytXbOate42s/nB2GU4LqAQ9hUUY+Hd84yUpAWSwza5beYN+kGwzFISkB81L8xFLABvGObXiF5lhqZlXDs7Pfm8Y6DiyklJIUTcUe42rfv8ArHOzZRBUSCoOeZJbQdYvFGQ0y1DKvtFuZizguzgm4++o3FFoUXSpKgQXBDEdD1EWImkFwXBSRW9UlgQLxDGBjnyjKQSxcitWdrsxip6n4AW7AM9BUH+kXiMwZe79rjpE56RzKQOWgvblao+sbWo5ctGpVqtt1iglw9w7XMNVpIQp2okltRRm8frCvALIUSKHTo8HTFOFCvZPyMTfVS8WygcuhFO+rVaGPDZTXd1IcU1Y7V6+EKkoACVGtnYvr+jw54Ys0JsAnS6VJL21YgxGXi8VqZGYFiwcu1tbj7vGMSUKJfnDMGHZXbUxtMopKyzpIBozGxs+tYpWpkIqSc6Xd6EhT0jnF0bMSSkggdKGMUjkDOGLnanSK0E3NfAxfKdukZiviM9RQqngAKd/i0ZwvnzOK5Uj5xPiIKELYUPxpcv30b94AlqYhaSxABFvEGla/OLnib6IxWEOWoZqeFgfh3wvkBQIuL+9oTZobTiFoJKg21Bt8IrwSQpOVwzOksKXo/SNMudFm6FmodEwjMTkWbq1Sd+6KUSFZg1C9XSx8wbxCcWCx/SsG1aHrF+fcKDFwfZd9Q9Lwt6kw95fmqMin/kp3+JjI2m4fyJyUCaoHKAvzaUiw+MKkFlITq4UKAAZkrCnI9kH5CD5E8rXMAoCt2Lf9NAv3fOKMNh0lClgEFKVlL6BNQnqLX3G0RK6aukXzzUuXcA+WwLHTwhgCEOWSkMAkVc1qctYpwywpal8rqCQgMCa5iSAeywFY1KQhayQjMCzFSlOSDs1Bc9IKQHBJAWhBUolITUbXADvSrVvC9CMpWk0UDQ2sB9I6H0dwryZXI9H7QIcHYwvx7layzLQvMQPcKUjQaHSt4vHLtc8pyJYKcUozFlJJZQLbU+2MRxRQlGduZRLlxvQZTZh894iAyGq33SoizGSFNkSMxYE/RqMG5vIQ/RfFaJeYXAoXqmgDHamnwhcEnMsBWV1EMWLu1C2lRaGXCk1U7gZWqQKkaUrb7eBJc5gsJQFE5TmLOCEpcecVE1QKBSbs4NWblVobl+ukTyFCWWleRSQCVpoKUKaO4q3jFuHDlSlJD0CQe1nVQEb7+UZxGc6lBRJUKZS2VOwGU1MP0a4UT5JQoqSUqBzVBoR3QVNlIVzI2GZOx6dIHSXJHKxzUb41gjFyCg0LFhaxBsRuIpMV4NF93++6GGJZGZJfNlIOtCKDz82gfhi83KGBFQKDQmm/d/qC8ShypRHKAb6jLQA66RNvVyc2vRIIQgE1UxZnYDd+8+cGcKJADp1QGINRkFaWet7PAZnEhIAKnygkHmNGYbW+6wdw9YQEOMoWKhyLJANfA+Mc8vHSeq8M5ABFHB5q0SxAod8uka4lQS2NM6Hvqov8HgjDoTnWCGLlj7wBJuNav4wJxZsiBSi02/EdYJ618Gyhp31bSnXugiW4H7fvFCEhzytVrDfvi+SHSRE1QPiSSlCqbv9GfxtAakJbUHKLPp93g7jR5FWHK+nWF8pdH6DQ9IqeIvoibIoGKvAd3iD5wBhsSErISXAqA/mKjZ4bpS5YUoSCxu46Qkny3UpbKpt1Fqxp31rzxviinC1psQuji+XuqIhncJLpYvysx01gidK/hKOZRBSq5NKG4YC8L5M4oV2e+nl9IudibdUdT3R5iMiHrlbp+P6RkbR3GuCYlSgtIqoqoXNeVI86X74fcKkpSltFMGb+lD/AJVRy2CZOdQcDNVndJYVEP8AhWKTXOoqIyJGxJNKs/ZUT/bE54/8XhlzqiWsoUpABJl5khgLE+Yo3nDCQqYhKGyh8twSQCoOb3gXiCx64quJiUKOzqQBauogk4WmcGiW5QWJs57gR4xNpk4zgeOP/GlpSwWXTo173fUQNlIUsOSp0hamLEKQnYNlzfUxb6MTBLloUUuSpVWsAkOXOlQG3MAhYlrUtqlRCUlmqBXy7rw/aPjEJKTkX4EavanfGLxzTCFciezXrVm0FonPmIWoKB7QFC/Kb1Gzv/lA/E8MFIBSpLlVQHAFWronTzip+0X9MxKFoUXIWCSRUkFgzd4BEQ9YKqQSlRoRsyRUKo4vF0+WpwA5pdyxoSSNx1gUSsqiDTOQlnFqb7xUTkumzHSEguo1Lixy7nYUgZEh1jKA4J5goF1FXW5aLRI52Yuxs4DEKbyEXlCEIQQhK1qSXfRhdvAnujeNJsnnpIKgSaJLulqweuYlaQFFlBIAOh79vs7xvGSx6ss9EqDk9xDRopSEqQpOUskpJZwqjudiId7GtUtyFKgLHrSv6wwOKK0KQospgRsrp36t3RVLUVsCA6QA5NSwIZzAmNBFOlfAWjetOH6koErOksXyBNyBlLno5EXLSkyRVykEs1nWTe3ZFoAwcwLyBR5wz5rLAFidD33i71gSsJIuPEcuVmpcv5xzsdIaYaWpSM4oor5abWJbckg/i6Qt41iXRmZgFI6kMpTjvH0h7gEJTJQF9nKVE3oaqNuo+EcpxpRyrSbvzWuCa0o7M/UwY9rXkdAUKc9/S3l3Rdhjyn9voBFSZjHpbTzi2RNdL9d/toirBcaXykU7G/fsICwIOUfh69K3rF/GZ1P7L+Bhfw1dxq1I6Sf1c7f7GypwS6spNDRjR7G/SFkyeFO7AmtzrX5weqRnroNxvSlWrau0LpWFJXq3jGx02W1ykshRD9hV31Sfj+8Qmy9lDu3Ds2zRdPHIsMWCVfl/eKslHFw2gOvQuIY1CerPuH4xkMMydlf90ZFbToDwxTBb+98cohhIQQtC0p7JKlAuzoTlB2oowqkTACsf1D8oh7g1KyqSgcyhlLXAA5iPNJ8YMjioxEx3KaZSAHtylRPhD9OFUuXkC3BqmgcMxyksHBbvDaxzRWFgEAVU93skaHq8dThZroQxyqHa7waEXBcfOOOd09OGOy70dlj1KVFdrDyADvRtoC9YOZeXMVLZII9hOV+4kiGeAS0hGU1SVqIpY8wd7VbyhJKAOfdDJT0OVIFvGNjlLbRljZA6p4OYBABKiQxNA4ZLWIH6xqYlg7MRe/30iU/Ik5WBKWYh/dJUSX0+kaCuw9Aqpd25hW3eI7SuFgzAYrLLGZIWEu4JL1fmtUXDbwJi5iTNnZeypiLM4Y1fxhnh+HlCCSQQQaOWDi+jlnp1hFMmFE1aS45iD+mvV4MbLboZSzWxvCpic61tYBnGUVDaE0dqaxdLXKzklaiR7p5WcOHVzK02hXNmJzkoa2uUNuXDBn+cSRLDOliQFFZ38TtSKsaVuZNBlLGjC46DXSJ8UmoUoFNRlSC/cHP0gadKIQoEEUbxBb6CIzaJDv8AS1u+GaF2lKW9AaJ13rTui7GLzBSV0LXIqKWOvjAmAWApjVJuBekFzVlScxajsdSA1CdqMBBfTj4wyykDcjpqm3dDvBErQos8xJTkcVZJSGqzhyr42hdgUhYAVoA1WY9ejtHUcK4ctKkBuRiXsAqj2O6i0cM8tO2OHN/A+LmPlQ2VrpNyE6IuFEULHp0jmfSZYXzS0nIlklWiiCTQam7nrHccSwiVnMUgmhs/V9CNY8849LKeySUlSqOaKClAjr39Yf4ruj+SahuvE5Cc01JJdgAOvaZm+ffE8LxEDtAjNqLd+lIXYDIvOlRYs6agU102g5ODBlnKai1qg+FbE7jrF3Xlc5v2IcbVS/sAVd97ERCXLAqAdNPo+0DY7Fchlrc5aJL1SxsenTpSCZSwQWv+9/lD5BO0VKmB8rabdD1+3iCs2anTRXjGkKSFFxUqAFNGc/I+cWS0upz00PyETvS5N8ZNQShbj2VaH3ICLFNqt7rkF3oQX/3DPEAiXML+wrf3e+FZSGBJ01ZviIMctquKPqh1/wATGRPk3H34xuK2j8DPCdpf4h+QR2PCP5v9v0RGRkNSBT2P7v8A5mOkwdx4fONRkcM3eL8N2Vd5jmJnbmd6PkiMjIMfB9LV/wA1HefywxxVh+NH5hGRkdp4i+mGN7Ur8QjjPSDtp71/nMZGRv4/U5BcP2x96wfhf5i//QX+WMjI61MNsf2B3I/OIB4z2D+JUajI4z2O1LuG2m/ekGq/lj8J/wDlGRkXl62Hhp6MafhjteH9nx+sZGR5/wDY5eK5vaHcI8/9KexJ/wD2V/mMZGR2x9c74v8ARu8/8Y+aofyuwjuHyMbjInP0zwg9Kv52I/8AR/WKUdk+PyMbjIvLwYi//MHefyGCk+z97RkZHKqnreN/lTfwK/LF2C/lf2n8xjIyOagcZGRkUp//2Q==', 12, 2021)
SET IDENTITY_INSERT [dbo].[Albumes] OFF
GO
SET IDENTITY_INSERT [dbo].[Artistas] ON 

INSERT [dbo].[Artistas] ([ID_Artista], [Nombre], [Descripcion], [Oyentes], [FotoPerfil]) VALUES (2, N'carlos', N'loremsadjfodjsofjsdokfjsdofsdf', 123, N'fsdfsdf')
SET IDENTITY_INSERT [dbo].[Artistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Canciones] ON 

INSERT [dbo].[Canciones] ([ID_Cancion], [ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1, 3, N'asd', 2, CAST(N'2023-02-05' AS Date), 12)
SET IDENTITY_INSERT [dbo].[Canciones] OFF
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
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1002, 8, 1, N'adsd', CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1003, 8, 1, N'asd', CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1004, 8, 1, N'sdf', CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1005, 8, 1, N'sdfsdf', CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Mensajes] ([ID_Mensaje], [ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1006, 8, 1, N'asdasd', CAST(N'2023-11-20' AS Date))
SET IDENTITY_INSERT [dbo].[Mensajes] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Username], [Contraseña], [Email], [FotoPerfil], [RespuestaSeguridad]) VALUES (1, N'Hola', N'fdssfd', N'qwdqwd@gmdsdf.com', N'', N'Jorge')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 8)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 9)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 10)
INSERT [dbo].[UsuariosXComunidades] ([ID_Usuario], [ID_Comunidad]) VALUES (1, 11)
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
/****** Object:  StoredProcedure [dbo].[sp_CambiarContraseña]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_editarMensaje]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_eliminarMensaje]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_listarComunidadesPertenecientes]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerAlbumes]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerCanciones]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerComunidad]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesComunidad]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerMensajesDeUser]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerPerfil]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestaSeguridad]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerTodasComunidades]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuarioByID]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_publicarMensaje]    Script Date: 22/11/2023 21:20:40 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_registroUsuario]    Script Date: 22/11/2023 21:20:40 ******/
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
