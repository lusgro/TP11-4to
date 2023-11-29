function verificarRegistro() {
    let devolver = false;
    const contraseñaInput = document.getElementById("contraseñaInput");
    const contraseñaInput2 = document.getElementById("contraseñaInput2");
    const username = $('usuarioInput').val();
    const listaUsuarios = $('listaUsuarios').attr("data-info");

    console.log(listaUsuarios);

    const valor1 = contraseñaInput.value;
    const valor2 = contraseñaInput2.value;
    if (valor1 == valor2) {
        devolver = true;
    }
    else {
        designarToast('error', 'Error!', 'Las contraseñas no coinciden.');
        devolver = false;
    }
    // if () {
    //     designarToast('error', 'Error!', 'El usuario ya esta en uso.');
    //     devolver = false;
    // }
    // else{
    //     devolver = true;
    // }
    return devolver;
}