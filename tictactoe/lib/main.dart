import 'package:flutter/material.dart';
import 'package:tictactoe/home_page.dart';

void main() => runApp(new TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Tic Tac Toe",
      theme: new ThemeData(primaryColor: Colors.black),
      home: new HomePage(),
    );
  }
}

