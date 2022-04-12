import 'package:flutter/material.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/screen_add_verse.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class ButtonAddVerse extends StatelessWidget{
  final currentCollection;
  const ButtonAddVerse({Key? key, required this.currentCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 165,
      height: 42,
      child: TextButton(
        onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenAddVerse(currentCollection: currentCollection,))
      ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ))
        ),
        child: const Center(child: Text("Adicionar Verso", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
      ),
    );
  }
  
}