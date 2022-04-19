import 'package:flutter/material.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/global/global_state.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';

class ButtonUpdate extends StatefulWidget{
  final currentCollection;
  final verseId;
  const ButtonUpdate({Key? key, required this.currentCollection, required this.verseId}) : super(key: key);

  @override
  State<ButtonUpdate> createState() => _ButtonUpdateState();
}

class _ButtonUpdateState extends State<ButtonUpdate> {
  @override
  Widget build(BuildContext context) {
    
    var selectedBook = store.get("selectedBook");
    var selectedChapter = store.get("selectedChapter");
    var selectedInitialVerse = store.get("selectedInitialVerse");
    var selectedFinalVerse = store.get("selectedFinalVerse");
    var commentValue = store.get("commentValue");
    var verseText = store.get("verseText");


    return FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Text("Salvar"),
        onPressed: ((){
          // verseText = store.get("verseText");
            if(selectedBook() == null 
               || selectedChapter() == null 
               || selectedInitialVerse() == null 
               || selectedFinalVerse() == null 
               || commentValue() == null
               || verseText() == null){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Complete todos os campos antes de salvar'),
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
              print("objeto nulo");
            }
            else{ 
              VersesModel verso = VersesModel(
                widget.verseId,
                widget.currentCollection.collectionName, 
                widget.currentCollection.collectionId,
                selectedBook().book,
                selectedChapter().toString(),
                selectedInitialVerse().toString(),
                selectedFinalVerse().toString(),
                verseText(),
                1,
                commentValue()
              );
              
              Provider.of<DbRepository>(context, listen: false).updateVerse(verso);

              Navigator.pop(context, 'Ok');
            }
        })

      );
  }
}






