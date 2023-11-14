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