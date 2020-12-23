import 'package:flutter/material.dart';

class TestListas extends StatelessWidget {

  final lista = ['uno','dos','tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text('Componentes'))),
      body: Center(child:ListView(children: _crearLista3(),),),
    );
  }

  List<Widget> _crearLista() {
    var response = List<Widget>();
    for (String item in lista) {
      final tile = ListTile(
        title: Text(item),
      );
      //response.add(tile);
      //response.add(Divider());

      //otra forma ..
      response..add(tile)..add(Divider());
    }
    return response;
  }

  List<Widget> _crearLista2(){
    return lista.map((item) => ListTile(
      title: Text(item),
    )).toList();
  }

  //con el divider
  List<Widget> _crearLista3(){
    return lista.map((item) => Column(
      children: [
        ListTile(
          title: Text(item),
          subtitle: Text('Subtitulo'),
          leading: Icon(Icons.accessibility),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){},
        ),
        Divider(height:1)
      ],
    )).toList();
  }
}