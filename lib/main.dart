import 'package:flutter/material.dart';
import 'package:gsi_finanzas/components/bottom_navigation_bar.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GSI Finanzas',
      debugShowCheckedModeBanner: false,
      home: BaseApp(),
    );
  }
}
