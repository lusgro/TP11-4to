--SP para validar login de los usuarios
go
create procedure sp_login
	@pUsuario varchar(max), @pContraseña varchar(max)
as
begin
	SELECT * FROM Usuarios WHERE Username like @pUsuario AND Contraseña like @pContraseña;
end

--SP para registrar nuevos usuarios

go
create procedure sp_registroUsuario
	@pUsuario varchar(max), @pContraseña varchar(max), @pEmail varchar(max)
as
begin
	INSERT INTO Usuarios (Username, Contraseña, Email) VALUES (@pUsuario, @pContraseña, @pEmail)
end

--Listar comunidades a las que el usuario pertenece

go
create procedure sp_listarComunidadesPertenecientes
	@pIDUsuario int
as
begin
	select C.ID_Comunidad, C.ID_Artista, C.Nombre, C.FotoPerfil from Comunidades C
	inner join UsuariosXComunidades UC on C.ID_Comunidad = UC.ID_Comunidad
	where UC.ID_Usuario = @pIDUsuario
end;


--Listar una comunidad especifica

go 
create procedure sp_obtenerComunidad
	@pIDComunidad int
as
begin
	select * from Comunidades where ID_Comunidad = @pIDComunidad
end

--Listar todas las comunidades disponibles

go
create procedure sp_obtenerTodasComunidades
as
begin
	select * from Comunidades
end

--Obtener el perfil de un usuario

go
create procedure sp_obtenerPerfil
	@pIDUsuario int
as
begin
	select * from Usuarios where ID_Usuario = @pIDUsuario
end

--Publicar mensaje en la comunidad

go
alter procedure sp_publicarMensaje
	@pIDComunidad int, @pIDUsuario int, @pContenido varchar(max)
as
begin
	insert into Mensajes(ID_Comunidad, ID_Usuario, Contenido, Fecha) Values(@pIDComunidad, @pIDUsuario, @pContenido, GETDATE())
end

--Editar mensaje en la comunidad

go
alter procedure sp_editarMensaje
	@pIDMensaje int, @pContenido varchar(max)
as
begin
	Update Mensajes set Contenido = @pContenido where ID_Mensaje = @pIDMensaje
end

--Eliminar mensaje en la comunidad

go
alter procedure sp_eliminarMensaje
	@pIDMensaje int
as
begin
	Delete from Mensajes where ID_Mensaje = @pIDMensaje
end

--Obtener usuario por nombre

go
create procedure sp_usuarioByUsername
	@pUsername varchar(MAX)
as
begin
	SELECT * FROM Usuarios WHERE username = @pUsername
end

--Obtener respuesta de seguridad
go
CREATE PROCEDURE sp_ObtenerRespuestaSeguridad
	@pIDUsuario int
as
begin
	SELECT RespuestaSeguridad FROM Usuarios WHERE ID_Usuario = @pIDUsuario
END

--Cambiar contraseña de un usuario
go
CREATE PROCEDURE sp_CambiarContraseña
	@pIDUsuario int, @pNuevaContraseña varchar(max)
AS
BEGIN
	UPDATE Usuarios SET Contraseña = @pNuevaContraseña WHERE ID_Usuario = @pIDUsuario
END

--Obtener usuario por su id

CREATE PROCEDURE sp_obtenerUsuarioByID
	@pIDUsuario int
AS
BEGIN
	SELECT * FROM Usuarios WHERE ID_Usuario = @pIDUsuario
END

--Obtener mensajes del usuario

CREATE PROCEDURE sp_obtenerMensajesDeUser
	@pIDUsuario int
AS
BEGIN
	SELECT * FROM Mensajes WHERE ID_Usuario = @pIDUsuario
END


--Obtener mensajes de una comunidad

CREATE PROCEDURE sp_obtenerMensajesComunidad
	@pIDComunidad int
AS
BEGIN
	SELECT * FROM Mensajes WHERE ID_Comunidad = @pIDComunidad order by Fecha
END


--Obtener todas las preguntas de recuperacion 

CREATE PROCEDURE sp_obtenerPreguntasDeRecuperacion
AS
BEGIN
	SELECT * FROM PreguntasDeRecuperacion
END

exec sp_obtenerPreguntasDeRecuperacion

--Obtener todas una pregunta de recuperacion 

CREATE PROCEDURE sp_obtenerPreguntaDeRecuperacion
	@idPregunta INT
AS
BEGIN
	SELECT * FROM PreguntasDeRecuperacion WHERE ID_Pregunta = @idPregunta
END

--Cambiar contraseña

ALTER PROCEDURE sp_CambiarContraseña
	@pIDUsuario INT,
	@pContraseña Varchar(MAX)
AS
BEGIN
	UPDATE Usuarios SET [Contraseña] = @pContraseña WHERE ID_Usuario = @pIDUsuario
END

--Obtener todos los albumes de un artista

CREATE PROCEDURE sp_obtenerAlbumes
	@pIdArtista INT
AS
BEGIN
	SELECT * FROM Albumes WHERE ID_Artista = @pIdArtista
END

--Obtener todas las canciones de un album

CREATE PROCEDURE sp_obtenerCanciones
	@pIdAlbum INT
AS
BEGIN
	SELECT * FROM Canciones WHERE ID_Album = @pIdAlbum
END

--Obtener album por su id

CREATE PROCEDURE sp_obtenerAlbum
	@pIdAlbum INT
AS
BEGIN
	SELECT * FROM Albumes WHERE ID_Album = @pIdAlbum
END

-- Obtener las cantidad de usuarios de cada comunidad
CREATE PROCEDURE sp_obtenerUsuariosXComunidad
AS
BEGIN
	SELECT ID_Comunidad, COUNT(UC.ID_Comunidad) AS CantidadUsuarios FROM UsuariosXComunidades UC GROUP BY (ID_Comunidad) ORDER BY CantidadUsuarios DESC
END