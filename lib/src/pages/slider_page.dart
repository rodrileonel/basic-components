import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _value = 200;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text('Slider')),
       body: Container(child: Column(children:[
         _crearSlider(),
         Divider(),
         _crearCheck(),
         Divider(),
         _crearSwitch(),
         Divider(),
         Expanded(child: _crearImagen()),
       ]),
       padding: EdgeInsets.only(top:50),),
    );
  }

  Widget _crearSlider() => Slider(
    activeColor: Colors.green,
    //divisions: 10,
    label: 'Tamaño de la imagen',
    value: _value, 
    min: 100,
    max: 400,
    //antes del checkbox
    /*onChanged: (valor){
      setState(() {
        _value = valor;
      });
    },
    */
    onChanged: (_check)? null: (valor){
      setState(() {
        _value = valor;
      });
    },
  );

  Widget _crearImagen() => Image(
    image: NetworkImage('https://habitatdelosanimales.com/wp-content/uploads/2018/07/donde-vive-pavo-real.jpg'),
    width: _value,
    fit: BoxFit.contain,
  );

  /*
  _crearCheck() => Checkbox(
    value: _check, 
    onChanged: (valor){
      setState(() {
        _check = valor;
      });
    },
  );
  */
  _crearCheck() => CheckboxListTile(
    title: Text('Bloquear slider'),
    value: _check, 
    onChanged: (valor){
      setState(() {
        _check = valor;
      });
    },
  );

  //el switch practicamente tiene las mismas caracteristicas que el check
  _crearSwitch() => SwitchListTile(
    title: Text('Bloquear slider'),
    value: _check, 
    onChanged: (valor){
      setState(() {
        _check = valor;
      });
    },
  );

}