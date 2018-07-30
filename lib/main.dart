import 'package:flutter/material.dart';
import 'views/scene/firstScreen.dart';
import 'views/scene/commonScreen.dart';
import 'views/scene/wordScreen.dart';


void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      "/setting": (BuildContext context) => new SettingPage(),
      "/word": (BuildContext context) => new WordScreen(),
      "/sentence": null,
      "/search": null
    },
  )
);