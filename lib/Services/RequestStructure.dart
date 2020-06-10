class UsuarioInfo {
  final String email;
  final String nombreDeUsuario;
  final String name;
  final String city;
  final String age;
  List<PedidoInfo> pedidos;
  List<AmigoInfo> amigos;

  UsuarioInfo(
      {this.email,
      this.nombreDeUsuario,
      this.name,
      this.city,
      this.age,
      this.pedidos,
      this.amigos});

  factory UsuarioInfo.fromJson(Map<String, dynamic> json) {
    return UsuarioInfo(
      email: json['email'],
      nombreDeUsuario: json['Nombre de Usuario'],
      name: json['nombre'],
      city: json['ciudad'],
      age: json['edad'],
      pedidos: json['pedidos'],
      amigos: json['amigos'],
  
    );
  }
}

class AmigoInfo {
  final String email;
  final String nombre;
  AmigoInfo({this.email, this.nombre});

  factory AmigoInfo.fromJson(Map<String, dynamic> json) {
    return AmigoInfo(
      email: json['email'],
      nombre: json['nombre'],
    );
  }
}

class PedidoInfo {
  final String articulo;
  final String cantidad;
  final String precio;

  PedidoInfo({this.articulo, this.cantidad, this.precio});

  factory PedidoInfo.fromJson(Map<String, dynamic> json) {
    return PedidoInfo(
      articulo: json['articulo'],
      cantidad: json['cantidad'],
      precio: json['precio'],
    );
  }
}
