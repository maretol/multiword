import 'package:flutter/material.dart';


class WordData{
  Map<int, Map<String, Word>> wordMap;
  String version;

  WordData({version}){
    wordMap = new Map();
  }

  void addAllWords(dynamic covariant){
    if(covariant == null){
      debugPrint("covariantがnull");
      return;
    }
    for(var covariantItem in covariant){
      var id = covariantItem["id"];
      var words = covariantItem["words"];
      if(!(id is int) || !(words is List)){
        debugPrint("contents のリスト読み込みエラー");
        debugPrint("words is " + words.runtimeType.toString());
        debugPrint("id is " + id.runtimeType.toString());
        return; // 本来はエラーを投げる形に変える
      }

      Map<String, Word> wordData = new Map();
      for(var word in words){
        wordData[word["lang"].toString()] = convertWord(word);
      }

      wordMap[id] = wordData;
    }
  }

  Word convertWord(dynamic covariant){
    return new Word(
      lang: covariant["lang"].toString(),
      word: covariant["word"].toString(),
      reading: covariant["reading"].toString(),
      sex: covariant["sex"].toString(),
      article: covariant["article"].toString()
    );
  }

  Map<int, Map<String, Word>> getMap(){
    if(wordMap == null){
      debugPrint("Map is null");
      return null; // 本来はエラーを投げる
    }
    return wordMap;
  }
}

class Word{
  String lang;
  String word;
  String reading;
  String sex;
  String article;

  Word({this.lang, this.word, this.reading, this.sex, this.article});
}