import 'package:flutter/material.dart';

class ListPkmPage extends StatefulWidget {
  const ListPkmPage({super.key});

  @override
  State<ListPkmPage> createState() => _ListPkmPageState();
}

class _ListPkmPageState extends State<ListPkmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Hola Mundo'),
          ],
        ),
      ),
    );
  }
}
