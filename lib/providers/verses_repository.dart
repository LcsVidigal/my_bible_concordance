import 'package:flutter/material.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:my_bible_concordance/providers/db_provider.dart';

class VersesRepository extends ChangeNotifier{

  Future<List<VersesModel>> listVersesFromCollection(collectionId){
    return DBProvider.db.getVersesFromCollection(collectionId);
  }

  addVerse(VersesModel newVerse){
    DBProvider.db.insertVerse(newVerse);
    notifyListeners();
  }

  deleteVerse(String verseId){
    DBProvider.db.deleteFromVerses(verseId);
    notifyListeners();
  }


}