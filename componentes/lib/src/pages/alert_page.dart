import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.redAccent,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.keyboard_return),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true, //Cerrar haciendo clic afuera
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min, 
            children: <Widget>[
              Text('Este es el logo de Flutter, dentro de la alerta'),
              FlutterLogo(size: 100.0,),
              Divider(color: Colors.purpleAccent),
              Text('Este es solo un icono bonito'),
              Icon(Icons.all_inclusive),
              Divider(color: Colors.purpleAccent),
              Text('Esta es una imagen de las cataratas del iguazú'),
              Image(image: NetworkImage('https://cdn.civitatis.com/argentina/buenos-aires/guia/cataratas-iguazu-grid-m.jpg'))

            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}