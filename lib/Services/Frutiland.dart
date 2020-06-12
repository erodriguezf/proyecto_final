import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_final/Services/RequestStructure.dart';

Future<List<ArticulosInfoAPI>> traerArticulos(String busqueda, String ur)  async {
  try {
    final http.Response response = await http.get(
      ur+busqueda,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
    print('${response.body}');
    print('${response.statusCode}');
  List<dynamic> jsonlist = json.decode(response.body) as List;
  List<ArticulosInfoAPI> responseList =
          jsonlist.map((e) => ArticulosInfoAPI.fromJson(e)).toList();
         return responseList;  
    }
  } catch (e) {print(e.toString());}
}