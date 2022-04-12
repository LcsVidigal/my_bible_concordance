class Summary{

  static List<ModelSummary> lista = 
  [
    ModelSummary(0,'Gênesis','gn', 50), 
    ModelSummary(1,'Êxodo','ex', 40),
    ModelSummary(2,'Levítico','lv', 27),
    ModelSummary(3,'Números','nm', 36),
    ModelSummary(4,'Deuteronômio','dt', 34),
    ModelSummary(5,'Josué','js', 24),
    ModelSummary(6,'Juízes','jz', 21),
    ModelSummary(7,'Rute','rt', 4),
    ModelSummary(8,'1º Samuel','1sm', 31),
    ModelSummary(9,'2º Samuel','2sm', 24),
    ModelSummary(10,'1º Reis','1rs', 22),
    ModelSummary(11,'2º Reis','2rs', 25),
    ModelSummary(12,'1º Crônicas','1cr', 29),
    ModelSummary(13,'2º Crônicas','2cr', 36),
    ModelSummary(14,'Esdras','ed', 10),
    ModelSummary(15,'Neemias','ne', 13),
    ModelSummary(16,'Ester','et', 10),
    ModelSummary(17,'Jó','job', 42),
    ModelSummary(18,'Salmos','sl', 150),
    ModelSummary(19,'Provérbios','pv', 31),
    ModelSummary(20,'Eclesiastes','ec', 12),
    ModelSummary(21,'Cânticos','ct', 8),
    ModelSummary(22,'Isaías','is', 66),
    ModelSummary(23,'Jeremias','jr', 52),
    ModelSummary(24,'Lamentações de Jeremias','lm', 5),
    ModelSummary(25,'Ezequiel','ez', 48),
    ModelSummary(26,'Daniel','dn', 12),
    ModelSummary(27,'Oséias','os', 14),
    ModelSummary(28,'Joel','jl', 3),
    ModelSummary(29,'Amós','am', 9),
    ModelSummary(30,'Obadias','ob', 1),
    ModelSummary(31,'Jonas','jn', 4),
    ModelSummary(32,'Miquéias','mq', 7),
    ModelSummary(33,'Naum','na', 3),
    ModelSummary(34,'Habacuque','hc', 3),
    ModelSummary(35,'Sofonias','sf', 3),
    ModelSummary(36,'Ageu','ag', 2),
    ModelSummary(37,'Zacarias','zc', 14),
    ModelSummary(38,'Malaquias','ml', 4),
    ModelSummary(39,'Mateus','mt', 28),
    ModelSummary(40,'Marcos','mc', 16),
    ModelSummary(41,'Lucas','lc', 24),
    ModelSummary(42,'João','jo', 21),
    ModelSummary(43,'Atos','at', 28),
    ModelSummary(44,'Romanos','rm', 16),
    ModelSummary(45,'1ª Coríntios','1co', 16),
    ModelSummary(46,'2ª Coríntios','2co', 13),
    ModelSummary(47,'Gálatas','gl', 6),
    ModelSummary(48,'Efésios','ef', 6),
    ModelSummary(49,'Filipenses','fp', 4),
    ModelSummary(50,'Colossenses','cl', 4),
    ModelSummary(51,'1ª Tessalonicenses','1ts', 5),
    ModelSummary(52,'2ª Tessalonicenses','2ts', 3),
    ModelSummary(53,'1ª Timóteo','1tm', 6),
    ModelSummary(54,'2ª Timóteo','2tm', 4),
    ModelSummary(55,'Tito','tt', 3),
    ModelSummary(56,'Filemom','fm', 1),
    ModelSummary(57,'Hebreus','hb', 13),
    ModelSummary(58,'Tiago','tg', 5),
    ModelSummary(59,'1ª Pedro','1pe', 5),
    ModelSummary(60,'2ª Pedro','2pe', 3),
    ModelSummary(61,'1ª João','1jo', 5),
    ModelSummary(62,'2ª João','2jo', 1),
    ModelSummary(63,'3ª João','3jo', 1),
    ModelSummary(64,'Judas','jd', 1),
    ModelSummary(65,'Apocalipse','ap', 22)
  ];

  static List<ModelSummary> getSummary() => lista;


}

class ModelSummary{
  int idBook;
  String book;
  String abbrev;
  int chapters;
  

  ModelSummary(this.idBook, this.book, this.abbrev, this.chapters);

}

