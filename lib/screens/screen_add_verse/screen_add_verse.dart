import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible_concordance/providers/db_nvi_bible.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/components/add_comment.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/components/button_send.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/components/show_verse_text.dart';
import 'package:my_bible_concordance/screens/screen_add_verse/global/global_state.dart';
import 'package:my_bible_concordance/utils/constants.dart';
import 'package:my_bible_concordance/utils/format_text.dart';
import 'package:my_bible_concordance/utils/sumary.dart';


class ScreenAddVerse extends StatelessWidget{
  final currentCollection;
  const ScreenAddVerse({Key? key, required this.currentCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCollection.collectionName, style: const TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 28, fontWeight: FontWeight.w800)),
        backgroundColor: kBackgroundColor,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: kBackgroundColor, statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        centerTitle: true,
        leadingWidth: 82,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar", style: TextStyle(color: Colors.green, fontSize: 17, fontWeight: FontWeight.w500))),
            ),
        
        actions: <Widget> [Container(child: const Icon(Icons.settings, color: Color.fromARGB(221, 145, 143, 143),), margin: EdgeInsets.only(right: 10),)],
      ),
      
      body: const SingleChildScrollView(child: AddVerseBody()),
      floatingActionButton: ButtonSend(currentCollection: currentCollection),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  
}

class AddVerseBody extends StatefulWidget {
  const AddVerseBody({Key? key}) : super(key: key);

  @override
  State<AddVerseBody> createState() => _AddVerseBodyState();
}

class _AddVerseBodyState extends State<AddVerseBody> {
  ModelSummary? selectedBook;
  int? selectedChapter;
  int? selectedInitialVerse;
  int? selectedFinalVerse;
  int rangeChapters = 0;
  int rangeVerses = 0;
  String? verseText;



  @override
  Widget build(BuildContext context) {
    store.set("selectedBook", () => selectedBook);
    store.set("selectedChapter", () => selectedChapter);
    store.set("selectedInitialVerse", () => selectedInitialVerse);
    store.set("selectedFinalVerse", () => selectedFinalVerse);
    store.set("verseText", () => verseText);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Center(
        child: Column(
          children: [
            const Text("Adicionar Verso", style: TextStyle(color: Colors.grey, fontSize: 18)),
            
            Row(children: [
              const Text("Livro: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              DropdownButton<ModelSummary>(
                value: selectedBook,
                icon:  const Icon(Icons.arrow_drop_down_outlined),
                hint: const Text("Selecionar"),
                style:  const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 1.5,
                  color: Colors.grey,
                ),
                onChanged: (ModelSummary? newValue) {
                  setState(() {
                    selectedBook = newValue!;
                    rangeChapters = newValue.chapters;
                    selectedChapter = null;
                    selectedInitialVerse = null;
                    selectedFinalVerse = null;

                  });
                },
                items: Summary.getSummary()
                    .map<DropdownMenuItem<ModelSummary>>((ModelSummary value) {
                  return DropdownMenuItem<ModelSummary>(
                    value: value,
                    child: Text(value.book),
                  );
                }).toList(),
              )
            ],),

            Row(children: [
              const Text("Capítulo: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: selectedChapter,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                hint: const Text("Selecionar"),
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 1.5,
                  color: Colors.grey,
                ),
                onChanged: (int? newValue) async {
                  selectedChapter = newValue!;
                  await DBNviBible.db.getRangeVerses(selectedBook!.idBook, selectedChapter!).then((value){
                      this.rangeVerses = value;
                    });
                  setState(() {
                    selectedInitialVerse = null;
                    selectedFinalVerse = null;

                  });
                },
                items: 
                  selectedBook != null ? 
                    <int>[for (var i = 1; i <= rangeChapters ; i++) i].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList() 
                  : null,
              )
            ],),

            Row(children: [
              const Text("Verso inicial: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: selectedInitialVerse,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                hint: const Text("Selecionar"),
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 1.5,
                  color: Colors.grey,
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    selectedInitialVerse = newValue!;
                    selectedFinalVerse = newValue;
                  });
                },
                items: 
                  selectedChapter != null ? 
                    <int>[for (var i = 1; i <= rangeVerses ; i++) i].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList() 
                  : null,
              )
            ],),

            Row(children: [
              const Text("Verso final: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: selectedFinalVerse,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                hint: const Text("Selecionar"),
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 1.5,
                  color: Colors.grey,
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    selectedFinalVerse = newValue!;
                  });
                },
                items: 
                  selectedInitialVerse != null ? 
                    <int>[for (var i = selectedInitialVerse!; i <= rangeVerses ; i++) i].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList() 
                  : null,
              )
            ],),

            if(selectedInitialVerse != null)
                FutureBuilder(
                  future: DBNviBible.db.getVerses(selectedBook!.idBook, selectedChapter!, selectedInitialVerse!, selectedFinalVerse!),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      
                      verseText = FormatText().formatar(snapshot.data!);
                      return 
                        ShowVerseText(
                          book: selectedBook!.book, 
                          chapter: selectedChapter, 
                          initialVerse: selectedInitialVerse, 
                          finalVerse: selectedFinalVerse, 
                          verseText: verseText!
                        );
                    }
                    else if(snapshot.hasError){
                      print("erro ao pegar os dados");
                      return Text('${snapshot.error}');
                    }
                    return const Center(child: CircularProgressIndicator());
                  }
                ),
                const AddComment(),
                const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

