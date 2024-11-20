import 'package:flutter/material.dart';

import 'package:anime_app/views/main_wrapper/main_wrapper.dart';

void main() {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromRGBO(1, 6, 20, 1),
      ),
      home: MainWrapper(),
    );
  }
}
