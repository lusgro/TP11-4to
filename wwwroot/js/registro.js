function verificarPassword() {
    const contraseñaInput = document.getElementById("contraseñaInput");
    const contraseñaInput2 = document.getElementById("contraseñaInput2");
    const valor1 = contraseñaInput.value;
    const valor2 = contraseñaInput2.value;
    console.log("hola");
    console.log(valor1);
    console.log(valor2);
    if (valor1 == valor2) {
        return true;
    }
    else {
        console.log("hola")
        designarToast('error', 'Error!', 'Las contraseñas no coinciden.');
        return false;
    }
}