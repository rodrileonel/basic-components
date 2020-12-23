
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Componentes'),),
    body: _listaOpciones(),
    );

  Widget _listaOpciones() {
    return FutureBuilder(
      future: menuProvider.cargarMenu(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){
        print(snapshot.data);
        return ListView(
          children: _opciones(snapshot.data,context),
        );
      }
    );
  }

  List<Widget> _opciones(List<dynamic> data,BuildContext context) {
    return data.map((option) => Column(children: [
      ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color:Colors.green),
        onTap: (){
          //si es una sola ruta para todos los items
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);

          //si son diferentes rutas
          Navigator.pushNamed(context, option['ruta']);

        },
      ),
      Divider(height: 0,)
    ],)).toList();
  }

}