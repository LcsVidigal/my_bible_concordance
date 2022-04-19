// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/screens/screen_home/components/card_favoritos.dart';
import 'package:my_bible_concordance/screens/screen_home/components/list_all_collections.dart';
import 'package:my_bible_concordance/screens/screen_home/components/search_field.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class ScreenCollections extends StatelessWidget{
  const ScreenCollections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coleções", style: TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 28, fontWeight: FontWeight.w800)),
        backgroundColor: kBackgroundColor,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: kBackgroundColor, statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () { SystemNavigator.pop(); },
            child: Text("Sair", style: TextStyle(color: Colors.green, fontSize: 17, fontWeight: FontWeight.w500)),
          )
        ),
        
        actions: <Widget> [Container(child: const Icon(Icons.settings, color: Color.fromARGB(221, 145, 143, 143),), margin: EdgeInsets.only(right: 10),)],
      ),
      body: const ScreenCollectionsBody(),
    );
  }
}


class ScreenCollectionsBody extends StatelessWidget{
  const ScreenCollectionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SearchField(),
          CardFavoritos(),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              children: const [
                Expanded(child: Divider(indent: 10, endIndent: 10, color: Color.fromARGB(155, 109, 109, 109), thickness: 2)),
                Text("Minhas coleções", style: TextStyle(fontWeight: FontWeight.w400),),
                Expanded(child: Divider(indent: 10, endIndent: 10, color: Color.fromARGB(155, 109, 109, 109), thickness: 2)),
              ],
            ),
          ),
          LoadCollections()
          
        ],
      ),
    );
  }
  
}
