import 'package:flutter/material.dart';
import 'package:dem_recip_mobile/view/home_view.dart';
import 'package:dem_recip_mobile/view/profile_view.dart';

class TabNav extends StatefulWidget {
  const TabNav({Key? key}) : super(key: key);

  @override
  _TabNavState createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  int _selectedIndex = 0;

  static const List<Widget> _tabs = [
    HomeView(),
    ProfileView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Set splash color to transparent
          highlightColor: Colors.transparent, // Set highlight color to transparent
          splashFactory: NoSplash.splashFactory, // Use NoSplash factory to disable splash
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
