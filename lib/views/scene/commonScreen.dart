import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget{
  @override
  _SideBarState createState() => new _SideBarState();
}

class _SideBarState extends State<SideBar>{
  @override
  Widget build(BuildContext context){
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new ListTile(
            onTap: (){Navigator.of(context).pushNamed("/setting");},
            title: new Text("設定",
              style: new TextStyle(fontSize: 19.0),
            ),
          ),
          new ListTile(
            onTap: null,
            title: new Text("フィードバック",
              style: new TextStyle(fontSize: 19.0),
            )
          )
        ],
      ),
    );
  }
}

class SettingPage extends StatefulWidget{
  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("設定"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("英語の背景はイギリス国旗にする"),
            subtitle: new Text("イギリス国旗でない場合アメリカ国旗になります"),
          ),
          new ListTile(
            title: new Text("名詞の色"),
          )
        ],
      ),
    );
  }
}