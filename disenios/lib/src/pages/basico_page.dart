import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo   = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo= TextStyle(fontSize: 20.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImg(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      )
    );
  }

  Widget _crearImg(){
    return Image(
      image: NetworkImage('https://www.capturelandscapes.com/wp-content/uploads/2017/03/DSC2441-Panorama.jpeg'),
    );
  }

  Widget _crearTitulo(){
    return SafeArea( //Indicar si se puede desplegar la informacion 
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Landscape', style: estiloTitulo,),
                        SizedBox(height: 7.0),
                        Text('Landscape from Islandia', style: estiloSubtitulo,)
                      ],
                    ),
                  ),
                  Icon(Icons.star, color: Colors.red, size:30.0),
                  Text('41', style: TextStyle(fontSize: 20.0))
                ],
              ),
      ),
    );
  }

  Widget _crearAcciones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto){
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40.0,),
        SizedBox(height: 7.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),)
      ],
    );
  }

  Widget _crearTexto(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
        child: Text(
          'Ut laborum aliquip ut mollit ullamco minim aliqua dolor amet in voluptate qui magna qui. Elit eu sint non exercitation fugiat do ipsum occaecat. Est non sunt consectetur esse aliquip duis non. Pariatur incididunt eiusmod dolore do ipsum eu aliquip minim consequat esse Lorem. Minim reprehenderit aliqua tempor anim ex Lorem veniam eiusmod magna et. Aute mollit incididunt mollit sit non commodo laboris in consectetur.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}