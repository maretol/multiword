import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:multiwords/models/wordScreen/worddata.dart';
import 'dart:math';

class WordManager{

  WordContentAdapter adapter;
  WordContent content;

  WordManager(){
    adapter = new WordContentAdapter(_Mode.local);
    content = new WordContent();
  }

  void startReadJson(){
    adapter.getJson();
    adapter.readJson();
    content.setWordContent(adapter.getParsedJson());
  }

  Map<String, Word> getRandomWord(){
    return content.getRandom();
  }
}

enum _Mode{
  test, database, local
}

class WordContentAdapter{
  _Mode mode;
  String rowJson;
  Map<int, Map<String, Word>> parsedJson;

  WordContentAdapter(_Mode mode){
    this.mode = mode;
  }

  // json データを取得
  void getJson(){
    if (mode == _Mode.test){
      rowJson = "" ;//rootBundle.loadString('staticdata/test/testdata.json');
    }else if(mode == _Mode.local){
      rowJson = TestData.rowJson();
    }
    rowJson = ""; // 本来はエラー発生
  }

  // json データを解析
  void readJson(){
    var decodedData = json.decode(rowJson);
    WordData wd = new WordData();
    wd.addAllWords(decodedData["contents"]);
    parsedJson = wd.getMap();
  }

  Map<int, Map<String, Word>> getParsedJson(){
    return parsedJson;
  }
}


class WordContent{
  Map<int, Map<String, Word>> wordContent;
  
  WordContent(){
    wordContent = new Map();
  }

  void setWordContent(Map<int, Map<String, Word>> content){
    wordContent = content;
  }

  Map<String, Word> getRandom(){
    var values = wordContent.values;
    return values.toList()[new Random().nextInt(values.length)];
  }
}

// ただJSONの文字列を取得するためだけのクラスとメソッド。将来的に消す
class TestData{
  static String rowJson(){
    return '{"version": "0.0.0","contents":[{"id": 0,"words": [{"lang": "ja","word": "りんご","reading": "???","sex": "none","article": "none"},{"lang": "en","word": "apple","reading": "???","sex": "none","article": "an"},{"lang": "it","word": "mele","reading": "???","sex": "???","article": "???"},{"lang": "fr","word": "pomme","reading": "???","sex": "???","article": "???"},{"lang": "de","word": "apfelbaum","reading": "???","sex": "???","article": "???"},{"lang": "ru","word": "яблоки","reading": "???","sex": "???","article": "???"}]}]}';
  }
}