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
create procedure sp_publicarMensaje
	@pIDComunidad int, @pIDUsuario int, @pContenido varchar(max)
as
begin
	insert into Mensajes(ID_Comunidad, ID_Usuario, Contenido, Fecha) Values(@pIDComunidad, @pIDUsuario, @pContenido, GETDATE())
end

--Editar mensaje en la comunidad

go
create procedure sp_editarMensaje
	@pIDMensaje int, @pContenido varchar(max)
as
begin
	Update Mensajes set Contenido = @pContenido where ID_Mensaje = @pIDMensaje
end

--Eliminar mensaje en la comunidad

go
create procedure sp_eliminarMensaje
	@pIDMensaje int
as
begin
	Delete from Mensajes where ID_Mensaje = @pIDMensaje
end