--SP para validar login de los usuarios
go
create procedure sp_login
	@pUsuario varchar(max), @pContraseña varchar(max)
as
begin
	SELECT * FROM Usuarios WHERE Username = @pUsuario AND Contraseña = @pContraseña;
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
	select * from Comunidades C
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