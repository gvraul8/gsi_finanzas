import 'package:flutter/material.dart';
import 'package:gsi_finanzas/pages/home_page.dart';
import 'package:gsi_finanzas/pages/quotes_page.dart';
import '../pages/news_page.dart';

// Clase base que contiene el BottomNavigationBar
class BaseApp extends StatefulWidget {
  final Widget child;

  const BaseApp({required this.child});

  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  int _currentIndex = 0;

  // Lista de elementos del BottomNavigationBar
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Noticias',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.euro),
      label: 'Precios',
    ),
  ];

  // Método para manejar el evento de selección de elementos del BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (_currentIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  NewsPage()),
      );
    } else if (_currentIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuotesPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF020060),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: _bottomNavigationBarItems,
      ),
    );
  }
}
