

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    //cargarMenu();
  }

  //necesito retornar un future (por la peticion http) 
  //asincrono (para que espere a que el future obtenga la info y siga el programa)
  Future<List<dynamic>> cargarMenu() async {
    final response = await rootBundle.loadString('data/options.json');

    Map dataMap = json.decode(response);
    return dataMap['rutas'];
  }
}

final menuProvider = _MenuProvider();