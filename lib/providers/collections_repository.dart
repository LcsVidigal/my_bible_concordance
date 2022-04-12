import 'package:flutter/material.dart';
import 'package:my_bible_concordance/models/model_collections.dart';
import 'package:my_bible_concordance/providers/db_provider.dart';

class CollectionsRepository extends ChangeNotifier{
  // Future<List<CollectionsModel>> listaDeColecoes = DBProvider.db.getAllCollections();

  Future<List<CollectionsModel>> get listaDeColecoes => DBProvider.db.getAllCollections();

  addCollection(CollectionsModel newCollection){
    DBProvider.db.insertCollections(newCollection);
    // listaDeColecoes = DBProvider.db.getAllCollections();
    notifyListeners();
  }

  deleteCollection(String id){
    DBProvider.db.deleteFromCollections(id);

    notifyListeners();
  }


}