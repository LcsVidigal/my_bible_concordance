// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/providers/db_nvi_bible.dart';
import 'package:my_bible_concordance/providers/db_provider.dart';
import 'package:my_bible_concordance/screens/screen_home/components/search_field.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/components/button_add_verse.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/components/card_verses.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

class ScreenShowCollection extends StatelessWidget{
  final currentCollection;
  const ScreenShowCollection({Key? key, required this.currentCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCollection.collectionName, style: TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 28, fontWeight: FontWeight.w800)),
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

      body: ScreenShowCollectionBody(currentColletion: currentCollection,),
    );

  }
}

class ScreenShowCollectionBody extends StatelessWidget{
  final currentColletion;
  const ScreenShowCollectionBody({Key? key, required this.currentColletion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DbRepository>(
      builder: (context, value, child){
        return FutureBuilder(
          future: value.listVersesFromCollection(currentColletion.collectionId),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListVerses(listVerses: snapshot.data!, collection: currentColletion,);
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }
        );       
      }
    );
  }
  
}




class ListVerses extends StatelessWidget{
  final listVerses;
  final collection;
  const ListVerses({Key? key, required this.listVerses, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // SearchField(),
          ButtonAddVerse(currentCollection: collection),
          SizedBox(height: 12),
          Text("Total de Versos: ${listVerses.length}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
          SizedBox(height: 12),
          if(listVerses.length  == 0)
            Text("Você ainda não possui itens nessa coleção."),

          Expanded(
            child: ListView.builder(
            cacheExtent: double.infinity,
            itemCount: listVerses.length, 
            itemBuilder: (BuildContext context, int index) { 
              final item = listVerses[index];
              return CardVerses(verso: item, currentCollection: collection,);
              },
            ),
          )
        ],
      ),
    );
    
  }
  
}

