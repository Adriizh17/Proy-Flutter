import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }
/*
//Metodo corto
  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      //Metodo add en cascada
      lista..add(tempWidget)
           ..add(Divider(
             color: Color.fromARGB(255, 0, 0, 255),
           ));
    }
    return lista;
  }
*/
  List<Widget> _crearItemsCorta(){
    return opciones.map((opt){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.all_inclusive),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }

}