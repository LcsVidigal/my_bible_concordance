import 'package:flutter/material.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class CardVerses extends StatelessWidget {
  final verso;
  const CardVerses({Key? key, required this.verso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 15),
        margin: const EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 15),
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
              Text("${verso.book} ${verso.chapter}:${verso.initialVerse}",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  
              Expanded(child: Container()),

              if(verso.isFavorite == 0)
                const Icon(Icons.favorite, color: Colors.red),

              SizedBox(
                width: 16,
                child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        title: const Text("Deletar coleção"),
                        textColor: Colors.red,
                        onTap: () { },
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
