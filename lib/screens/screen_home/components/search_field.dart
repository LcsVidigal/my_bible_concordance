
import 'package:flutter/material.dart';
import 'package:my_bible_concordance/utils/constants.dart';

class SearchField extends StatelessWidget{
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: screenSize.width - 50,
      child: const TextField(
        cursorColor: Colors.grey,
        maxLength: 20,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: kCardCollectionsColor,
          contentPadding: EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: kBorderCardCollectionsColor, width: 1.2, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: kBorderCardCollectionsColor, width: 1.2, style: BorderStyle.solid)),
          hintText: "Pesquisar",
        ),
      ),
    );
  }
  
}