import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/routes/pokedex_route.dart';
import 'package:pokedex/datasource/poke_remote_datasource.dart';
import 'package:pokedex/models/pokemon_response.dart';
import 'package:pokedex/ui/poke_details_screen.dart';
import 'package:pokedex/utils/constants.dart';

class PokelistScreen extends StatefulWidget {
  const PokelistScreen({super.key});

  @override
  State<PokelistScreen> createState() => _PokelistScreenState();
}

class _PokelistScreenState extends State<PokelistScreen> {
  late PokeRemoteDatasource datasource;
  bool isLoading = false;
  List<Pokemon> pokeList = [];
  @override
  void initState() {
    datasource = PokeRemoteDatasource();
    isLoading = true;
    datasource.getPokeMonList().then((pokeResponse){
      pokeList.addAll(pokeResponse.results ?? []);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeDex"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : ListView.builder(
          shrinkWrap: true,
            itemCount: pokeList.length,
            itemBuilder: (context, pos) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0, top: 4.0, bottom: 4.0),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Hero(
                      tag: pokeList[pos].name ?? "PokeMon",
                      child: Image.network(
                          "${AppConstants.pokeBaseImageUrl}/${pos+1}.png",
                      ),
                    ),
                    title: Text(pokeList[pos].name ?? "PokeMon"),
                    tileColor: Colors.black12,
                    onTap:() {
                      log("${AppConstants.pokeBaseImageUrl}/${pos+1}.png");
                      // Navigator.push(context, CupertinoPageRoute(builder: (context) => PokeDetailsScreen(
                      //   pokeName: pokeList[pos].name ?? "PokeMon", pokeImgUrl: "${AppConstants.pokeBaseImageUrl}/${pos+1}.png",
                      // )));
                      context.goNamed("pokedetails", pathParameters: {'pokeName': pokeList[pos].name ?? "PokeMon", 'pokeImgUrl': "${AppConstants.pokeBaseImageUrl}/${pos+1}.png"});
                    } ,
                  ),
              );
            }
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
