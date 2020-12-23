
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(ComponentesApp());
 
class ComponentesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ComponentesApp',
    //home: HomePage(),
    initialRoute: '/',
    routes: getRoutes,
    //ir a una ruta especifica si no la encuentra en la lista de 'getRoutes'
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute(builder: (context) => AlertPage() );
    },

    ///esta parte es para la configuracion de idioma
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', 'EN'),
      const Locale('es', 'ES'),
    ],
    ///

  );
}