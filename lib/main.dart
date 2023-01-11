import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm_v3/presentation/app_widget.dart';

void main() async{
  //todo 10
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //todo 14.1
  await requestPerminssion();

  runApp(const MyApp());
}

//todo 14.2
Future<void> requestPerminssion() async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('zein_User granted permission: ${settings.authorizationStatus}');
}