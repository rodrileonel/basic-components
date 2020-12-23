

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre='';
  String _email ='';
  String _password ='';
  String _fecha ='';
  String _selected ='Arequipa';
  List<String> _ciudades = ['Arequipa','Lima','Ancash','Cusco','Ica','Cajamarca','Tumbes','Piura','Loreto'];

  //esta propiedad me va a servir para llenar la caja de texto con lo que tenga en _fecha
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Formulario'),),
    body: _formulario(),
  );

  Widget _formulario() => ListView(
    padding: EdgeInsets.symmetric(horizontal:10,vertical:15),
    children: [ 
      _cajaTexto(),
      _cajaTextoEmail(),
      _cajaTextoPassword(),
      _cajaTextoFecha(),
      _cajaTextoDropdown(),
      _resultado(),
    ],
  );

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> options = List();
    _ciudades.map((ciudad) => options.add(
      DropdownMenuItem(
        child: Text(ciudad),
        value: ciudad,
      )
    )).toList();
    return options;
  }

  Widget _cajaTextoDropdown() => Row(
    children: [
      Icon(Icons.select_all),
      SizedBox(width:30),
      Expanded(child: DropdownButton(
          value: _selected,
          items: getOptions(),
          onChanged: (option) {
            setState(() {
              _selected = option;
            });
          },
        ),
      ),
      SizedBox(width:30),
    ],
  );
  
  Widget _cajaTexto() => TextField(
    //autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      //le cambio de borde ára que no aparezca la raya que es Underlineinputborder por defecto
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      counter: Text('${_nombre.length}'),
      hintText: 'Ingresa tu nombre',
      labelText: 'Nombre',
      helperText: 'Solo nombre',
      suffixIcon: Icon(Icons.accessibility, color:Colors.green),
      icon: Icon(Icons.account_circle, color:Colors.green),
    ),
    onChanged: (valor){
      setState(() {
        _nombre = valor;
      });
    },
  );

  Widget _cajaTextoEmail() => TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      //le cambio de borde ára que no aparezca la raya que es Underlineinputborder por defecto
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      counter: Text('${_email.length}'),
      hintText: 'Email',
      labelText: 'Email',
      suffixIcon: Icon(Icons.alternate_email, color:Colors.green),
      icon: Icon(Icons.email, color:Colors.green),
    ),
    onChanged: (valor){
      setState(() {
        _email = valor;
      });
    },
  );

  Widget _resultado() => ListTile(
    title:Text('Nombre: $_nombre'),
    subtitle: Text('Email:$_email'),
    trailing: Text(_selected),//añadimos opcion seleccionada del dopdown de ciudades
  );

  Widget _cajaTextoPassword() => TextField(
    obscureText: true,
    decoration: InputDecoration(
      //le cambio de borde ára que no aparezca la raya que es Underlineinputborder por defecto
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      counter: Text('${_password.length}'),
      hintText: 'Password',
      labelText: 'Password',
      suffixIcon: Icon(Icons.lock_open, color:Colors.green),
      icon: Icon(Icons.lock, color:Colors.green),
    ),
    onChanged: (valor){
      setState(() {
        _password = valor;
      });
    },
  );

  Widget _cajaTextoFecha() => TextField(
    enableInteractiveSelection: false,
    controller: _inputFieldDateController,
    decoration: InputDecoration(
      //le cambio de borde ára que no aparezca la raya que es Underlineinputborder por defecto
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      hintText: 'Fecha de Nacimiento',
      labelText: 'Fecha de nacimiento',
      suffixIcon: Icon(Icons.perm_contact_calendar, color:Colors.green),
      icon: Icon(Icons.calendar_today, color:Colors.green),
    ),
    //el onchanged no me sirve porque no voy a escribir alli
    onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
      _selectDate(context);
    },
  );

  void _selectDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime(2022),
      locale: Locale('es','ES'),
    );

    if(date!=null){
      setState(() {
        _fecha = date.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}