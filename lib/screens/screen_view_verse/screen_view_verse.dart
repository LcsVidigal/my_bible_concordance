import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class ScreenViewVerse extends StatelessWidget{
  final currentVerse;
  const ScreenViewVerse({Key? key, required this.currentVerse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        RichText(
          text: TextSpan(
            text: '${currentVerse.book} ${currentVerse.chapter}:${currentVerse.initialVerse}',
            style: TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w800),
            children: [
              if(currentVerse.initialVerse != currentVerse.finalVerse)
                TextSpan(
                  text: '-${currentVerse.finalVerse}',
                ),
            ]
          )
        ),
        backgroundColor: kBackgroundColor,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: kBackgroundColor, statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        centerTitle: true,
        leadingWidth: 82,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar", style: TextStyle(color: Colors.green, fontSize: 17, fontWeight: FontWeight.w500))),
            ),
        
        actions: <Widget> [Container(child: const Icon(Icons.settings, color: Color.fromARGB(221, 145, 143, 143),), margin: EdgeInsets.only(right: 10),)],
      ),

      body: BodyViewVerse(currentVerse: currentVerse),
    );

  }
}


class BodyViewVerse extends StatelessWidget{
  final currentVerse;
  const BodyViewVerse({Key? key, required this.currentVerse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
            child: Text(currentVerse.text, textAlign: TextAlign.justify)
          ),
          const SizedBox(height: 10,),
          const Text("Comentário:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10,),

          Text(currentVerse.text)
        ],
      ),
    );
  }
  
}