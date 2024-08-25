import 'package:flutter/material.dart';
import 'package:pokedex/ui/pokelist_screen.dart';
import 'package:pokenote/ui/screen/pokenote_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset("assets/images/pokeball.png"),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xffF6E9E9),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: InkWell(
                      onTap: (){
                        // Open Pokedex app
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PokelistScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xffEA5E5E), borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Text("Open PokeDex", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: InkWell(
                      onTap: (){
                        // Open pokenotes app
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PokenoteScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xffEA5E5E), borderRadius: BorderRadius.circular(8)),
                        child: Center(child: Text("Open PokeNote", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),

                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
