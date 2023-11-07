using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP11.Models;
public class Album {
    public int ID_Album { get; set; }
    public int ID_Artista { get; set; }
    public string? Nombre { get; set; }
    public int CantCanciones { get; set; }
    public float DuracionTotal { get; set; }
    public string? FotoPortada { get; set; }
    public int CantReproducciones { get; set; }
}