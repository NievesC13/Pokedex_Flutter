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
      backgroundColor: const Color.fromARGB(255, 209, 64, 64),
      body: SafeArea(
        child: Column(
          children: [
            //Visualizar la lista de Pokemon's
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            color: const Color.fromARGB(255, 9, 17, 81),
                          ),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            color: const Color.fromARGB(255, 9, 17, 81),
                          ),
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    //Lista de Pokemon's
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 195, 120, 120),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Visualizar la pokeball para hacer scroll
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    color: const Color.fromARGB(255, 195, 120, 120),
                  ),
                  child: Image.asset('assets/pokeball.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
