using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP11.Models;
public class Cancion {
    public int ID_Cancion { get; set; }
    public int ID_Disco { get; set; }
    public string? Nombre { get; set; }
    public float Duracion { get; set; }
    public DateTime FechaPublicacion { get; set; }
    public int CantReproducciones { get; set; }
}