import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MyHomePage(title: 'mht_com_task2(A画面)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayATextA = "Everything is a Widget";
  String displayATextB = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  displayATextA,
                  style:const TextStyle(fontSize: 30),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 30.0),
                ),
                const Text("上記の文字は画面Bに引き継がれます"),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 100.0),
                ),
                Text(
                  displayATextB,
                  style:const TextStyle(fontSize: 25),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 30.0),
                ),
                const Text("上記の文字は画面B=>画面Aに引き継がれたワードです")
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NextPage(displayATextA),
                )
            );
            setState(() {
              displayATextB = result;
            });
            showDialog(
                context: context,
                builder: (context){
                  return SimpleDialog(
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Text(displayATextB),
                      )
                    ],
                  );
                }
            );
          },
          tooltip: 'Increment',
          child: const Text('次へ'),
        )
    );
  }
}

class NextPage extends StatelessWidget {
  NextPage(this.displayTextA, {Key? key}) : super(key: key);
  final String displayTextA;
  // TextEditingControllerは文章をバインドするDartAPI
  final myController = TextEditingController();
  String displayATextB = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("mht_com_task2(B画面)"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              displayTextA,
              style:const TextStyle(fontSize: 30),
            ),
            ConstrainedBox(
              constraints:const BoxConstraints.expand(height: 30.0),
            ),
            const Text("上記の文字は画面Aから引き継がれた文字です"),
            ConstrainedBox(
              constraints:const BoxConstraints.expand(height: 100.0),
            ),
            // Text(
            //   displayATextB,
            //   style: TextStyle(fontSize: 25),
            // ),
            ConstrainedBox(
              constraints:const BoxConstraints.expand(height: 30.0),
            ),
            SizedBox(
              width: 350.0,
              child:TextField(
                cursorWidth: 60.0,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'ここに文字を入力',
                ),
                onChanged: (text) {
                  displayATextB = text;
                },
              ) ,
            ),
            const Text("上記の入力されたテキストフィールドは"),
            const Text("画面B=>画面Aに引き継がれるテキストです")
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(displayATextB);
          },
          child:const Text('戻る'),
        ));
  }
}