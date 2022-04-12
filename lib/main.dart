import 'package:flutter/material.dart';
import 'package:my_bible_concordance/providers/collections_repository.dart';
import 'package:my_bible_concordance/providers/db_nvi_bible.dart';
import 'package:my_bible_concordance/providers/verses_repository.dart';
import 'package:my_bible_concordance/screens/screen_home/screen_collections.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CollectionsRepository>(create: (_) => CollectionsRepository()),
        ChangeNotifierProvider<VersesRepository>(create: (_) => VersesRepository())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DBNviBible.db.initDB();
    return MaterialApp(
      title: 'My Bible Concordance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Roboto'
      ),
      home: const ScreenCollections(),
    );
  }
}