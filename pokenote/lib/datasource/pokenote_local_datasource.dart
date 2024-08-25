
import 'package:pokenote/main.dart';
import 'package:pokenote/model/pokenote.dart';

class PokenoteLocalDatasource {
  Future<void> addToDB(PokeNote note) async {
     hiveDb.add(note);
  }

  List<PokeNote> getAllPokeNotes() {
    return hiveDb.values.toList();
  }

  Future<void> deleteFromDB(int pos) async {
    await hiveDb.deleteAt(pos);
  }

}