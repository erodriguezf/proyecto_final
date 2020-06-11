// Clase para manejar los productos
class Producto {
  String categoria;
  String nombre;
  int precio;
  int cantidad;

  Producto({this.categoria, this.nombre, this.precio, this.cantidad});
}

// Lista de productos del usuario que necesita que se le realice el pedido.
class Lista {
  String nombreCreador; // Persona a la que pertenece el pedido
  List<Producto> productos;
  int valorTotal;
  String mandadero; //Correo de la persona que va a realizar el pedido

  Lista({this.nombreCreador, this.productos, this.valorTotal, this.mandadero});

  Lista.fromJson(Map<String, dynamic> json)
  : nombreCreador = json['nombreCreador'],
    productos = json['productos'],
    valorTotal = json['valorTotal'],
    mandadero = json['mandadero'];
}
