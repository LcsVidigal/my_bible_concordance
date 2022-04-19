
import 'package:flutter/material.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class UpdateCollectionName extends StatefulWidget{
  final String collectionId;
  const UpdateCollectionName({Key? key, required this.collectionId}) : super(key: key);

  @override
  State<UpdateCollectionName> createState() => _UpdateCollectionNameState();
}

class _UpdateCollectionNameState extends State<UpdateCollectionName> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10.0,
      title: const Text('Renomear coleção', style: TextStyle(color: kPrimaryColor)),
      titlePadding: const EdgeInsets.only(left: 18, top: 20),
      contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
      buttonPadding: const EdgeInsets.all(0),
      content: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        maxLength: 30,
        decoration: const InputDecoration(
          counterText: "",
          hintText: "Nome da coleção",          
        ),

      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 112, 112, 112)),),
        ),
        TextButton(
          onPressed: (){
            Provider.of<DbRepository>(context, listen: false)
                        .updateCollectionName(widget.collectionId, _controller.text);
            
            return Navigator.pop(context, 'Ok');
          },
          child: const Text('OK', style: TextStyle(color: kPrimaryColor)),
        ),
      ],
    );
  }
}