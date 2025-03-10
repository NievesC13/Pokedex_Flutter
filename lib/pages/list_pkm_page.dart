import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPkmPage extends StatefulWidget {
  const ListPkmPage({super.key});

  @override
  State<ListPkmPage> createState() => _ListPkmPageState();
}

class _ListPkmPageState extends State<ListPkmPage> {
  List<dynamic> _pokemonList = [];
  bool _isLoading = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
    _scrollController.addListener(_scrollToCenter);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollToCenter() {
    if (_pokemonList.isNotEmpty && !_isLoading) {
      // Calculate the scroll position to center the first item.
      final double itemExtent = 10.0; // Approximate height of each ListTile.
      final double containerHeight =
          _scrollController.position.viewportDimension;
      final double centerOffset = (containerHeight - itemExtent) / 2;

      // If the initial offset is less than 0, it should be scrolled to 0.
      final double scrollOffset = centerOffset < 0 ? 0 : centerOffset;

      // Animates the scroll position to the offset.
      _scrollController.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _fetchPokemonList() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      debugPrint("Se estableció conexión con el API de pokemon");
      debugPrint(response.body);
      final data = json.decode(response.body);
      setState(() {
        _pokemonList = data['results'];
        _isLoading = false;
      });

      debugPrint(_pokemonList.toString());
    } else {
      setState(() {
        _isLoading = false;
      });
      debugPrint("No se pudo establecer conexión con el API de pokemon");
    }
  }

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
                      //Marco pantalla
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Expanded(
                            //Pantalla
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: Center(
                                  child: _isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.red,
                                        )
                                      : // Lista de Pokemon's
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   itemCount: _pokemonList.length,
                                      //   itemBuilder: (context, index) {
                                      //     final pokemon = _pokemonList[index];
                                      //     String uriPokemon = pokemon['url'];

                                      //     debugPrint(uriPokemon.toString());
                                      //     return ListTile(
                                      //       title: Align(
                                      //         alignment:
                                      //             Alignment.centerRight,
                                      // child: Card(
                                      //   elevation: 5,
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(
                                      //             30),
                                      //   ),
                                      //   color: Colors.white,
                                      //   child: Padding(
                                      //     padding:
                                      //         EdgeInsets.symmetric(
                                      //       horizontal: 20.0,
                                      //       vertical: 5,
                                      //     ),
                                      //     child: Column(
                                      //       children: [
                                      //         Text(
                                      //           pokemon['name'],
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // ),
                                      //     );
                                      //   },
                                      // ),

                                      CustomScrollView(
                                          slivers: [
                                            SliverList(
                                              delegate:
                                                  SliverChildBuilderDelegate(
                                                (context, index) {
                                                  final pokemon =
                                                      _pokemonList[index];
                                                  String uriPokemon =
                                                      pokemon['url'];
                                                  

                                                  debugPrint(
                                                      uriPokemon.toString());
                                                  return Card(
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 5,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            pokemon['name'],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        )),
                            ),
                          ),
                        ),
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
