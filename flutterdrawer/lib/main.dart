import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdrawer/new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: new HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => new NewPage("Routing new page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ozgur Ustun"),
              accountEmail: new Text("ozgurustundev@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: new Text("P"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: new Text("P"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NewPage("Page 1")));
              },
            ),
            new ListTile(
              title: new Text("Page 2"),
              trailing: new Icon(Icons.arrow_left),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NewPage("Page 2")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}
