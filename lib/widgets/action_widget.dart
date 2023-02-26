import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildAction extends StatefulWidget {
  @override
  State<BuildAction> createState() => _BuildActionState();
}

class _BuildActionState extends State<BuildAction> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Expanded(
            child: Text(
              _timeOfDay.format(context).toString().padLeft(2, '0'),
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Select Time',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                showTime(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showTime(BuildContext context) async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (picked != null) {
      setState(() {
        _timeOfDay = picked;
      });
    }
  }
}
