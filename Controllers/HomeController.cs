using Microsoft.AspNetCore.Mvc;
using TP11.Models;

namespace TP11.Controllers;

public class HomeController : Controller
{
    [HttpPost]
    public IActionResult VerificarLogin(string user, string password) {
        Usuario Usuario = BD.Login(user, password);
        if (Usuario != null) {
            ViewBag.Usuario = Usuario;
            return RedirectToAction("Comunidades", new { usuario = Usuario });
        } else {
            ViewBag.Usuario = Usuario;
            ViewBag.Error = "Ocurrió un error. Fijate que hayas ingresado correctamente tus datos.";
            return View("Login");
        }
    }

    public IActionResult Registro() {
        return View();
    }

    [HttpPost]
    public IActionResult Comunidad() {
        return View();
    }

    public IActionResult Comunidades(Usuario usuario) {
        ViewBag.TodasComunidades = BD.ObtenerTodasComunidades();
        ViewBag.ComunidadesPertenecientes = BD.ObtenerComunidadesPertenecientes(usuario.ID_Usuario);
        return View();
    }

    public IActionResult Perfil() {
        return View();
    }

    public IActionResult Index() {
        return View();
    }

    [HttpPost]
    public IActionResult RegistrarUsuario(string usuario, string contraseña, string email) {
        BD.RegistrarUsuario(usuario, contraseña, email);
        return RedirectToAction("Comunidades", new { usuario = usuario });
    }

    public IActionResult Olvide(int IDUsuario) {
        ViewBag.idUser = IDUsuario;
        return View();
    }

    [HttpPost]
    public IActionResult VerificarExsistenciaUsuario(int idUsuario) {
        Usuario user = BD.ObtenerUsuario(idUsuario);
        if(user != null){
            return RedirectToAction("Olvide", new {IDUsuario = user});
        }else {
            return RedirectToAction("Olvide", new {IDUsuario = -1});
        }
    }

    public IActionResult Login() {
        return View();
    }
    public IActionResult Explorar() {
        return View();
    }
}