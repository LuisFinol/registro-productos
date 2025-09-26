<?php
$host = "localhost";
$user = "root"; // usuario por defecto de XAMPP
$pass = "";
$dbname = "productosdb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Recibir datos
$codigo = $_POST['codigo'];
$nombre = $_POST['nombre'];
$bodega = $_POST['bodega'];
$sucursal = $_POST['sucursal'];
$moneda = $_POST['moneda'];
$precio = $_POST['precio'];
$materiales = implode(",", $_POST['materiales']);
$descripcion = $_POST['descripcion'];

// Verificar unicidad de código
$check = $conn->query("SELECT id FROM productos WHERE codigo='$codigo'");
if ($check->num_rows > 0) {
    die("El código del producto ya está registrado.");
}

// Insertar
$sql = "INSERT INTO productos (codigo, nombre, bodega_id, sucursal_id, moneda_id, precio, materiales, descripcion)
        VALUES ('$codigo', '$nombre', '$bodega', '$sucursal', '$moneda', '$precio', '$materiales', '$descripcion')";

if ($conn->query($sql) === TRUE) {
    echo "Producto guardado correctamente.";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
