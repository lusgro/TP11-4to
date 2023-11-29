function verificarRegistro() {
    let devolver = false;
    const contraseñaInput = document.getElementById("contraseñaInput");
    const contraseñaInput2 = document.getElementById("contraseñaInput2");
    const username = $('usuarioInput').val();
    const listaUsuarios = "";

    $.ajax(
        {
            url: '/Home/ObtenerUsuariosAjax',
            type: 'POST',
            dataType: 'JSON',
            data: 'none',
            success: function (response) {
                listaUsuarios = response;
            }
        });

    const valor1 = contraseñaInput.value;
    const valor2 = contraseñaInput2.value;
    if (valor1 == valor2) {
        devolver = true;
    }
    else {
        designarToast('error', 'Error!', 'Las contraseñas no coinciden.');
        devolver = false;
    }

    console.log(listaUsuarios)

    const usuarioEncontrado = listaUsuarios.find(item => item.Username === username);

    if (usuarioEncontrado) {
        designarToast('error', 'Error!', 'El usuario ya está en uso.');
        devolver = false;
    }
    else{
        console.log('hola');
    }

    console.log(devolver)

    return false;
}