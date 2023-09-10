import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_page.dart';
//import 'screens/second_screen.dart';

main(){
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //brightness: Brightness.dark,
      ),
      home: MyHomePage(),
      /*routes: <String, WidgetBuilder>{
        '/second': (context) => SecondScreen(),
      },*/
    );
  }
}




