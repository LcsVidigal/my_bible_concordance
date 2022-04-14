import 'package:flutter/material.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/screens/screen_view_verse/screen_view_verse.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class CardVerses extends StatelessWidget {
  final verso;
  const CardVerses({Key? key, required this.verso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenViewVerse(currentVerse: verso))
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 15),
        margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        height: 145,
        decoration: BoxDecoration(
          color: kCardCollectionsColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: kBorderCardCollectionsColor, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              RichText(
                text: TextSpan(
                  text: '${verso.book} ${verso.chapter}:${verso.initialVerse}',
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    if(verso.initialVerse != verso.finalVerse)
                      TextSpan(
                        text: '-${verso.finalVerse}',
                      ),
                  ]
                )
              ),
              Expanded(child: Container()),

              if(verso.isFavorite == 0)
                const Icon(Icons.favorite, color: Colors.red),

              SizedBox(
                width: 25,
                child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        title: const Text("Deletar verso"),
                        textColor: Colors.red,
                        onTap: (){ 
                          Provider.of<DbRepository>(context, listen: false).deleteVerse(verso);
                          Navigator.pop(context);
                        },
                      )
                    )
                  ],
                ),
              )
            ]),

            RichText(
              text: TextSpan(
                text: 'Verso: ',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                children: [
                  TextSpan(
                    text: verso.text,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ]
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),

            Container(height: 8,),

            RichText(
              
              text: TextSpan(
                text: "Comentário: ",
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                children: [
                  TextSpan(
                    text: verso.comment,
                    style: const TextStyle(fontWeight: FontWeight.w400)

                  ),
                ]
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
