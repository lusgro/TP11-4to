namespace TP11.Models;
using Dapper;
using System.Data.SqlClient;

public static class BD
{
    private static string _connectionString { get; set; } = @"Server=localhost;DataBase=tp11;Trusted_Connection=True;";

    public static Usuario Login(string usuario, string password)
    {
        string query = "SELECT * FROM Usuarios WHERE username = @Usuario AND password = @Password";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(query, new { Usuario = usuario, Password = password });
        }
    }

    public static void RegistrarUsuario(Usuario usuario)
    {
        string query = "INSERT INTO Usuarios (username, password, email) VALUES (@Username, @Password, @Email)";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(query, usuario);
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