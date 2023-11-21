using Dapper;
using System.Data.SqlClient;

namespace TP11.Models;

public static class BD
{
    private static string _connectionString { get; set; } = @"Server=localhost\SQLEXPRESS;DataBase=BD_TP11;Trusted_Connection=True;";

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

    public static string ObtenerRespuestaSeguridad(int id)
    {
        string sp = "sp_ObtenerRespuestaSeguridad";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<string>(sp, new { pIDUsuario = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static void CambiarContraseña(int id, string contraseña)
    {
        string sp = "sp_CambiarContraseña";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sp, new { pIDUsuario = id, pContraseña = contraseña },
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static List<Comunidad> ObtenerComunidadesPertenecientes(int id)
    {
        string sp = "sp_listarComunidadesPertenecientes";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Comunidad>(sp, new { pIDUsuario = id },
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Comunidad> ObtenerTodasComunidades()
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

    public static List<Mensaje> ObtenerMensajesComunidad(int id)
    {
        string sp = "sp_obtenerMensajesComunidad";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Mensaje>(sp, new { pIDComunidad = id },
            commandType: System.Data.CommandType.StoredProcedure).ToList();
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

    public static Usuario ObtenerUsuarioByID(int id)
    {
        string sp = "sp_obtenerUsuarioByID";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(sp, new { pIDUsuario = id },
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static Usuario ObtenerUsuarioByUser(string name)
    {
        string sp = "sp_usuarioByUsername";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.QueryFirstOrDefault<Usuario>(sp, new { pUsername = name },
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static List<Mensaje> ObtenerMensajesDeUser(int id)
    {
        string sp = "sp_obtenerMensajesDeUser";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Mensaje>(sp, new { pIDUsuario = id },
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
    }
    public static void InsertarMensaje(int id, int idcomu, string contenido)
    {
        string sp = "sp_publicarMensaje";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sp, new { pIDComunidad = idcomu, pIDUsuario = id, pContenido = contenido},
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static void EditarMensaje(int idMensaje, string contenido)
    {
        string sp = "sp_editarMensaje";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sp, new { pIDMensaje = idMensaje, pContenido = contenido},
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static void EliminarMensaje(int idMensaje)
    {
        string sp = "sp_editarMensaje";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sp, new { pIDMensaje = idMensaje},
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
