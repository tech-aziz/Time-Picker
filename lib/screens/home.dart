import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker/screens/api_call.dart';
import 'package:time_picker/widgets/action_widget.dart';
import 'package:time_picker/widgets/appBar.dart';
import 'package:time_picker/widgets/draswer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const DrawerWidget(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(const ApiCall());
            },
            child: const Text(
              'Go',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
