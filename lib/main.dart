import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mht_com_task3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'mht_com_task3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListVue"),
        ),
        body: ListView(
          children: [
            _menuItem("メニュー1",Icon(Icons.settings)),
            _menuItem("メニュー2",Icon(Icons.map)),
            _menuItem("メニュー3",Icon(Icons.room)),
            _menuItem("メニュー4",Icon(Icons.local_shipping)),
            _menuItem("メニュー5",Icon(Icons.airplanemode_active)),
          ],
        ),
      ),
    );
  }
}

Widget _menuItem(String title,Icon icon){
  return Container(
    decoration: new BoxDecoration(
      border: new Border(bottom: BorderSide(width: 1.0,color: Colors.grey))
    ),
    child: ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0
        ),
      ),
      onTap: (){
        print("onTap called.");
      },
      onLongPress: (){
        print("onLongPress called");
      },
    ),
  );
}