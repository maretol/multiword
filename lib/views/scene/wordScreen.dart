
import 'package:flutter/material.dart';
import 'package:multiwords/views/scene/commonScreen.dart';

class WordScreen extends StatefulWidget{
  @override
  _WordScreenState createState() => new _WordScreenState();
}

class _WordScreenState extends State<WordScreen>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(),
      drawer: new SideBar(),
      body: _createWordView(),
    );
  }
  // TODO : ここのListViewをWordManagerから持ってくるように変更
  ListView _createWordView(){
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/japan.png"),
          ),
          title: new Text("日本語"),
          subtitle: new Text("nʲihõŋŋo"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/us.png"),
          ),
          title: new Text("English"),
          subtitle: new Text("íŋɡlɪʃ"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/italy.png"),
          ),
          title: new Text("Italiano"),
          subtitle : new Text("itáljano")
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/germany.png"),
          ),
          title: new Text("Deutsch"),
          subtitle: new Text("dɔʏʧ"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/french.png"),
          ),
          title: new Text("Français"),
          subtitle: new Text("fʁɑ~sɛ"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/russia.png"),
          ),
          title: new Text("русский"),
          subtitle: new Text("ˈruskʲɪj"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/china.png"),
          ),
          title: new Text("简体字"),
          subtitle: new Text("jiǎntǐzì"),
        ),
        new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new AssetImage("staticdata/flags/taiwan.png"),
          ),
          title: new Text("繁體字"),
          subtitle: new Text("fántǐzì"),
        )
      ],
    );
  }
}