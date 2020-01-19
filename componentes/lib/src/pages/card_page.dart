import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.5),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.redAccent),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('Subtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2(){
    final card = Container(
    //  clipBehavior: Clip.antiAlias, Sirve para que lo que este dentro de la Card no se salga
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://picsum.photos/200'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://s23527.pcdn.co/wp-content/uploads/2019/01/Aquamarine-745x497.jpg.optimal.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Landscape'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: 2.0, //Extender
            offset: Offset(0.0, 5.0) //posicion
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ) ,//Para cortar cualquier cosa fuera del contenedor
    );
  }

}