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