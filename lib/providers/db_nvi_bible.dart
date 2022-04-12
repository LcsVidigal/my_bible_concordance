import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBNviBible{
  static Database? _database;
  static final DBNviBible db = DBNviBible._();

  DBNviBible._();

  Future<Database> get database async =>
      _database ??= await initDB();

  Future initDB() async{

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "nvi_bible");

    final exist = await databaseExists(path);

    if(exist){
      print("banco de dados já existe");
    }
    else{
      print("criando uma cópia dos assets");

      try{
        await Directory(dirname(path)).create(recursive:true);
        print(path);
        print("passei no try");
      }catch(_){
        print("travei no catch");
      }

      ByteData data = await rootBundle.load(join("assets", "database", "nvi_bible.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

      print("banco de dados copiado");

    }

    return await openDatabase(path);
  }


  Future<List<dynamic>> getVerses(int book, int chapter, int initialVerse, int finalVerse) async {
    final db = await database;
    final resVerses = await db
      .rawQuery('SELECT text FROM verses WHERE book = ? AND chapter = ? AND verse BETWEEN ? AND ?', [book, chapter, initialVerse, finalVerse]);

    return resVerses;
  }

  Future<int> getRangeVerses(int book, int chapter) async {
    final db = await database;
    final resVerses = await db
      .rawQuery('SELECT COUNT(*) FROM verses WHERE book = ? AND chapter = ?', [book, chapter]);

    int length = Sqflite.firstIntValue(resVerses)!;
    // print(length);

    return length;

  }
}