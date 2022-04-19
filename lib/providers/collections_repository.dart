import 'package:flutter/material.dart';
import 'package:my_bible_concordance/models/model_collections.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:my_bible_concordance/providers/db_provider.dart';

class DbRepository extends ChangeNotifier{
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

  updateCollectionName(String id, String newName){
    DBProvider.db.updateCollectionName(id, newName);
    notifyListeners();
  }


  Future<List<VersesModel>> listVersesFromCollection(collectionId){
    return DBProvider.db.getVersesFromCollection(collectionId);
  }

  addVerse(VersesModel newVerse) async {
    await DBProvider.db.insertVerse(newVerse);
    notifyListeners();
  }

  deleteVerse(VersesModel verse) async {
    await DBProvider.db.deleteFromVerses(verse);
    notifyListeners();
  }


}