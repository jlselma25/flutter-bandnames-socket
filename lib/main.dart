import 'package:band_name_app/Pages/Home.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
  return MaterialApp(
       title:'Material App',
       debugShowCheckedModeBanner: false,
 
 initialRoute: 'home',
 
      routes: {
        'home':( _ ) => HomePage()
      }
        
    );
  }
}

