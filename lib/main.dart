import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker/bindings/all_bindings.dart';
import 'package:time_picker/screens/api_call.dart';
import 'package:time_picker/screens/home.dart';

void main() {
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Home()
    );
  }
}

