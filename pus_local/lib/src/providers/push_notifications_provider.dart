import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification{

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream <String> get mensajes => _mensajesStreamController.stream;

  initNotifications(){
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token){
      print('FCM TOKEN');
      print(token);
      //ctL5TiiZH0w:APA91bELvpY5htsqGJNsbJKxFD2q9_l04eB2lgI4vaP84LKdHMsI4urdiaRYD6rSU7Vx9YGTzDH98Bew7R0G9RJq73U9QF6XQjmM7YL3--wV1KoDw1TreGVZER93rpf1Dpos09F90rgL
    });

    _firebaseMessaging.configure(

      onMessage: (info) async {
        print('==== ON MESSAGE ====');
        print(info);
        //Para obtener la información 
        String argumento = 'no-data';
        if(Platform.isAndroid){
          argumento = info['data']['comida'] ?? 'no-data';
        }else{
          argumento = info['comida'] ?? 'no-data-ios';
        }
        _mensajesStreamController.sink.add(argumento);
      },

      onLaunch: (info) async {
        print('==== On Launch ====');
        print(info);
        
      },

      onResume: (info) async {
        print('==== ON RESUME ====');
        print(info);

        String argumento = 'no-data';
        if(Platform.isAndroid){
          argumento = info['data']['comida'] ?? 'no-data';
        }else{
          argumento = info['comida'] ?? 'no-data-ios';
        }

        _mensajesStreamController.sink.add(argumento);
      },

     // onBackgroundMessage: backgroundMessageHandler,

    );
  }
/*
  static Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
    print("onBackgroundMessage");
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print('onBackgroundMessage data: $data');
    }
 
    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print('onBackgroundMessage notification: $notification');
    }
  }*/
  
  dispose(){
    _mensajesStreamController.close();
  }
}