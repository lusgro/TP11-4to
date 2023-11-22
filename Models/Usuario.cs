using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP11.Models;
public class Usuario {
    public int ID_Usuario { get; set; }
    public string Username { get; set; }
    public string Contraseña { get; set; }
    public string Email { get; set; }
    private string? _fotoPerfil = "/img/Perfil.png";
    public string? FotoPerfil 
    { 
        get { return _fotoPerfil; } 
        set { _fotoPerfil = null ?? "/img/Perfil.png"; } 
    }
    public int ID_Pregunta { get; set; }
    public string RespuestaSeguridad { get; set; }
}