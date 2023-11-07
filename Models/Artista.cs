using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP11.Models;
public class Artista {
    public int ID_Artista { get; set; }
    public string? Nombre { get; set; }
    public string? Descripcion { get; set; }
    public int Oyentes { get; set; }
    public string? FotoPerfil { get; set; }
}