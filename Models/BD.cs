using Dapper;
using System.Data.SqlClient;

namespace TP11.Models;

public static class BD
{
    private static string _connectionString { get; set; } = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";

    public static Usuario Login(string usuario, string password)
    {
        string query = "SELECT * FROM Usuarios WHERE Username = @Usuario AND Contraseña = @Password";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(query, new { Usuario = usuario, Password = password });
        }
    }

    public static void RegistrarUsuario(string usuario, string password, string email)
    {
        string query = "INSERT INTO Usuarios (Username, Contraseña, Email) VALUES (@Username, @Contraseña, @Email)";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(query, new { Username = usuario, Contraseña = password, Email = email } );
        }
    }

    public static List<Artista> ObtenerArtistas()
    {
        string query = "SELECT * FROM Artistas";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Artista>(query).ToList();
        }
    }
}