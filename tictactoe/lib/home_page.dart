import 'package:flutter/material.dart';
import 'package:tictactoe/game_underscore_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList;

  @override
  void initState() {
    super.initState();
    buttonList = doInit();
  }

  List<GameButton> doInit() {
    var gameButton = <GameButton>[
      new GameButton(1),
      new GameButton(2),
      new GameButton(3),
      new GameButton(4),
      new GameButton(5),
      new GameButton(6),
      new GameButton(7),
      new GameButton(8),
      new GameButton(9),
    ];
    return gameButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Tic Tac Toe Game"),
        ),
        body: new GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0
          ),
          itemCount: buttonList.length,
          itemBuilder: (context, i) => new SizedBox(
            width: 100.0,
            height: 100.0,
            child: new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: null,
              child: new Text(
                buttonList[i].text,
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: buttonList[i].background,
              disabledColor: buttonList[i].background,
            ),
          ),
        )
    );
  }
}
