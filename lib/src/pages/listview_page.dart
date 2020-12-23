import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  //paso 2: creo un scroll controller para controlar el scroll de la lista
  ScrollController _scrollController = ScrollController();
  
  List<int> _listaNumeros = List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //paso 1: este metodo ingresa a otra etapa del ciclo de vida de un statefullwidget
  @override
  void initState() {
    super.initState();
    //paso 2: voy a agregar 10 numeros a mi lista antes de hacer el build y despues de iniciar el statefulwidget
    _agregar10();
    //paso 3: agregarmos un listener al scroll
    _scrollController.addListener(() {
      //si el scroll actual es de 1000 pixeles y la posicion actual es de 1000 pixeles, quiere decir que estamos al final de la lista
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //en este momento agrego 10 imagenes mas
        //_agregar10();
        //paso 4: vamos a hacerlo con una supuesta peticion http que dura 2 segundos en traer la informacion
        _fetchData();
      }
    });
  }

  //nota: el Scrollcontroler esta siempre escuchando los cambios, aun si cambio de pagina, asi que es mejor eliminarlo cuando se acabe la pagina, para prevenir fugas de memoria
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title:Text('Listas')),
    body: Stack(
      children: [
        _crearLista(),
        //paso 5: creamos un loading que funcione cada vez que pedimos 10 elementos mas a la lista
        _crearLoad(),
      ],
    ),
  );

  //paso 7: creamos un refresher paa cuando tenga que cargar la lista, encima del listview
  Widget _crearLista() => RefreshIndicator(
    onRefresh: _obtenerPagina1,
    child: ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context,int index) {
        final image = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
        );
      }
    ),
  );

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    //cada vez que agregue 10 quiero que actualice el widget
    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    Timer(Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP(){
    _isLoading = false;
    //paso 6: cuando yo tengo la respuesta del servicio, se que hay mas regisytros asi que muevo un poco el scroll hacia abajo despues de que cargue ara que se vea mejor :D
    _scrollController.animateTo(
      _scrollController.position.pixels + 100, //su posicion actual mas 100 pixeles 
      duration: Duration(milliseconds:250), 
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Widget _crearLoad() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CircularProgressIndicator()
          ),
          SizedBox(height:15)
        ],
      );
    } else{
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {
    final duration = Duration(microseconds: 2);
    Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;//puedo restablecerlo pero quiero nuevas imagenes
      _agregar10();
    });
    return Future.delayed(duration);
  }
}