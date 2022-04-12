import 'package:my_bible_concordance/providers/db_nvi_bible.dart';
import 'package:uuid/uuid.dart';

class VersesModel{
  final String verseId;
  String collection;
  String idCollection;
  String book;
  String chapter;
  String initialVerse;
  String finalVerse;
  String text;
  int isfavorite;
  String comment;

  VersesModel(
    this.verseId,
    this.collection,
    this.idCollection,
    this.book,
    this.chapter,
    this.initialVerse,
    this.finalVerse,
    this.text,
    this.isfavorite,
    this.comment
  );

  factory VersesModel.create(String collection, String idCollection, String book, String chapter, String initialVerse, String finalVerse, String text, int favorite, String comment){
    String id = const Uuid().v1();

    return VersesModel(id, collection, idCollection, book, chapter, initialVerse, finalVerse, text, favorite, comment);
  }


  Map<String, dynamic> toJson() => {

    "verseId": verseId,
    "collection": collection,
    "idCollection": idCollection,
    "book": book,
    "chapter": chapter,
    "initialVerse": initialVerse,
    "finalVerse": finalVerse,
    "text": text,
    "comment": comment
    
  };




}

