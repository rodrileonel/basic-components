import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animate_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/test_listas.dart';
import 'package:flutter/material.dart';

final getRoutes = <String,WidgetBuilder>{
  '/' : (BuildContext context) => HomePage(),
  'alert' : (BuildContext context) => AlertPage(),
  'avatar' : (BuildContext context) => AvatarPage(),
  'card' : (BuildContext context) => CardPage(),
  'anim' : (BuildContext context) => AnimatePage(),
  'input' : (BuildContext context) => InputPage(),
  'sliders' : (BuildContext context) => SliderPage(),
  'baselist' : (BuildContext context) => TestListas(),
  'listas' : (BuildContext context) => ListPage(),
  };


//cualquiera de las dos formas es igual

/*
Map<String,WidgetBuilder> getApplicationRoutes() => <String,WidgetBuilder>{
  '/' : (BuildContext context) => HomePage(),
  'alert' : (BuildContext context) => AlertPage(),
  'avatar' : (BuildContext context) => AvatarPage(),
  };

*/