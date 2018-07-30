import 'package:flutter/material.dart';
import 'package:multiwords/views/scene/commonScreen.dart';
import 'package:multiwords/models/wordScreen/word.dart';

class MyApp extends StatefulWidget{
  @override
  _AppState createState()=>new _AppState();
}

class _AppState extends State<MyApp> with SingleTickerProviderStateMixin{

  _AppState(){
    new WordManager().startReadJson();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      drawer: new SideBar(),
      appBar: new AppBar(
        title: new Text("Multi Word ～多言語単語帳～"),
      ),
      body: _createMainMenu(),
    );
  }

  ListView _createMainMenu(){
    return new ListView(
      children: <Widget>[
        _createListTile("単語", "いろんな言語の単語を表示します", true, "/word"),
        _createListTile("短文", "いろんな言語の短文を表示します", false, "/sentence"),
        _createListTile("単語検索", "単語から検索して各言語の意味を調べます", false, "/search")
      ],
    );
  }

  ListTile _createListTile(text, sentence, enable, key){
    return new ListTile(
      title: new Text(text,
        style: new TextStyle(fontSize: 26.0),
      ),
      subtitle: new Text(sentence, style: new TextStyle(fontSize: 18.0),),
      enabled: enable,
      onTap: (){Navigator.of(context).pushNamed(key);},
    );
  }
}