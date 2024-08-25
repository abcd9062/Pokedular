import 'package:flutter/material.dart';
import 'package:pokenote/datasource/pokenote_local_datasource.dart';
import 'package:pokenote/main.dart';
import 'package:pokenote/model/pokenote.dart';
import 'package:pokenote/ui/widgets/pokenote_add_dialog.dart';
import 'dart:io' show Platform;

class PokenoteScreen extends StatefulWidget {
  const PokenoteScreen({super.key});

  @override
  State<PokenoteScreen> createState() => _PokenoteScreenState();
}

class _PokenoteScreenState extends State<PokenoteScreen> {
  TextEditingController? controller;
  List<PokeNote> pokeNotes = [];
  PokenoteLocalDatasource datasource = PokenoteLocalDatasource();

  _addPokeNote() {
    PokenoteAddDialog.show(context,
        noteController: controller,
      onAddButtonClick: () async {
         await datasource.addToDB(
           PokeNote(note: controller?.text ?? "")
         );
         pokeNotes = datasource.getAllPokeNotes();
         setState(() {});
      }
    );
  }

  @override
  void initState() {
    controller = TextEditingController();
    initializePokeNoteApp().then((value) {
      pokeNotes = datasource.getAllPokeNotes();
      setState(() {});
    },
      onError: (error) {
      openPokeNoteHiveBox().then((value){
        pokeNotes = datasource.getAllPokeNotes();
        setState(() {});
      });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeNote"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: pokeNotes.isEmpty ? const Center(child: Text("No Notes Found! Add One..", style:  TextStyle(fontWeight: FontWeight.bold),),) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            clipBehavior: Clip.none,
              itemCount: pokeNotes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 132,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        height: 120,
                        width: Platform.isAndroid ? 200 : 170,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(pokeNotes[index].note),
                        )),
                      ),
                    ),
                    Image.asset("assets/images/pokeball.png", height: 40, width: 40, fit: BoxFit.cover,),
                    Positioned(
                      right: 4,
                        top: 6,
                        child: IconButton(onPressed: (){
                          datasource.deleteFromDB(index);
                          pokeNotes = datasource.getAllPokeNotes();
                          setState(() {});
                        }, icon: const Icon(Icons.cancel)))
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPokeNote,
        tooltip: 'Add PokeNote',
        child: const Icon(Icons.add),
      ),
    );
  }
}
