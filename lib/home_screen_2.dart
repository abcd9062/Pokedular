import 'package:flutter/material.dart';
import 'package:poke_name_slider/ui/poke_name_slider_screen.dart';
import 'package:pokedex/ui/pokelist_screen.dart';
import 'package:pokenote/ui/screen/pokenote_screen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PokeNameSliderScreen(),
          ),
          Divider(),
          Expanded(
            child: PokeNameSliderScreen(),
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
                        decoration: BoxDecoration(color: const Color(0xffEA5E5E), borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Text("Open PokeDex", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: InkWell(
                      onTap: (){
                        // Open pokenotes app
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const PokenoteScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: const Color(0xffEA5E5E), borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Text("Open PokeNote", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),

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
