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
            ViewBag.Error = "Ocurrió un error. Fijate que hayas ingresado correctamente tus datos.";
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
        return View();
    }

    public IActionResult Comunidades(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        ViewBag.TodasComunidades = BD.ObtenerTodasComunidades();
        ViewBag.ComunidadesPertenecientes = BD.ObtenerComunidadesPertenecientes(id);
        return View();
    }

    public IActionResult Perfil(int id) {
        Usuario usuario = BD.ObtenerUsuarioByID(id);
        ViewBag.Usuario = usuario;
        return View();
    }

    public IActionResult Index() {
        return View();
    }

    public IActionResult Olvide(int idUsuario) {
        ViewBag.idUser = idUsuario;
        if(ViewBag.idUser != -1){
            ViewBag.Usuario = BD.ObtenerUsuarioByID(idUsuario);
            ViewBag.PreguntaRecu = BD.ObtenerPreguntaDeRecuperacion(ViewBag.Usuario.ID_Pregunta);
        }
        return View();
    }


    [HttpPost]
    public IActionResult VerificarExsistenciaUsuario(string username) {
        Usuario user = BD.ObtenerUsuarioByUser(username);
        if(user != null){
            return RedirectToAction("Olvide", new {idUsuario = user.ID_Usuario});
        }else {
            return RedirectToAction("Olvide", new {idUsuario = -1});
        }
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
}