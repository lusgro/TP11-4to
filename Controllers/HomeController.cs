﻿using Microsoft.AspNetCore.Mvc;
using TP11.Models;

namespace TP11.Controllers;

public class HomeController : Controller
{
    [HttpPost]
    public IActionResult VerificarLogin(string user, string password) {
        Usuario usuario = BD.Login(user, password);
        if (usuario != null) {
            ViewBag.Usuario = usuario;
            return View("Bienvenido");
        } else {
            ViewBag.Usuario = usuario;
            return View("Bienvenido");
        }
    }

    public IActionResult Registro() {
        return View();
    }



    public IActionResult Index() {
        return View();
    }

    [HttpPost]
    public IActionResult RegistrarUsuario(Usuario usuario) {
        BD.RegistrarUsuario(usuario);
        return RedirectToAction("Bienvenido", new { user = usuario });
    }

    public IActionResult Olvide() {
        return View();
    }
}