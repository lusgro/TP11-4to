const albumButtons = document.querySelectorAll('.album');
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal__close');

albumButtons.forEach(function (button) {
    button.addEventListener('click', function (e) {
        e.preventDefault();
        modal.classList.add('modal--show');
    });
});

closeModal.addEventListener('click', (e)=>{
    e.preventDefault();
    modal.classList.remove('modal--show');
});


// Modal 2

const comentariosButtons = document.querySelectorAll('.boton-comentario');
const modal2 = document.querySelector('.modal2');
const closeModal2 = document.querySelector('.modal__close2');

comentariosButtons.forEach(function (button) {
    button.addEventListener('click', function (e) {
        e.preventDefault();
        modal2.classList.add('modal--show');
    });
});

closeModal2.addEventListener('click', (e)=>{
    e.preventDefault();
    modal2.classList.remove('modal--show');
});