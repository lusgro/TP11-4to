using Microsoft.AspNetCore.Mvc;
using TP11.Models;

namespace TP11.Controllers;

public class HomeController : Controller
{
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
        return View();
    }

    public IActionResult Perfil(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        ViewBag.ComunidadesPertenecientes = BD.ObtenerComunidadesPertenecientes(id);
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
    public IActionResult RegistrarUsuario(string usuario, string contraseña, string email) {
        BD.RegistrarUsuario(usuario, contraseña, email);
        return RedirectToAction("Comunidades", new { usuario = usuario });
    }

    public IActionResult Login() {
        return View();
    }
    
    public IActionResult Explorar(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
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

    public IActionResult UnirserAComunidad(int idUsuario, int idComunidad){
        BD.UnirseComunidad(idUsuario, idComunidad);
        return RedirectToAction("Comunidades", new { id = idUsuario });
    }
}