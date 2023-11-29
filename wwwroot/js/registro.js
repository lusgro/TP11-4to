let ListaUsuarios = []; // Variable global para almacenar los usuarios

document.addEventListener("DOMContentLoaded", function() {
    $.ajax({
        url: '/Home/ObtenerUsuariosAjax',
            type: 'POST',
            dataType: 'JSON',
            data: 'none',
            success: function (response) {
                ListaUsuarios = response;
            },
  });
});

function verificarRegistro() {
    const usuario = verificarUsuario(ListaUsuarios);
    const email = verificarEmail(ListaUsuarios);
    const password = verificarPassword();
    const error = document.getElementById("4");
    if (usuario && email && password) {
        return true;
    }
    else {
        if (!usuario) {
            error.innerHTML = "El usuario ya existe";
            return false;
        }
        if (!email) {
            error.innerHTML = "El email ya existe";
            return false;
        }
        if (!password) {
            error.innerHTML = "Las contraseñas no coinciden";
            return false;
        }
    }
}

function verificarUsuario(usuarios) {
    const usuarioInput = document.getElementById("usuarioInput");
    const valor = usuarioInput.value.toLowerCase();
    for (let i = 0; i < usuarios.length; i++) {
        if (usuarios[i].username.toLowerCase() == valor) {
            return false;
        }
    }
    return true;
}

function verificarEmail(usuarios) {
    const emailInput = document.getElementById("emailInput");
    const valor = emailInput.value;
    for (let i = 0; i < usuarios.length; i++) {
        if (usuarios[i].email == valor) {
            return false;
        }
    }
    return true;
}

function verificarPassword() {
    const contraseñaInput = document.getElementById("contraseñaInput");
    const contraseñaInput2 = document.getElementById("contraseñaInput2")
    const valor1 = contraseñaInput.value;
    const valor2 = contraseñaInput2.value;
    if (valor1 == valor2) {
        return true
    }
    else {
        return false
    }
}