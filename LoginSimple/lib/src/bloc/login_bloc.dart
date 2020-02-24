import 'dart:async';
import 'package:LoginSimple/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  /*  RXDart no trabaja con StreamController
  final _emaiController     = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();*/

  final _emaiController     = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream    => _emaiController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeEmail    => _emaiController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado a los Streams
  String get email    => _emaiController.value;
  String get password => _passwordController.value;

  //Cerrar
  dispose(){
    _emaiController?.close();
    _passwordController?.close();
  }

}