import 'package:flutter/material.dart';
import 'package:poke_multimodular_demo/home_screen_1.dart';
import 'package:pokenote/main.dart';

import 'home_screen_2.dart';

void main() async {
  await initializePokeNoteApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen1(),
    );
  }
}
