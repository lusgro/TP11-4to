function VerificarExistenciaDeUsuario(user)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/VerificarExsistenciaUser',
            data: { username: $(user).val() },
            success:
                function (preguntar)
                {
                    console.log("exito");
                    $("#NombreSerie").html("Serie "+title);
                    let listActores = "";
                    for (let index = 0; index < actores.length; index++) {
                        listActores += actores[index].nombre + " "; 
                    }
                    console.log(listActores);
                    $("#img-resp").attr("src",img);
                    $("#informacion").html("Actores: "+ listActores);
                }
    });
}