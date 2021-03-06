import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class ScreenViewVerse extends StatefulWidget{
  final currentVerse;
  const ScreenViewVerse({Key? key, required this.currentVerse}) : super(key: key);

  @override
  State<ScreenViewVerse> createState() => _ScreenViewVerseState();
}

class _ScreenViewVerseState extends State<ScreenViewVerse> {
  late int aux;
  void initState(){
    super.initState();
    aux = widget.currentVerse.isFavorite;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentVerse.collection, style: const TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 26, fontWeight: FontWeight.w800)),
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
        
        actions: <Widget> [
          IconButton(
            onPressed: () {
              setState(() {
                aux = 1 - aux;
                Provider.of<DbRepository>(context, listen: false).favoriteVerse(widget.currentVerse, aux);
              });
            }, 
            icon: 
              aux == 1 ?
                const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_outline, color: Colors.black)

          )
        ]
      ),

      body: BodyViewVerse(currentVerse: widget.currentVerse),
    );

  }
}


class BodyViewVerse extends StatelessWidget{
  final currentVerse;
  const BodyViewVerse({Key? key, required this.currentVerse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
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
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${currentVerse.book} ${currentVerse.chapter}:${currentVerse.initialVerse}',
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      children: [
                        if(currentVerse.initialVerse != currentVerse.finalVerse)
                          TextSpan(
                            text: '-${currentVerse.finalVerse}',
                          ),
                      ]
                    )
                  ),
                  const SizedBox(height: 5),
                  Text(currentVerse.text, textAlign: TextAlign.justify),
                ],
              )
            ),
            const SizedBox(height: 10,),
            const Text("Coment??rio:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10,),
            
            Text(currentVerse.comment, textAlign: TextAlign.justify),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
  
}