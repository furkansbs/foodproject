// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homePageState();
}

class homePageState extends State<homePage> {
  @override
  void initState() {
    super.initState();
    _pages[2] = Column(
      children: [
        SizedBox(
          height: 75,
        ),
        ElevatedButton(
            onPressed: () {
              /////////////////
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.of(context).pop());
            },
            child: Text("Çıkış Yap"))
      ],
    );
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    Text("Yemeklerin listelendiği filtreleme sayfası"),
    Text("Yemek Ekleme Sayfası (Admin)"),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Yemek Ara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Yemek Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        //255,37, 150, 190
        backgroundColor: Color.fromARGB(255, 8, 130, 151),
        title: Text(
          "Yemek Zamanı",
          style: GoogleFonts.marhey(
              fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
