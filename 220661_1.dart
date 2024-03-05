import 'dart:io';

void main() async {
  var inputstr = await stdin.readLineSync();
  var articles = ['a', 'an', 'the'];
  int sen_cnt = 0, wrds_cnt = 0, art_cnt = 0;

  int countArt(String inStr) {
    var artCount =
        inStr.split(' ').where((word) => articles.contains(word)).length;
    return artCount;
  }

  if (inputstr != null) {
    art_cnt = countArt(inputstr);

    for (int i = 0; i < inputstr.length; i++) {
      if (inputstr[i] == '.') {
        sen_cnt++;
        wrds_cnt++;
      } else if (inputstr[i] == ' ') {
        wrds_cnt++;
      } else if (inputstr[i] == ',') {
        wrds_cnt++;
      }
    }

    print(
        "Sentences: $sen_cnt \nCharacters: ${inputstr.length}\nWords: ${wrds_cnt}\nArticles: ${art_cnt}");
  } else {
    print("Oh thats Obvious!");
  }
}
