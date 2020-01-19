import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider de gatito'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.black,
      label: 'Tamaño de la imagen $_valorSlider',
      divisions: 500,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null :  (valor){
        setState(() {
          _valorSlider = double.parse(valor.toStringAsFixed(2));
        });
      },
    );
  }
 
  Widget _crearCheckBox(){
  /*  return Checkbox(
      value: _bloquearCheck,
      onChanged:(valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );*/
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.red,
      value: _bloquearCheck,
      onChanged:(valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.red,
      value: _bloquearCheck,
      onChanged:(valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
  
  Widget _crearImagen(){
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
    //  image: NetworkImage('https://i.pinimg.com/originals/03/c9/ee/03c9ee9c0a5f15908ea183bf0b4bea98.png'),
      image: NetworkImage('https://i.ya-webdesign.com/images/cat-meme-png-1.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}