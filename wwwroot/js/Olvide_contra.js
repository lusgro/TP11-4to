function getResponse(id, res)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/VerificarRespuestaRecuperacion',
            data: { id_User: id, res_User:res},
            success:
                function (response)
                {
                    return response;
                }
    });
}


function VerificarRespuestaDeRecu(id, res) {
    user_id = document.getElementById(id).value;
    user_response = document.getElementById(res).value;
    console.log(user_response);
    if(getResponse(user_id, user_response).toLowerCase() == user_response.toLowerCase()){
        console.log(true);
        return true;
    }else{
        console.log(false);
        return false;
    }
}


