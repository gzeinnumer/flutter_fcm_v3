# flutter_fcm_v3

```dart
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
```

```dart
import 'package:flutter/material.dart';

//todo 2
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//todo 3
/*
https://firebase.flutter.dev/
https://firebase.flutter.dev/docs/overview

alias flutter=/Users/mfadlizein/Documents/GitHub/sdk/flutter/bin/flutter
flutter pub add firebase_core
*/
```

```dart
dependencies:
  #  todo 4
  firebase_core: ^2.4.1
```

```gradle
buildscript {

    dependencies {
        //todo 5
        classpath 'com.google.gms:google-services:4.3.8'
    }
}
```

```dart
//todo 6
apply plugin: 'com.google.gms.google-services'

android {
    defaultConfig {
        //todo 7
        multiDexEnabled true
    }
}

dependencies {
    //todo 8
    implementation 'com.android.support:multidex:1.0.3'
}

```

```
<manifest
    Todo 9 android:usesCleartextTraffic="true"
    <application
        android:usesCleartextTraffic="true"
```

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm_v3/presentation/app_widget.dart';

void main() async{
  //todo 10
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
```

```gradle
android {
    defaultConfig {
        //todo 11 ambil id ini, liat di img_1
        applicationId "com.gzeinnumer.flutterfcmv3.flutter_fcm_v3"
        //todo 12 download file google-services.json letakan di android/app/google-services.json
    }
}
```


```dart
  # todo 13
  # firebase_messaging: ^11.1.0
  firebase_messaging: ^14.2.1
```

```dart
void main() async{
  //todo 14.1
  await requestPerminssion();

  runApp(const MyApp());
}
```

```dart
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
```

```dart
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
    //todo 18 fokus ke menampilkan ke notifikasi cari caranya di github ku
  }
}
```

---

```
Copyright 2023 M. Fadli Zein
```