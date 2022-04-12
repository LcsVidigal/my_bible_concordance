import 'package:flutter/material.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/screens/screen_home/components/card_collections.dart';
import 'package:my_bible_concordance/screens/screen_home/components/create_collection_alert.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class LoadCollections extends StatelessWidget{
  const LoadCollections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionsRepository>(
      builder: (context, value, child){
        return Expanded(
          child: FutureBuilder(
            future: value.listaDeColecoes,
            builder: (context, snapshot){
              if(snapshot.hasData){
                // print(snapshot.data);
                return ListAllCollections(listaDeColecoes: snapshot.data!);
              }
              else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }
          ),
        );       
      }
    );
  }
}

class ListAllCollections extends StatelessWidget{
  final listaDeColecoes;
  const ListAllCollections({Key? key, required this.listaDeColecoes, }) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 10),
          child: Row(children: [
            const SizedBox(width: 60),
            Expanded(child: Text("Total de coleções: ${listaDeColecoes.length}", textAlign: TextAlign.center,)),
            SizedBox(
              width: 60,
              height: 28,
              child: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const CreateCollectionAlert()
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ))
                ),
                child: const Center(child: Text("+ Add", style: TextStyle(color: Colors.white, fontSize: 13))),
              ),
            ),
          ]),
        ),

        Expanded(
          child: ListView.builder(
          cacheExtent: double.infinity,
          itemCount: listaDeColecoes.length, 
          itemBuilder: (BuildContext context, int index) { 
            final item = listaDeColecoes[index];
            return CardCollections(itemColecao: item);
            },
          ),
        ),
      ],
    );
  }
  
}