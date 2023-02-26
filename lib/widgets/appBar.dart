import 'package:flutter/material.dart';
import 'package:time_picker/widgets/action_widget.dart';

AppBar appBar(){
  return AppBar(
    title: const Text('Time Picker with Api Call'),
    centerTitle: true,
    elevation: 0,
    actions: [
      BuildAction(),
    ],
  );
}