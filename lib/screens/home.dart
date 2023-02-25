import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker/controller/product_controller.dart';
import 'package:time_picker/screens/api_call.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Picker with Api Call'),
        centerTitle: true,
        elevation: 0,
        actions: [
          _buildAction(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            _buildItem(
                icon: Icons.home_outlined,
                title: 'Home',
                onTap: () => Navigator.pop(context)),
            _buildItem(
                icon: Icons.notifications_none,
                title: 'Notification',
                onTap: () => Navigator.pushNamed(context, 'Notification')),
            _buildItem(
                icon: Icons.person_outline_rounded,
                title: 'Profile',
                onTap: () => Navigator.pushNamed(context, 'Profile')),
            _buildItem(
                icon: Icons.settings,
                title: 'Setting',
                onTap: () => Navigator.pushNamed(context, 'Setting'))
          ],
        ),
      ),
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

  Widget _buildAction() {
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
                showTime();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: NetworkImage('https://avatars.githubusercontent.com/u/23038515?v=4'),fit: BoxFit.fill
          // )
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/23038515?v=4')),
            SizedBox(
              height: 15,
            ),
            Text(
              'Azizul Hakim',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ));
  }

  Widget _buildItem(
      {required IconData icon,
      required String title,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      minLeadingWidth: 5,
      title: Text(title),
      onTap: onTap,
    );
  }

  Future<void> showTime() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (picked != null) {
      setState(() {
        _timeOfDay = picked;
      });
    }
  }
}
