import 'package:flutter/material.dart';

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
        title: const Text('Time Picker'),
        centerTitle: true,
        elevation: 0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timeOfDay.format(context).toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              height: 50,
              minWidth: 150,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('Open Time Picker',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                showTime();
              },
            ),
          ],
        ),
      ),
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
