import 'package:flutter/material.dart';
import 'package:LoginSimple/src/bloc/login_bloc.dart';
export 'package:LoginSimple/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _instancia;

  //Determina si necesito regresar una nueva instancia de la clase o utilizar la existente
  factory Provider({Key key, Widget child}){
    if(_instancia == null){
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child})
    : super(key: key, child: child);

  final loginBloc = LoginBloc();

  /*Provider({Key key, Widget child})
    : super(key: key, child: child);*/

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context){
    //return(context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc; 
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  } 
}