using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP11.Models;
public class Mensaje {
    public int ID_Mensaje { get; set; }
    public int ID_Comunidad { get; set; }
    public int ID_Usuario { get; set; }
    public string? Contenido { get; set; }
    public DateTime Fecha { get; set; }
}