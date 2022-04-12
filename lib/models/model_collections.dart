import 'package:uuid/uuid.dart';

class CollectionsModel {
  final String collectionId;
  String collectionName;
  int numberOfVerses;

  //Criando um construtor
  CollectionsModel(this.collectionId, this.collectionName, this.numberOfVerses);
    
  factory CollectionsModel.create(String name){
    String id = const Uuid().v1();
    return CollectionsModel(id, name, 0);
  }

  Map<String, dynamic> toJson() => {
    "collectionId": collectionId,
    "collectionName": collectionName,
    "numberOfVerses": numberOfVerses
  };

  factory CollectionsModel.fromJson(Map<String, dynamic> json) {
    return CollectionsModel(
        json['collectionId'],
        json['collectionName'],
        json['numberOfVerses']
    );
  }


}
