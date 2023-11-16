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
    public string? FotoPerfil { get; set; } = "~/img/perfilDefault.png";
    public string PreguntaSeguridad { get; set; }
}