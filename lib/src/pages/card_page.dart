

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title:Text('Cards')),
    body: _body(),
  );

  _body() => ListView(
    //padding: EdgeInsets.all(20),
    padding: EdgeInsets.symmetric(vertical:8,horizontal:10),
    children: [
      _cardA(),
      _cardB(),
      _cardA(),
      _cardB(),
      _cardA(),
      _cardB(),
      _cardA(),
      _cardB(),
    ],
  );

  Widget _cardA() => Card(
    margin: EdgeInsets.symmetric(vertical:10),
    //una forma de cortar la imagen para que no salga del card "clipBehavior"
    clipBehavior: Clip.antiAlias,
    elevation: 10,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://fotos.perfil.com/2020/01/08/con-el-vision-s-sony-incursiona-en-el-mundo-de-los-autos-853254.jpg'),
          fadeInDuration: Duration(milliseconds:200),
          fit: BoxFit.cover,
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Titulo del card'),
          subtitle: Text('Esto es un subtitulo para el card'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            FlatButton(child:Text('Cancelar'),onPressed: (){}),
            FlatButton(child:Text('OK'),onPressed: (){}),
          ],
        )
      ]
    ),
  );

  Widget _cardB() => Card(
    margin: EdgeInsets.symmetric(vertical:10),
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
    //puedo usar el elevation de la card o hacer un boxshadow en su coontainer
    elevation: 10,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(20.0),
        //puedo usar el elevation de la card o hacer un boxshadow en su coontainer
        /*
        boxShadow: [
          BoxShadow(
            color:Colors.black26,
            spreadRadius:2.0,
            blurRadius:5.0,
            offset: Offset(1, 10)
          )
        ]
        */
      ),
      //con esto corto la imagen para que no se pase del card en caso no funcione el antialias
      child: ClipRRect(
        borderRadius:BorderRadius.circular(20.0),
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage('https://es.theepochtimes.com/assets/uploads/2019/12/Chevrolet-Corvette_C8_Stingray-2020.jpg'),
              fadeInDuration: Duration(milliseconds:200),
              fit: BoxFit.cover,
            ),
            //Image(image: NetworkImage('https://es.theepochtimes.com/assets/uploads/2019/12/Chevrolet-Corvette_C8_Stingray-2020.jpg')),
            Container(child: Text('Auto'),padding: EdgeInsets.all(10),)
          ],
        ),
      )
    )
  );
}