import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokenote/model/pokenote.dart';
import 'package:pokenote/ui/screen/pokenote_screen.dart';

late Box<PokeNote> hiveDb;

Future<void> initializePokeNoteApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PokeNoteAdapter());
  openPokeNoteHiveBox();
}

Future<void> openPokeNoteHiveBox() async {
  hiveDb = await Hive.openBox<PokeNote>('pokenotes');
}

void main() async {
  initializePokeNoteApp();
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
        primarySwatch: Colors.blue,
      ),
      home: const PokenoteScreen(),
    );
  }
}
