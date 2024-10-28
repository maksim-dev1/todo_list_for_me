import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final int colorIndex;
  const MenuScreen({super.key, required this.colorIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Today'),
                Text('data'),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         destinations: [
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Badge(child: Icon(Icons.notifications_sharp)),
//             label: 'Notifications',
//           ),
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//       ),
//       body: <Widget>[
        
//       ][currentPageIndex],
//     );
//   }
// }
