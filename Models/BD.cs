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
        string query = "INSERT INTO Usuarios (username, password, nombre, apellido, email, preguntaSeguridad) VALUES (@Username, @Password, @Nombre, @Apellido, @Email, @PreguntaSeguridad)";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(query, usuario);
        }
    }

    public static string RecuperarContraseña(string email, string preguntaSeguridad)
    {
        string query = "SELECT password FROM Usuarios WHERE email = @Mail AND preguntaSeguridad = @PreguntaSeguridad";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<string>(query, new { Mail = email, PreguntaSeguridad = preguntaSeguridad });
        }
    }
}