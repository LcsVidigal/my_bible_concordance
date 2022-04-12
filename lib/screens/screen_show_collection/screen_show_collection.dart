// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/providers/db_nvi_bible.dart';
import 'package:my_bible_concordance/providers/db_provider.dart';
import 'package:my_bible_concordance/screens/screen_home/components/search_field.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/components/button_add_verse.dart';
import 'package:my_bible_concordance/screens/screen_show_collection/components/card_verses.dart';
import 'package:my_bible_concordance/utils/constants.dart';

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
    return Center(
      child: Column(
        children: [
          SearchField(),
          ButtonAddVerse(currentCollection: currentColletion,),
          FutureBuilder(
            future: DBProvider.db.getFromCollection(currentColletion.collectionId),
            builder: (context, snapshot){
              if(snapshot.hasData){
                // print(snapshot.data);
                // print("Entrou no retorno do banco");
                return ListVerses(listVerses: snapshot.data!);
                // return Text("load collections");
                
              }
              else if(snapshot.hasError){
                print("erro ao pegar os dados");
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }
          ),
        ],
      ),
    );
  }
  
}


class ListVerses extends StatelessWidget{
  final listVerses;
  const ListVerses({Key? key, required this.listVerses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ListView.builder(
      cacheExtent: double.infinity,
      itemCount: listVerses.length, 
      itemBuilder: (BuildContext context, int index) { 
        final item = listVerses[index];
        return CardVerses(verso: item);
        },
      ),
    );
  }
  
}

