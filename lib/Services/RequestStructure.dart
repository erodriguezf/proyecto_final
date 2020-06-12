class UsuarioInfo {
  final String email;
  final String nombreDeUsuario;
  final String name;
  final String city;
  final String age;
 // List<PedidoInfo> pedidos;
  List<AmigoInfo> amigos;

  UsuarioInfo(
      {this.email,
      this.nombreDeUsuario,
      this.name,
      this.city,
      this.age,
    //  this.pedidos,
      this.amigos});

  factory UsuarioInfo.fromJson(Map<String, dynamic> json) {
    return UsuarioInfo(
      email: json['email'],
      nombreDeUsuario: json['Nombre de Usuario'],
      name: json['nombre'],
      city: json['ciudad'],
      age: json['edad'],
      //pedidos: json['pedidos'],
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

class ArticulosInfo {
  final String categoria;
  final String nombre;
  final String precio;
  final String cantidad;
  ArticulosInfo({this.categoria, this.nombre, this.precio, this.cantidad});

  factory ArticulosInfo.fromJson(Map<String, dynamic> json) {
    return ArticulosInfo(
      categoria: json['Categoria'],
      nombre: json['Nombre'],
      precio: json['Precio'],
      cantidad: json['cantidad'],
    );
  }
}

class ArticulosInfoAPI {
  final String categoria;
  final String nombre;
  final double precio;
  ArticulosInfoAPI({this.categoria, this.nombre, this.precio});

  factory ArticulosInfoAPI.fromJson(Map<String, dynamic> json) {
    return ArticulosInfoAPI(
      categoria: json['category'],
      nombre: json['name'],
      precio: json['price'],  
    );
  }
}

class PublicacionInfo {
  final String docuID;
  final String creador;
  final int valor;
  final String mandadero;
  final List<ArticulosInfo> productos;

  PublicacionInfo({this.docuID,this.creador, this.valor, this.mandadero, this.productos});

  factory PublicacionInfo.fromJson(Map<String, dynamic> json) {
    return PublicacionInfo(
      creador: json['NombreCreador'],
      valor: json['Valor'],
      mandadero: json['mandadero'],
      productos: json['Productos'],      

    );
  }
}
