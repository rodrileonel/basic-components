

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title:Text('AlertPage')),
    body: Center(
      child: RaisedButton(
        child: Text('Mostrar Alerta'),
        color: Colors.blue,
        shape: StadiumBorder(),
        textColor: Colors.white,
        padding: EdgeInsets.all(20),
        onPressed: () => _mostrarAlerta(context),
      )
    ),
  );
    
  

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      //para que no se cierre al hacer click afuera
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Texto largo largo largo largo largo largo largo largo'),
            FlutterLogo(size: 90,)
          ]
        ),
        actions: [
          FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
          FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
        ],
      )
    );
  }
}