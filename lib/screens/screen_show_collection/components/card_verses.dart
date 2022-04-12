import 'package:flutter/material.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class CardVerses extends StatelessWidget {
  final verso;
  const CardVerses({Key? key, required this.verso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VersesModel verso = VersesModel(
    //   "id do versiculo", 
    //   "Amor",
    //   "id da colecao",
    //   "Josué", 
    //   "21", 
    //   "45",
    //   "46",
    //   "De todas as boas promessas do Senhor à nação de Israel, nenhuma delas falhou; todas se cumpriram.", 
    //   true, 
    //   "Deus nunca falhará em nenhuma de suas promessas, basta esperar, Deus é fiel e cumpre o que promete. Isso não depende de mim.");

    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 15),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        height: 145,
        decoration: BoxDecoration(
          color: kCardCollectionsColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: kBorderCardCollectionsColor, width: 1.5),
        ),
        child: Column(
          children: [
            Row(children: [
              Text("${verso.book} ${verso.chapter}:${verso.initialVerse}",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  
              Expanded(child: Container()),

              if(verso.isfavorite)
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
