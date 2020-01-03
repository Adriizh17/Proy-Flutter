import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  createState() => _ContadorPageState(); //Retorna una nueva instancia
}

class _ContadorPageState extends State<ContadorPage>{
  final _estiloTexto = new TextStyle( fontSize: 20);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp <3'),
        centerTitle: true,
        backgroundColor: (Color.fromARGB(255, 255, 0, 0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: _estiloTexto),
            Text('$_conteo', style: _estiloTexto),
          ],
        )
      ),
      floatingActionButton: _crearBotones(),
      );
  }


  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero), 
          backgroundColor: Color.fromARGB(255, 255, 0, 0), 
          onPressed: _reset
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove), 
          backgroundColor: Color.fromARGB(255, 255, 0, 0), 
          onPressed: _sustraer
        ),
        SizedBox(width: 5.0),
        FloatingActionButton(
          child: Icon(Icons.add), 
          backgroundColor: Color.fromARGB(255, 255, 0, 0), 
          onPressed: _agregar
        ),

      ],
    );
  }

  void _agregar(){
    setState(() => _conteo++);
  }

  void _sustraer(){
    setState(() => _conteo--);
  }

  void _reset(){
    setState(() => _conteo=0);
  }

}
