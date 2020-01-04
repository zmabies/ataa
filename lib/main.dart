import 'package:ataa/account/login_page.dart';
import 'package:flutter/material.dart';

import 'account/signup_page.dart';
import 'campaign/campaign_details.dart';
import 'campaign/saved_campaigns.dart';
import 'components/constants.dart';
import 'home/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: AppColors.white,
      fontFamily: "roboto",
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    LoginPage(),
    SavedCampaigns(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mute,
        unselectedItemColor: AppColors.dust,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Saved Campaigns'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

