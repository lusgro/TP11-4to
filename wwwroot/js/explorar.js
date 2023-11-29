const searchInput = document.getElementById("buscador_comunidades");
const contenedorLista = document.getElementById('lista-comunidad');

searchInput.addEventListener("input", function () {
  const searchText = searchInput.value.toLowerCase();
  
  const listaComunidades = document.getElementsByClassName("lista_comunidad");
  let comunidadesCoincidentes = [];

  for (let i = 0; i < listaComunidades.length; i++) {
    const item = listaComunidades[i];
    const searchData = item.getAttribute("data-search").toLowerCase();

    if (searchData.includes(searchText)) {
      item.style.display = "block";
      comunidadesCoincidentes.push(item);
    } else {
      item.style.display = "none";
    }
  }

  if (comunidadesCoincidentes.length > 0) {
    contenedorLista.style.display = 'block';
  } else {
    contenedorLista.style.display = 'none';
  }

  if (searchText.length === 0) {
    contenedorLista.style.display = 'none';
  } else {
    contenedorLista.style.display = comunidadesCoincidentes.length > 0 ? 'block' : 'none';
  }
});