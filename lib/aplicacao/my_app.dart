import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certificados',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
