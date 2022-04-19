import 'package:flutter/material.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/screens/screen_home/components/update_collection_name.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/screen_show_collection.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class CardCollections extends StatelessWidget{
  final itemColecao;
  const CardCollections({Key? key, required this.itemColecao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenShowCollection(currentCollection: itemColecao,))
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        height: 58,
        // width: screenSize.width - 50,
        decoration: BoxDecoration(
          color: kCardCollectionsColor,         
          borderRadius: const BorderRadius.all(Radius.circular(6)), 
          border: Border.all(
            color: kBorderCardCollectionsColor,
            width: 1.5
          ),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(itemColecao.collectionName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          ),
          Expanded(child: Text(itemColecao.numberOfVerses.toString(), textAlign: TextAlign.end)),
          SizedBox(
            width: 30,
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert), 
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: ListTile(
                    title: const Text("Deletar coleção"),
                    textColor: Colors.red,
                    onTap: (){
                      Navigator.pop(context);
    
                      Provider.of<DbRepository>(context, listen: false)
                        .deleteCollection(itemColecao.collectionId);
                    },
                  )
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text("Renomear"),
                    textColor: Colors.black,
                    onTap: (){
                      Navigator.pop(context);

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => UpdateCollectionName(collectionId: itemColecao.collectionId)
                      );
                    },
                  )
                ),
              ],
            )
          )
        ]),
      ),
    );
  }
}