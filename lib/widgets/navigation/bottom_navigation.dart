import 'package:bookshelf/style/colors.dart';
import 'package:flutter/material.dart';

import '../../screens/books_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/planning_screen.dart';
import '../../screens/profil_screen.dart';
import '../../screens/scan_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() =>
      _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else if(_selectedIndex == 1){
        Navigator.pushNamed(context, BooksScreen.routeName);
      } else if(_selectedIndex == 2){
        Navigator.pushNamed(context, ScanScreen.routeName);
      } else if(_selectedIndex == 3){
        Navigator.pushNamed(context, PlanningScreen.routeName);
      } else if(_selectedIndex == 4){
        Navigator.pushNamed(context, ProfilScreen.routeName);
      }
    });
    _selectedIndex = index;
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Mes livres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Planning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mon profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPinkColor,
        unselectedLabelStyle: const TextStyle(color:kLightGreyColor  ,fontSize: 12),
        unselectedItemColor: kGreyColor,
        selectedItemColor: kSecondaryColor,
        onTap: _onItemTapped,
      );
  }
}