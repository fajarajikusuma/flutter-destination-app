import 'dart:io';
import 'package:destination_app/beranda.dart';
import 'package:destination_app/search.dart';
import 'package:destination_app/userLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  // add selected as class argument
  final int selected;
  HomePage({Key key, this.selected}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selected;
    // add new index to _pages based on GetStorage
    var LoggedIn = GetStorage().read('username');
    if (LoggedIn != null) {
      _pages.add(userPage());
    } else {
      _pages.add(LoginPage());
    }
  }

  void _onInputTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // set state to add new index at _pages

  List<Widget> _pages = [
    SearchPage(),
    Beranda(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 8,
            color: Colors.indigo,
            activeColor: Colors.indigo,
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            tabBackgroundColor: Colors.indigo[50],
            backgroundColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.search,
                text: 'Cari',
              ),
              GButton(
                icon: Icons.home,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.person,
                text: 'Akun',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
