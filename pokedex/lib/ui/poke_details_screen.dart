import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class PokeDetailsScreen extends StatefulWidget {
  const PokeDetailsScreen({super.key});

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeDex", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: CircleAvatar(
          radius: 150,
          child: Image.network("${AppConstants.pokeBaseImageUrl}/1.png",
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
