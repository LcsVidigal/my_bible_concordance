
import 'package:flutter/material.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/screen_show_collection.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class CardFavoritos extends StatelessWidget{
  final colecaoFavoritos;
  const CardFavoritos({Key? key, required this.colecaoFavoritos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenShowCollection(currentCollection: colecaoFavoritos,))
      ),
      
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: 58,
        width: screenSize.width - 50,
        decoration: BoxDecoration(
          color: kCardCollectionsColor,         
          borderRadius: const BorderRadius.all(Radius.circular(6)), 
          border: Border.all(
            color: kBorderCardCollectionsColor,
            width: 1.5
          ),
        ),
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.favorite, color: Colors.red),

          ),
          Container(color: kBorderCardCollectionsColor, height: 50, width: 2),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Versos favoritos", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          ),
          Expanded(child: Text(colecaoFavoritos.numberOfVerses.toString(), textAlign: TextAlign.end)),
        ]),
      ),
    );
  }

}