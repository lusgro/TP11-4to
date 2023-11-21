function VerificarExistenciaDeUsuario(name)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/getActores',
            data: { IdSerie: IdS },
            success:
                function (actores)
                {
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