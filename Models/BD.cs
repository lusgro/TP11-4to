using Dapper;
using System.Data.SqlClient;

namespace TP11.Models;

public static class BD
{
    private static string _connectionString { get; set; } = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";

    public static Usuario Login(string usuario, string password)
    {
        string sp = "sp_login";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(sp, new { pUsuario = usuario, pContraseña = password },
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static void RegistrarUsuario(string usuario, string password, string email)
    {
        string sp = "sp_registroUsuario";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sp, new { pUsuario = usuario, pContraseña = password, pEmail = email },
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static List<Comunidad> ObtenerComunidades()
    {
        string sp = "sp_obtenerTodasComunidades";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Comunidad>(sp ,
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
    }

    public static Comunidad ObtenerComunidad(int id)
    {
        string sp = "sp_obtenerComunidad";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Comunidad>(sp, new { pIDComunidad = id },
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static Usuario ObtenerUsuario(int id)
    {
        string sp = "sp_obtenerPerfil";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(sp, new { pIDUsuario = id },
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
