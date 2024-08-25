import 'package:flutter/material.dart';

class PokenoteAddDialog {

  static show(BuildContext context, {void Function()? onAddButtonClick, TextEditingController? noteController}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset("assets/images/pokeball.png", height: 40, width: 40, fit: BoxFit.cover,),
              const SizedBox(
                width: 8,
              ),
              const Text('PokeNote'),
            ],
          ),
          content: SizedBox(
            width: 320,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    maxLines: 3,
                    controller: noteController,
                    decoration: InputDecoration(
                      hintText: "write short note here...",
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 2, color: Colors.deepPurple), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if(onAddButtonClick != null){
                  onAddButtonClick();
                  noteController?.clear();
                }
                Navigator.of(context).pop();
              } ,
              child: const Text('Add',style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold) ),
            ),
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.blueGrey),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}