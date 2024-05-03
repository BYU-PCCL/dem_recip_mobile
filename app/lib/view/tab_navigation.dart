import 'package:dem_recip_mobile/view/home_view.dart';
import 'package:dem_recip_mobile/view/profile_view.dart';
import 'package:flutter/material.dart';


class TabNav extends StatelessWidget {
  const TabNav({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: <Widget>[
            HomeView(),
            ProfileView()
          ],
        ),
      ),
    );
  }
}
