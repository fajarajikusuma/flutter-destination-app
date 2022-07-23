import 'dart:io';
import 'package:destination_app/beranda.dart';
import 'package:destination_app/search.dart';
import 'package:destination_app/userLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 1;

  void _onInputTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    SearchPage(),
    Beranda(),
    // LoginPage(),
    userPage(),
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
