// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);


};


function VerCanciones(IDA) {
    let Temp = "";

    $.ajax(
        {
            url: '/Home/VerCancionesAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { idA: IDA},
            success: function (response) {
                response.forEach(element => {
                    $("#Nombre").append('<p>' + element.nombre + '</p>');
                    $("#Duracion").append('<p>' + element.duracion + '</p>');
                    $("#Fecha").append('<p>' + element.fechaPublicacion.slice(0, 10) + '</p>');
                    $("#Reproducciones").append('<p>' + element.cantReproducciones + '</p>');
                });
            }
        });
    
    $.ajax(
        {
            url: '/Home/VerDetalleAlbumAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { idA: IDA},
            success: function (response) {
                $("#titulo-album").html(response.nombre);
                $("#imagen-album").attr("src", response.fotoPortada);
            }
        });
}

function VaciarCanciones() {
    $("#Nombre").empty();
    $("#Duracion").empty();
    $("#Fecha").empty();
    $("#Reproducciones").empty();
}

function editarComentario(IDM) {
    $.ajax(
        {
            url: '/Home/EditarComentarioAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { idMensaje: IDM},
            success: function (response) {
                if (response && response.contenido) {
                    $("#contenido-comentario").val(response.contenido);
                    $("#id-comentario").val(response.iD_Mensaje);
                }
            }
        });
}

function eliminarComentario(IDM) {
    $(".comentario .comentario-input[data-id='" + IDM + "']").parent().parent().remove();
    $.ajax(
        {
            url: '/Home/EliminarComentarioAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { idMensaje: IDM},
            success: function (response) {
            }
        });
}

function ModificarComentario() {
    let comentario = $("#contenido-comentario").val();
    let IDM = $("#id-comentario").val();

    let contenidoP = $('div.contenido p[data-id="' + IDM + '"]');
    contenidoP.html(comentario);

    const modal2 = document.querySelector('.modal2');
    modal2.classList.remove('modal--show');

    $.ajax(
        {
            url: '/Home/ModificarComentarioAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { idMensaje: IDM, contenido: comentario},
            success: function (response) {
            }
        });
}

// Alertas

const contenedorBotones = $('.contenedor-botones');
const contenedorToast = document.getElementById('contenedor-toast');

// Event listener para detectar click en los botones
function designarToast(tipo, title, desc){

	if (tipo === 'exito') {
		agregarToast({ tipo: 'exito', titulo: title, descripcion: desc, autoCierre: true });
	}
	if (tipo === 'error') {
		agregarToast({ tipo: 'error', titulo: title, descripcion: desc, autoCierre: true });
	}
	if (tipo === 'info') {
		agregarToast({ tipo: 'info', titulo: 'Info', descripcion: 'Esta es una notificación de información.' });
	}
	if (tipo === 'warning') {
		agregarToast({ tipo: 'warning', titulo: 'Warning', descripcion: 'Ten cuidado' });
	}
};

// Event listener para detectar click en los toasts
contenedorToast.addEventListener('click', (e) => {
	const toastId = e.target.closest('div.toast').id;

	if (e.target.closest('button.btn-cerrar')) {
		cerrarToast(toastId);
	}
});

// Función para cerrar el toast
const cerrarToast = (id) => {
	document.getElementById(id)?.classList.add('cerrando');
};

// Función para agregar la clase de cerrando al toast.
const agregarToast = ({ tipo, titulo, descripcion, autoCierre }) => {
	// Crear el nuevo toast
	const nuevoToast = document.createElement('div');

	// Agregar clases correspondientes
	nuevoToast.classList.add('toast');
	nuevoToast.classList.add(tipo);
	if (autoCierre) nuevoToast.classList.add('autoCierre');

	// Agregar id del toast
	const numeroAlAzar = Math.floor(Math.random() * 100);
	const fecha = Date.now();
	const toastId = fecha + numeroAlAzar;
	nuevoToast.id = toastId;

	// Iconos
	const iconos = {
		exito: `<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
					<path
						d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"
					/>
				</svg>`,
		error: `<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
								<path
									d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
								/>
							</svg>`,
		info: `<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
								<path
									d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"
								/>
							</svg>`,
		warning: `<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
								<path
									d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
								/>
							</svg>`,
	};

	// Plantilla del toast
	const toast = `
		<div class="contenido">
			<div class="icono">
				${iconos[tipo]}
			</div>
			<div class="texto">
				<p class="titulo">${titulo}</p>
				<p class="descripcion">${descripcion}</p>
			</div>
		</div>
		<button class="btn-cerrar">
			<div class="icono">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
					<path
						d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
					/>
				</svg>
			</div>
		</button>
	`;

	// Agregar la plantilla al nuevo toast
	nuevoToast.innerHTML = toast;

    nuevoToast.style.display = "flex";

	// Agregamos el nuevo toast al contenedor
	contenedorToast.appendChild(nuevoToast);

	// Función para menajera el cierre del toast
	const handleAnimacionCierre = (e) => {
		if (e.animationName === 'cierre') {
			nuevoToast.removeEventListener('animationend', handleAnimacionCierre);
			nuevoToast.remove();
		}
	};

	if (autoCierre) {
		setTimeout(() => cerrarToast(toastId), 5000);
	}

	// Agregamos event listener para detectar cuando termine la animación
	nuevoToast.addEventListener('animationend', handleAnimacionCierre);
};

let ListaUsuarios = [];

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


// Manejo de archivos en javascript

function handleFile(idU) {
    const fileInput = document.getElementById('fileInput');
    const selectedFile = fileInput.files[0];
    let existe = false;
    let uname = $('#campo-usuario').val();
    let mail = $('#campo-email').val();

    const formData = new FormData();
    formData.append('idUsuario', idU);

    const userInicial = localStorage.getItem('username');

    if(userInicial != uname){
        for (let i = 0; i < ListaUsuarios.length; i++) {
            if (ListaUsuarios[i].username.toLowerCase() == uname) {
                designarToast('error', 'Error!', 'El usuario ya existe.')
                return;
            }
        }
    }

    if(uname){
        formData.append('username', uname);
    }

    if (mail) {
        formData.append('email', mail);
    }

    if (selectedFile) {
        const reader = new FileReader();

        reader.onload = function () {
            processFile(reader.result, idU, formData);
        };

        reader.readAsArrayBuffer(selectedFile);
    } else {
        // No hay archivo seleccionado, solo actualizar datos de texto
        updateProfile(formData);
        designarToast('exito', 'Perfil editado!', 'Tu perfil se editó con exito!');
        $('.span-title').html(uname);
        $('.span-subtitle').html(mail);
        const modal3 = document.querySelector('.modal3');
        modal3.classList.remove('modal--show');
    }
}

function processFile(fileArrayBuffer, idU, formData) {
    const fileBlob = new Blob([fileArrayBuffer]);
    formData.append('archivo', fileBlob);
    designarToast('exito', 'Perfil editado!', 'Tu perfil se editó con exito!');
    $('.perfil__profile_picture').attr('src', '/img/Imagenes-Usuarios/' + idU + '.jpg');
    const modal3 = document.querySelector('.modal3');
    modal3.classList.remove('modal--show');
    updateProfile(formData);
}

function updateProfile(formData) {
    $.ajax({
        url: '/Home/EditarPerfilAjax',
        type: 'POST',
        processData: false,
        contentType: false,
        data: formData,
        success: function (response) {
        }
    });
}