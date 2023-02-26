import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }

  _buildHeader() {
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
}
