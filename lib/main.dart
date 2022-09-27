import 'package:flutter/material.dart';
import 'package:harryapp/fecth/character_fetch.dart';
import 'package:harryapp/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterFetch()) ///Este dato viene de la carpeta fetch
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Harry Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
