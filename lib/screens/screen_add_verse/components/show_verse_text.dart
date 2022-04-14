import 'package:flutter/material.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/global/global_state.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class ShowVerseText extends StatelessWidget{
  final book, chapter, initialVerse, finalVerse;
  final String verseText;
  const ShowVerseText({Key? key, required this.book, required this.chapter, required this.initialVerse, required this.finalVerse, required this.verseText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        minWidth: double.infinity
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kCardCollectionsColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: kBorderCardCollectionsColor, width: 1.5),
      ),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: '$book $chapter:$initialVerse',
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              children: [
                if(initialVerse != finalVerse)
                  TextSpan(
                    text: '-$finalVerse',
                  ),
              ]
            )
          ),
          const SizedBox(height: 5),
          Text(verseText, textAlign: TextAlign.justify),
        ],
      )
    
    );
  }

}