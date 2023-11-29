using Microsoft.AspNetCore.Mvc;
using TP11.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace TP11.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Enviroment;

    public HomeController(IWebHostEnvironment enviroment){
        Enviroment = enviroment;
    }

    [HttpPost]
    public IActionResult VerificarLogin(string user, string password) {
        Usuario usuario = BD.Login(user, password);
        if (usuario != null) {
            return RedirectToAction("Comunidades", new { id = usuario.ID_Usuario });
        } else {
            ViewBag.Usuario = usuario;
            ViewBag.Error = "Ocurrió un error.";
            ViewBag.Error2 = "Fijate que hayas ingresado correctamente tus datos.";
            return View("Login");
        }
    }

    public IActionResult Registro() {
        ViewBag.PreguntasDeRecuperacion = BD.ObtenerPreguntasDeRecuperacion();
        return View();
    }

    public IActionResult Comunidad(int id, int idComunidad) {
        ViewBag.Usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Comunidad = BD.ObtenerComunidad(idComunidad);
        ViewBag.Comentarios = BD.ObtenerMensajesComunidad(idComunidad);
        ViewBag.UsuariosComentarios = BD.ObtenerUsuariosComentarios(idComunidad);
        ViewBag.Albumes = BD.ObtenerAlbumes(ViewBag.Comunidad.ID_Artista);
        ViewBag.Conexion = BD.ObtenerUsuarioXComunidad(id, idComunidad);
        return View();
    }

    public IActionResult Comunidades(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        List<Comunidad> TodasComunidades = BD.ObtenerTodasComunidades();
        ViewBag.ComunidadesPertenecientes = BD.ObtenerComunidadesPertenecientes(id);
        Dictionary<int, int> UsuariosXComunidad = BD.ObtenerUsuariosXComunidad();
        ViewBag.TodasComunidades = TodasComunidades
        .OrderByDescending(c => UsuariosXComunidad.ContainsKey(c.ID_Comunidad) ? UsuariosXComunidad[c.ID_Comunidad] : 0)
        .ToList();
        ViewBag.ComunidadesPopulares = BD.ObtenerComunidadesPopulares();
        return View();
    }

    public IActionResult Perfil(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        ViewBag.ComunidadesPertenecientes = BD.ObtenerComunidadesPertenecientes(id);
        ViewBag.Mensajes = BD.ObtenerMensajesDeUser(id);
        return View();
    }

    public IActionResult Index() {
        return View();
    }


    public IActionResult OlvideMiContra(int idUsuario) {
        ViewBag.idUser = idUsuario;
        if(ViewBag.idUser != -1){
            ViewBag.Usuario = BD.ObtenerUsuarioByID(idUsuario);
            ViewBag.PreguntaRecu = BD.ObtenerPreguntaDeRecuperacion(ViewBag.Usuario.ID_Pregunta);
        }
        return View("Olvide");
    }


    [HttpPost]
    public IActionResult PreguntaDeRecuperacion(string username) {
        Usuario user = BD.ObtenerUsuarioByUser(username);
        if(user != null){
            ViewBag.idUser = user.ID_Usuario;
            ViewBag.Usuario = BD.ObtenerUsuarioByID(user.ID_Usuario);
            ViewBag.PreguntaRecu = BD.ObtenerPreguntaDeRecuperacion(user.ID_Pregunta);
            return View();
        }else {
            return RedirectToAction("OlvideMiContra", new {idUsuario = -1});
        }
    }

    [HttpPost]
    public IActionResult CambiarContra(int id) {
        ViewBag.id = id;
        return View();
    }

    [HttpPost]
    public IActionResult ActualizacionDeContra(int id, string newPass){
        BD.CambiarContraseña(id, newPass);
        return RedirectToAction("Login");
    }

    public string VerificarRespuestaRecuperacion(int id, string content) {
        return BD.ObtenerUsuarioByID(id).RespuestaSeguridad;
    }

    [HttpPost]
    public IActionResult RegistrarUsuario(string usuario, string contraseña, string email, int preguntaRecuperacion, string respuestaPregunta) {
        BD.RegistrarUsuario(usuario, contraseña, email, preguntaRecuperacion, respuestaPregunta);
        Usuario user = BD.ObtenerUsuarioByUser(usuario);
        return RedirectToAction("Comunidades", new { id = user.ID_Usuario });
    }

    public IActionResult Login() {
        return View();
    }
    
    public IActionResult Explorar(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        ViewBag.Comunidades = BD.ObtenerTodasComunidades();
        return View();
    }
    public IActionResult PublicarMensaje(int id, int idComunidad, string contenido) {
        BD.InsertarMensaje(id, idComunidad, contenido);
        return RedirectToAction("Comunidad", new { id = id, idComunidad = idComunidad});;
    }

    [HttpPost]
    public List<Cancion> VerCancionesAjax(int idA) {
        ViewBag.Canciones = BD.ObtenerCanciones(idA);
        return ViewBag.Canciones;
    }

    [HttpPost]
    public Album VerDetalleAlbumAjax(int idA) {
        ViewBag.Album = BD.ObtenerAlbum(idA);
        return ViewBag.Album;
    }

    public Mensaje EditarComentarioAjax(int idMensaje) {
        ViewBag.Mensaje = BD.ObtenerMensaje(idMensaje);
        return ViewBag.Mensaje;
    }

    public void EliminarComentarioAjax(int idMensaje) {
        BD.EliminarMensaje(idMensaje);
    }

    public void ModificarComentarioAjax(int idMensaje, string contenido) {
        BD.EditarMensaje(idMensaje, contenido);
    }

    public IActionResult SalirDeComunidad(int idUsuario, int idComunidad){
        BD.SalirComunidad(idUsuario, idComunidad);
        return RedirectToAction("Comunidades", new { id = idUsuario });
    }

    public IActionResult UnirseAComunidad(int idUsuario, int idComunidad){
        BD.UnirseComunidad(idUsuario, idComunidad);
        return RedirectToAction("Comunidades", new { id = idUsuario });
    }

    public void EditarPerfilAjax(int idUsuario, string email, IFormFile archivo, string username){
        string ruta= "";
        if(archivo.Length>0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"/wwwroot/img/Imagenes-Usuarios/" + idUsuario + ".jpg";
            ruta = @"/img/Imagenes-Usuarios/" + idUsuario + ".jpg";
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                archivo.CopyToAsync(stream);
            }
        }
        BD.EditarPerfil(idUsuario, email, ruta, username);
    }

    public List<Usuario> ObtenerUsuariosAjax(){
        ViewBag.Usuarios = BD.ObtenerUsuarios();
        return ViewBag.Usuarios;
    }
}