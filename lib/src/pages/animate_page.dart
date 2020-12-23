
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {

  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> {

  double _w = 30;
  double _h = 30;
  Color _c = Colors.amber;

  BorderRadiusGeometry _border = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Contenedor Animado'),),
    body: Center(
      //cambiamos el Container por AnimatedContainer
      child: AnimatedContainer(
        duration: Duration(seconds:1),
        //esta propiedad es la que le da a animacion al container
        curve: Curves.easeOutQuart,
        width:_w,
        height:_h,
        decoration:BoxDecoration(
          borderRadius: _border,
          color: _c
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton( 
      child: Icon(Icons.play_arrow), 
      onPressed: _cambiarForma
    ),
  );

  void _cambiarForma(){
    final random = Random();
      setState(() {
        _w = random.nextInt(300).toDouble();
        _h = random.nextInt(300).toDouble();
        _c = Color.fromRGBO(
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextInt(255), 
          1,
        );
        _border = BorderRadius.circular(random.nextInt(100).toDouble());
      });
  }
}