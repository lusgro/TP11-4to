-- Artistas --

insert [dbo].[Artistas] ([ID_Artista],[Nombre],[Descripcion],[Oyentes],[FotoPerfil]) Values ('','','','','','')


-- Albumes --

insert [dbo].[Albumes] ([ID_Album],[ID_Artista],[Nombre],[CantCanciones],[CantReproducciones],[DuracionTotal],[FotoPortada]) Values ('','','', , , '')


-- Canciones --

insert [dbo].[Canciones] ([ID_Cancion],[ID_Album],[Nombre],[Duracion],[FechaPublicacion],[CantReproducciones]) Values ('','','','','',)


-- Comunidades --


insert [dbo].[Comunidades] ([ID_Comunidad],[ID_Artista],[Nombre],[FotoPerfil]) Values ('','','','')


-- Mensajes --

insert [dbo].[Mensajes]([ID_Mensaje],[ID_Comunidad],[ID_Usuario],[Contenido],[Fecha]) Values ('','','','','','')



-- Usuarios --


insert [dbo].[Usuarios] ([ID_Usuario],[Username],[Contraseņa],[Email],[FotoPerfil]) Values ('','','','','','')


-- UsuariosXComunidades --


insert [dbo].[UsuariosXComunidades] ([ID_Comunidad],[ID_Usuario]) Values ('','')
