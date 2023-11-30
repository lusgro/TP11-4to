
--- Usuarios ---



INSERT [dbo].[Usuarios] ([Username], [Contraseña], [Email], [FotoPerfil],[ID_Pregunta], [RespuestaSeguridad]) VALUES ('FrancoBron', 'Franco123', 'francobronsztein@gmail.com',null, null, null)
INSERT [dbo].[Usuarios] ([Username], [Contraseña], [Email], [FotoPerfil],[ID_Pregunta], [RespuestaSeguridad]) VALUES ('RamaKwon', 'Rama123', 'Rama@gmail.com',null, null, null)
INSERT [dbo].[Usuarios] ([Username], [Contraseña], [Email], [FotoPerfil],[ID_Pregunta], [RespuestaSeguridad]) VALUES ('ValenWug', 'Valen123', 'alen@gmail.com',null, null, null)
INSERT [dbo].[Usuarios] ([Username], [Contraseña], [Email], [FotoPerfil],[ID_Pregunta], [RespuestaSeguridad]) VALUES ('LucasRosenbaum', 'Luquitas123', 'Lucas@gmail.com',null, null, null)




--- Artistas ---



INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Duki','Duki, nombre real Mauro Lombardo, es un destacado cantante y rapero argentino conocido por su estilo único en el trap y el rap. Nacido el 24 de junio de 1996 en Buenos Aires, ganó popularidad tras participar en "El Quinto Escalón". Sus letras ingeniosas y colaboraciones con artistas prominentes lo han posicionado como una figura destacada en la escena musical latinoamericana. Su música fusiona influencias urbanas con ritmos pegajosos, contribuyendo a su éxito tanto a nivel nacional como internacional.', 100000, 'https://resizer.glanacion.com/resizer/v2/duki-lidero-2021-en-spotify-con-sus-discos-desde-ASE4W7XBHRHH7FQKKD3JPL3EOY.jpg?auth=a2f34c05b2deb04457cf41a45fa50933ef1beb569bfd76689e099d6b1bb31175&width=880&height=586&quality=70&smart=true', 'Trap')
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Emilia Mernes','Emilia Mernes es una cantante y compositora argentina, reconocida por su talento en el ámbito musical. Nació el 14 de diciembre de 1996 en Paraná, Entre Ríos. Su carrera se catapultó a la fama como miembro del grupo musical Rombai, conocido por su fusión de cumbia, pop y reguetón. Emilia se destacó por su voz cautivadora y su presencia escénica.', 100000, 'https://worldmusicba.com/wp-content/uploads/2022/08/contratar-a-emilia-mernes-7.webp', 'Reggueton')
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Cuarteto De Nos', 'Cuarteto de Nos es una banda de rock alternativo y pop rock uruguaya conocida por su estilo innovador y letras inteligentes. Originaria de Montevideo, Uruguay, la banda fue fundada en 1984 por los hermanos Roberto y Ricardo Musso. A lo largo de su carrera, han experimentado con diferentes géneros musicales, desde el rock hasta la música folklórica y el pop.', 240000, 'https://www.mondosonoro.com/wp-content/uploads/2023/06/el-cuarteto-de-nos.jpg', 'Rock')
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Shawn Mendes', 'Cantante y compositor canadiense conocido por su estilo pop contemporáneo.', 15000000,'https://static.independentespanol.com/2022/04/07/19/SHAWN_MENDES_31636.jpg?width=1200', 'Pop');
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Soda Stereo','Soda Stereo fue una influyente banda de rock en español formada en Buenos Aires, Argentina, en 1982. Compuesta por Gustavo Cerati, Zeta Bosio y Charly Alberti, la banda se convirtió en una de las más destacadas del rock latinoamericano. Su música fusiona elementos de rock, new wave y pop, creando un sonido distintivo y vanguardista.', 156000, 'https://indiehoy.com/wp-content/uploads/2020/11/soda-stereo-1985-1200x900.jpg','Rock')
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Eladio Carreon','Eladio Carrion es un reconocido cantante y compositor de música urbana, específicamente dentro del género de reguetón y trap. Nació el 6 de febrero de 1994 en Fajardo, Puerto Rico. Carrion ha ganado prominencia en la escena musical latina por sus colaboraciones con otros artistas destacados y por su estilo versátil.', 130000, 'https://efe.com/wp-content/uploads/2021/12/eladio-carrion.jpg','Trap')
INSERT [dbo].[Artistas] ([Nombre], [Descripcion], [Oyentes], [FotoPerfil], [GeneroMusical]) VALUES ('Abel Pintos','Abel Pintos es un reconocido cantante y compositor argentino, nacido el 11 de mayo de 1984 en Bahía Blanca, Buenos Aires. Es una figura destacada en la escena musical de América Latina, especialmente en el género de la música folklórica y pop.',34000, 'https://storage.lacapitalmdp.com/2022/07/Abel-Pintos-prensa-feb-20225517.jpg','Pop')


--- Albumes --


INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 1, 'Desde El Fin Del Mundo', 18, 57.9, 'FinDelMundo.jpg', 100000, 2021)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 2, 'mp3', 13, 35.5,'MP3.jpg',230000, 2023)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 3, 'Porfiado', 8, 49.2, 'Porfiado.jpg',230000, 2012)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 4,'illuminate', 13, 44.4, 'Illuminate.jpg', 80000, 2017)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 5, 'Cancion Animal', 10, 41,'Cancion Animal.jpg', 100000, 1990)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 6, '3MEN2 KBRN', 18, 54, '3MEN2 KABRON.jpg', 100000, 2023)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 7, 'Sueño Dorado', 12, 44,'Sueño Dorado.jpg', 93000, 2012)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 1, 'Antes De Ameri', 16, 40,'Antes De Ameri.jpg', 13000, 2023)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 1, 'Temporada De Reguetton', 7, 22.14,'Temporada De Reggueton.WEBP', 1320000, 2021)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 2, 'Tu Crees En Mi?', 8, 22,'Tu Crees En Mi.WEBP',960000, 2022)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 3, 'Habla Tu Espejo', 9, 33.2,'Habla Tu Espejo.jpeg',530000, 2015)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 3, 'Lamina Once', 8, 33.56,'Lamina Once.jpg',545000, 2014)

--- Canciones ---


-- Album 1: Desde El Fin Del Mundo
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 'Pintao', 3, '2021-04-21', 5000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 'Chico Estrella', 2.47, '2021-04-21', 7000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 'Malbec', 2.55, '2021-04-21', 9000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 'Sol', 4.03, '2021-04-21', 11000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1004, 'Rapido', 2.1, '2021-04-21', 9000)


-- Album 2: mp3
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, 'GTA.mp3', 2.31, '2023-11-03', 12000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, 'Exclusive.mp3', 2, '2023-11-03', 15000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, '24_Hs.mp3', 2.56, '2023-11-03', 13000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, 'No_Se_Ve.mp3', 4.1, '2023-11-03', 18000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1005, 'A_1000_KM.mp3', 2.35, '2023-11-03', 18000)

-- Album 3: Porfiado
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 'Cuando Sea Grande', 4.09, '2012-04-27', 22000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 'Buen Dia Benito', 3.5, '2012-04-27', 25000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 'Lo Malo De Ser Bueno', 4.02, '2012-04-27', 28000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 'Solo Estoy Sobreviviendo', 4.3, '2012-04-27', 10000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1006, 'Buen Dia Benito', 4.1, '2012-04-27', 100000)

-- Album 4: illuminate
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 'Ruin', 3.9, '2017-04-20', 30000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 'Like This', 3.06, '2017-04-20', 35000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 'No Promises', 2.46, '2017-04-20', 40000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 'Honest', 2.45, '2017-04-20', 65000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1007, 'Patience', 3.4, '2017-04-20', 41200)

-- Album 5: Cancion Animal
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, 'El Septimo DIa', 4.23, '1990-09-09', 45000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, 'Un Milon De Años Luz', 3.09, '1990-09-09', 50000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, 'De Musica Ligera', 4.07, '1990-09-09', 53000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, '1990', 4.3, '1990-09-09', 125000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1008, 'Cae El Sol', 5.1, '1990-09-09', 45000)

-- Album 6: 3MEN2 KBRN
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 'Padre Tiempo', 3.39, '2023-03-17', 60000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 'Coco Chanel', 3.28, '2023-03-17', 65000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 'Si La Calle Llama', 4.1, '2023-03-17', 70000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 'El Hokae', 3.5, '2023-03-17', 120000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1009, 'Mbappe - Remix ', 3.2, '2023-03-17', 900000)

-- Album 7: Sueño Dorado
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 'Quien Pudiera',3.27, '2012-07-01', 75000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 'La LLave	', 4.20, '2012-07-01', 80000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 'No Me Olvides', 3.32, '2012-07-01', 85000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 'Sueño Dorado', 3.4, '2012-07-01', 856000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1010, 'El Beso/ Quisiera', 4.1, '2012-07-01', 123000)

-- Album 8: Antes De Ameri
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 'Dont Lie', 3.8, '2023-08-01', 90000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 'Troya', 4.0, '2023-08-01', 95000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 'uNO dOs', 3.5, '2023-08-01', 100000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 'Jefes Del Sudoeste', 2.4, '2023-08-01', 14000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1011, 'O1 dE ENEro', 3, '2023-08-01', 100000)


-- Album 9: Temporada De Reguetton
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 'MidTown', 23.25, '2021-11-25', 15000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 'En movimiento', 2.5, '2021-11-25', 12000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 'Ley de Atracción', 3, '2021-11-25', 100000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 'YIN YAN', 3.09, '2021-11-25', 14000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1012, 'Unfollow', 3.16, '2021-11-25', 100000)

-- Album 10: Tu Crees En Mi?

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 'Latin Girl',2.46, '2012-07-01', 75000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 'Como Si No Importara', 2.53, '2012-07-02', 80000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 'Cuatro Veinte', 2.13, '2012-07-03', 85000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 'Intoxicao', 2.48, '2012-07-03', 856000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1013, 'Mi Otra Mitad', 2.46, '2012-07-03', 123000)

-- Album 11: Habla Tu Espejo

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 'El Aprendiz', 3.57, '2015-06-03', 22000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 'Como Pasa El Tíempo', 4.21, '2015-06-03', 25000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 'Whisky En Uruguay', 3.09, '2015-06-03', 28000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 'Roberto', 4.09, '2015-06-03', 10000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1014, 'Caminamos', 3.32, '2015-06-03', 100000)

-- Album 12: Lamina Once

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 'Flan', 3.56, '2023-06-08', 22000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 'Frankestein Posmo', 4.07, '2023-06-08', 25000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 'Chivo Expiatorio', 4.48, '2023-06-08', 28000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 'El CInturon Gris', 3.45, '2023-06-08', 10000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1015, 'Rorschach', 3.57, '2023-06-08', 100000)


--- Nuevo Insertar ---

INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 5, 'Wonder', 14, 42,'/img/Imagenes-Albumes/1016.jpg',234000, 2020)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 5, 'Handwritten', 17, 55,'/img/Imagenes-Albumes/1018.webp',11000, 2015)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 6, 'Nada personal', 10, 40,'/img/Imagenes-Albumes/1019.jpeg',120000, 1985)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 6, 'Signos', 8, 36,'/img/Imagenes-Albumes/1020.jpeg',120000, 1986)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 7, 'Sauce Boyz', 16, 51,'/img/Imagenes-Albumes/1021.jpg',530000, 2022)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 7, 'Monarca', 14, 42,'/img/Imagenes-Albumes/1022.jpg',123000, 2022)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 8, '11', 11, 33,'/img/Imagenes-Albumes/1023.jpg',14200, 2016)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 8, 'Único', 16, 64,'/img/Imagenes-Albumes/1024.jpg',19000, 2014)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 2, 'Súper sangre joven', 10, 31.9,'/img/Imagenes-Albumes/1025.jpg',100000, 2019)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 3, 'El Plan', 1, ,'/img/Imagenes-Albumes/1026.jpg',24300, 2012)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 3, 'Bipolar', 9, 36,'/img/Imagenes-Albumes/1027.jpg',20000, 2009)
INSERT [dbo].[Albumes] ([ID_Artista], [Nombre], [CantCanciones], [DuracionTotal], [FotoPortada], [CantReproducciones], [Año]) VALUES ( 5, 'MTV Unplugged', 11, 49,'/img/Imagenes-Albumes/1028.jpg',86300, 2017)



INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, 'Monster', 2.41, '2023-01-23', 8800)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, 'Wonder', 2.36, '2023-01-23', 82000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, 'Intro', 2.56, '2023-01-23', 34000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, '24 Hours', 2.4, '2023-01-23', 21000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1016, 'Higher', 4, '2023-01-23', 52000)


INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 'Air', 3, '2015-06-08', 8800)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 'Crazy', 3.12, '2015-06-08', 82000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 'Strings', 3.45, '2015-06-08', 34000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 'Stitiches', 2.43, '2015-06-08', 21000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1018, 'Aftertaste', 2, '2015-06-08', 52000)


INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 'Si No Fuera Por...', 3.28, '1985-11-15', 10000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 'Estoy Azulado', 5.2, '1985-11-15', 84000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 'Nada Personal', 4.54, '1985-11-15', 33550)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 'Ecos',4.2, '1985-11-15', 112000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1019, 'Danza Rota', 4.2, '1985-11-15', 52000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 'Profugos.', 5.2, '1986-11-10', 170000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 'Persiana Americana', 4.53, '1986-11-10', 13000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 'Signos', 5.16, '1986-11-10', 56550)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 'En Camino',4.3, '1986-11-10', 994000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1020, 'No Existes', 4.3, '1986-11-10', 322000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, 'Hennesy.', 3.05, '2022-01-31', 14200)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, 'Actriz ', 3.05, '2022-01-31', 15000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, 'Hielo', 3.11, '2022-01-31', 56550)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, 'Rapido',5.06, '2022-01-31', 994000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1021, '3 AM', 3.28, '2022-01-31', 322000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, 'Tata.', 2.46, '2022-01-8', 13200)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, '4 AM ', 2.42, '2022-01-8', 16000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, 'Intro', 2.58, '2022-01-8', 100000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, 'Toretto',3.03, '2022-01-8', 44000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1022, 'Adios', 2.41, '2022-01-8', 542000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, 'Alguien', 2.44, '2016-07-07', 14200)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, '3', 4.08, '2016-07-07', 167000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, 'Mariposa', 3.35, '2016-07-07', 1310000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, 'Caceria',3.3, '2016-07-07', 99000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1023, 'Primavera', 3.58, '2016-07-07', 74000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 'Aventura', 3.55, '2014-01-10', 19200)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 'Lo Que Soy', 3.5, '2014-01-10', 10000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 'Ya Estuve Aqui', 3.33, '2014-01-10', 1243000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 'Motivos',3.17, '2014-01-10', 66000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1024, 'Juntos', 3.25, '2014-01-10', 753000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 'Hitboy', 2.58, '2019-11-01', 10200)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 'A Punta De Espada', 3.23, '2019-11-01', 1420000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 'Perdon', 3.39, '2019-11-01', 452000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 'Señorita',2.42, '2019-11-01', 120000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1025, 'Me Gusta Lo Simple', 3.17, '2019-11-01', 730000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1026, 'El Plan', 3.55, '2022-04-20', 120000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 'Bipolar', 4.07, '2009-07-20', 16000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 'Razones', 3.39, '2009-07-20', 1420000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 'Mirenme', 3.29, '2009-07-20', 452000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 'Miguel Gritar',4.07, '2009-07-20', 120000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1027, 'Primavera', 3.33, '2009-07-20', 730000)

INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 'Patience', 3.14, '2017-08-14', 154000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 'Roses', 4.14, '2017-08-14', 176000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 'Ruin', 6.21, '2017-08-14', 78000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 'Stitches',4.24, '2017-08-14', 632000)
INSERT [dbo].[Canciones] ([ID_Album], [Nombre], [Duracion], [FechaPublicacion], [CantReproducciones]) VALUES (1028, 'Mercy', 3.48, '2017-08-14', 730000)


--- Comunidades ---




INSERT [dbo].[Comunidades] ( [ID_Artista], [Nombre], [FotoPerfil]) VALUES (1, 1, N'Comunidad Ejemplo 1', N'perfilcomunidad1.jpg')
INSERT [dbo].[Comunidades] ([ID_Artista], [Nombre], [FotoPerfil]) VALUES (2, 2, N'Comunidad Ejemplo 2', N'perfilcomunidad2.jpg')


--- Mensajes ----
INSERT [dbo].[Mensajes] ([ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (1, 1, 3, N'Mensaje de ejemplo 1', '2022-03-10')
INSERT [dbo].[Mensajes] ([ID_Comunidad], [ID_Usuario], [Contenido], [Fecha]) VALUES (2, 2, 4, N'Mensaje de ejemplo 2', '2022-04-05')
