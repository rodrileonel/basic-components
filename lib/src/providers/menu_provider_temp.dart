

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarMenu();
  }

  void cargarMenu() {
    rootBundle.loadString('data/options.json')
              .then((data) {
                Map dataMap = json.decode(data);
                opciones = dataMap['rutas'];
              });
  }
}

final menuProvider = _MenuProvider();