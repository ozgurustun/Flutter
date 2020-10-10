import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(new MaterialApp(
      home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState () => new HomePageState();
}

class HomePageState extends State<HomePage>{

  final String url = "https://swapi.dev/api/people";
  List resultData;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      //Encode url
      Uri.encodeFull(url),
      //only accept json response
      headers: {"Accept" : "application/json"}
    );

    print(response.body);

    setState(() {
      var converJsonToString = jsonDecode(response.body);
      resultData = converJsonToString['results'];
    });

    return "Success";
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Retrieve Json via Http get"),
      ),
      body: new ListView.builder(
        itemCount: resultData == null ? 0 : resultData.length,
        itemBuilder: (BuildContext context, int index){
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(resultData[index]['name']),
                      padding: const EdgeInsets.all(20.0)
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}


