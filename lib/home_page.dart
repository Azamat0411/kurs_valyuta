import 'package:flutter/material.dart';
import 'package:kurs_valyuta/screens/exchange_screen.dart';
import 'package:kurs_valyuta/screens/main_scr.dart';
import 'package:kurs_valyuta/screens/no_internet.dart';
import 'package:kurs_valyuta/screens/others_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = <Widget>[
    MainScreen(),
    ExchangeScreen(),
    OthersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Color selected = Theme.of(context).selectedRowColor;
    Color unselected = Theme.of(context).disabledColor;
    return NoInternet(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            iconSize: 24,
            selectedItemColor: Theme.of(context).selectedRowColor,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
              icon: Image.asset("images/home.png",
                  width: 20,
                  height: 20,
                  color: _selectedIndex == 0 ? selected : unselected),
                  label: "Asosiy"),
              BottomNavigationBarItem(
                  icon: Image.asset("images/currency.png",
                  width: 20,
                  height: 20,
                  color: _selectedIndex == 1 ? selected : unselected),
                  label: "Ayriboshlash"),
              BottomNavigationBarItem(
                  icon: Image.asset("images/dots.png",
                  width: 20,
                  height: 20,
                  color: _selectedIndex == 2 ? selected : unselected),
                  label: "Boshqalar"),
            ],
          ),
          body: _screens[_selectedIndex],
        ),
    );
  }
}
