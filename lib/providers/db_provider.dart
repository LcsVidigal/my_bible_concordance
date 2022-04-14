import 'dart:io';
import 'package:my_bible_concordance/models/model_collections.dart';
import 'package:my_bible_concordance/models/model_verses.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async =>
      _database ??= await initDB();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'my_bible_concordance_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: _criarBanco,);
  }

  Future<void> _criarBanco(Database db, int novaVersao) async {

    List<String> queryes = [
      'CREATE TABLE Collections('
        'collectionId TEXT,'
        'collectionName TEXT,'
        'numberOfVerses INT'
        ')',
      'CREATE TABLE Verses('
        'verseId TEXT,'
        'collection TEXT,'
        'idCollection TEXT,'
        'book TEXT,'
        'chapter TEXT,'
        'initialVerse TEXT,'
        'finalVerse TEXT,'
        'text TEXT,'
        'isFavorite INT,'
        'comment TEXT'
        ')'

    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }


  insertCollections(CollectionsModel newCollection) async {
    // await deleteAllCollections();
    final db = await database;
    final res = await db.insert('Collections', newCollection.toJson());
    

    return res;
  }


  Future<int> deleteAllCollections() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Collections');

    return res;
  }

  Future<List<CollectionsModel>> getAllCollections() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Collections");

    List<CollectionsModel> list =
    res.isNotEmpty ? res.map((c) => CollectionsModel.fromJson(c)).toList() : [];
    
    return list;
  }

  deleteFromCollections(String id) async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Collections WHERE collectionId = ?', [id]);
    await db.rawDelete('DELETE FROM Verses WHERE idCollection = ?', [id]);


    return res;
  }


  //#######
  //###########

  insertVerse(VersesModel newVerse) async {
    final db = await database;
    final count = await db.rawUpdate('UPDATE Collections SET numberOfVerses = numberOfVerses + 1 WHERE collectionId = ?',[newVerse.idCollection]);
    final res = await db.insert('Verses', newVerse.toJson());

    return count;
  }

   Future<List<VersesModel>> getVersesFromCollection(String idCollection) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Verses WHERE idCollection = ?", [idCollection]);

    List<VersesModel> list =
    res.isNotEmpty ? res.map((c) => VersesModel.fromJson(c)).toList() : [];
    
    return list;
  }

  deleteFromVerses(VersesModel verse) async {
    final db = await database;
    final count = await db.rawUpdate('UPDATE Collections SET numberOfVerses = numberOfVerses - 1 WHERE collectionId = ?',[verse.idCollection]);
    final res = await db.rawDelete('DELETE FROM Verses WHERE verseId = ?', [verse.verseId]);

    return count;
  }
  

}