class FormatText{
  String formatar(dynamic text){
    String textoFormatado = '';

    for(int i = 0 ; i < text.length ; i++){
      textoFormatado = textoFormatado + text[i]['text'];
    }

    return textoFormatado;
  }
}