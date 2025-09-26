document.getElementById("formProducto").addEventListener("submit", function(e) {
    let codigo = document.getElementById("codigo").value.trim();
    let nombre = document.getElementById("nombre").value.trim();
    let precio = document.getElementById("precio").value.trim();
    let descripcion = document.getElementById("descripcion").value.trim();
    let materiales = document.querySelectorAll("input[name='materiales[]']:checked");

    // Validaciones rápidas
    if (codigo === "") {
        alert("El código del producto no puede estar en blanco.");
        e.preventDefault();
        return;
    }
    if (!/^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,15}$/.test(codigo)) {
        alert("El código debe contener letras y números (5-15 caracteres).");
        e.preventDefault();
        return;
    }

    if (nombre.length < 2 || nombre.length > 50) {
        alert("El nombre debe tener entre 2 y 50 caracteres.");
        e.preventDefault();
        return;
    }

    if (!/^[0-9]+(\.[0-9]{1,2})?$/.test(precio)) {
        alert("El precio debe ser un número positivo con hasta dos decimales.");
        e.preventDefault();
        return;
    }

    if (materiales.length < 2) {
        alert("Debe seleccionar al menos dos materiales.");
        e.preventDefault();
        return;
    }

    if (descripcion.length < 10 || descripcion.length > 1000) {
        alert("La descripción debe tener entre 10 y 1000 caracteres.");
        e.preventDefault();
        return;
    }
});
