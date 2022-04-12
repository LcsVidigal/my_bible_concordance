import 'package:flutter/material.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/global/global_state.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/screen_add_verse.dart';

class AddComment extends StatefulWidget{
  const AddComment({Key? key}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final commentControler = TextEditingController();
  commentValue() => commentControler.text;

  @override
  Widget build(BuildContext context) {
    store.set("commentValue", commentValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Comentário:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            minWidth: double.infinity
          ),
          child: TextField(
            controller: commentControler,
            maxLength: 1000,
            maxLines: null,
            minLines: null,
            decoration: const InputDecoration(
              hintText: "Comentário",     
              counterText: "",
              border: InputBorder.none
            ),

          ),
        )
      ],
    );
  }
}