import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';
import 'package:gallery_app/views/components/home_view.dart';
import 'facts.dart';

import '../main.dart';
import 'music.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectItem = 0;

  static List<Widget> pages = [
    HomePage(),
    Facts(),
    MusicGallery(),
  ];

  void _onItemTab(int index) {
    setState(() {
      _selectItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text(appTitle),
        actions: [
          IconButton(
              onPressed: () {
                MusicBackend().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: pages[_selectItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff1fd00f),
        currentIndex: _selectItem,
        onTap: _onItemTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Facts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
          ),
        ],
      ),
    );
  }
}
