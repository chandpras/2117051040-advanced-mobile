import 'package:flutter/material.dart';
import 'package:justduit/screens/form_screen.dart';
import 'package:justduit/screens/home_screen.dart';
import 'package:justduit/screens/transaction_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    TransactionScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Transaction"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR Code"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
      ),
      body: pages[_currentIndex],
    );
  }
}