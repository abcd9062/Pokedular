import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class PokeDetailsScreen extends StatefulWidget {
  final String pokeName;
  final String pokeImgUrl;
  const PokeDetailsScreen({
    super.key,
    required this.pokeName,
    required this.pokeImgUrl
  });

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokeName, style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: widget.pokeName,
          child: CircleAvatar(
            radius: 150,
            child: Image.network(widget.pokeImgUrl,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
