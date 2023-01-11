import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm_v3/presentation/home_page.dart';

//todo 1
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    //todo 15
    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification!= null){
        print("zein_${event.notification?.title}");
      }
    });
    //todo 16 tigger manual dari firebase img_2 img_3 img_4 img_5
    //todo 17 hasil ada di img_6
    //todo 18 fokus ke menampilkan ke notifikasi

    //todo 19
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    messaging.getToken().then((token) => setState(() {
      print("zein_$token");
    }));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}