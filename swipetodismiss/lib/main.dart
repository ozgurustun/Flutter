import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Swipe To Dismiss App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Swipe to dismiss..."),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new Dismissible(
            key: new Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("Items dismissed!")));
            },
            background: new Container(
              child: new Text(
                "Deleting!",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
            ),
            child: new ListTile(
              title: new Text("${items[index]}"),
            ),
          );
        },
      ),
    );
  }
}
