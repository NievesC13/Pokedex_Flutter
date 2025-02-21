import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/list_pkm_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex Application',
      // initialRoute: "/",
      // routes: {
      //   "/" : (context) => ListPkmPage(),
      // },
      home: ListPkmPage(),
    );
  }
}
