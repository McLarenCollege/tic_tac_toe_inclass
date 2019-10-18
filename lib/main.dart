import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'gamelogic.dart';

//import 'package:flutter/animation.dart';

void main() {
//  List<List<Icon>> board = [
//    [null, null, null],
//    [null, null, null],
//    [null, null, null]
//  ];
//
//  board[2][2] = xIcon;
//  print(fullBoard(board));
  runApp(MaterialApp(
    home: TicTacToePage(),
  ));
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  void winnerPopup() {
    if (winnerCheck(board)) {
      currentPlayer = "${currentPlayer.substring(7, 9)} Won";
    } else if (fullBoard(board)) {
      currentPlayer = "draw";
    } else {
      changePlayer(currentPlayer);
    }
  }


  Widget createIconFromToken(Token t) {
    if (t == null) {
      return null;
    }
    if (t == Token.x) {
      return Icon(
        Icons.close,
        size: 90,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.radio_button_unchecked,
        size: 90,
        color: Colors.white,
      );
    }


  }


  Color createColorFromBool(bool isHighlighted) {
    if (isHighlighted) {
      return Colors.yellow.withOpacity(0.2);
    }
    else {
      return Colors.white24;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6AA7C),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background2.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Tic-Tac-Toe",
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "$currentPlayer",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[0][0]),
                              backgroundColor: createColorFromBool(colorBoard[0][0]),
                              onPressed: () {
                                updateBox(0, 0);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[0][1]),
                              backgroundColor: createColorFromBool(colorBoard[0][1]),
                              onPressed: () {
                                updateBox(0, 1);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[0][2]),
                              backgroundColor: createColorFromBool(colorBoard[0][2]),
                              onPressed: () {
                                updateBox(0, 2);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[1][0]),
                              backgroundColor: createColorFromBool(colorBoard[1][0]),
                              onPressed: () {
                                updateBox(1, 0);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[1][1]),
                              backgroundColor: createColorFromBool(colorBoard[1][1]),
                              onPressed: () {
                                updateBox(1, 1);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[1][2]),
                              backgroundColor: createColorFromBool(colorBoard[1][2]),
                              onPressed: () {
                                updateBox(1, 2);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[2][0]),
                              backgroundColor: createColorFromBool(colorBoard[2][0]),
                              onPressed: () {
                                updateBox(2, 0);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[2][1]),
                              backgroundColor: createColorFromBool(colorBoard[2][1]),
                              onPressed: () {
                                updateBox(2, 1);
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: OneBox(
                              buttonChild: createIconFromToken(board[2][2]),
                              backgroundColor: createColorFromBool(colorBoard[2][0]),
                              onPressed: () {
                                updateBox(2, 2);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: FlatButton(
                        color: Color(0xFF848AC1),
                        onPressed: () {
                          gameReset();
                          setState(() {});
                        },
                        child: Text("Reset",
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateBox(int r, int c) {
    if (legitMove(board[r][c])) {
      if (currentPlayer == 'Player X Move') {
        board[r][c] = Token.x;
      } else {
        board[r][c] = Token.o;
      }
      winnerPopup();
    }
  }
}

class OneBox extends StatelessWidget {
  final Widget buttonChild;
  final Function onPressed;
  final Color backgroundColor;
  OneBox(
      {this.buttonChild = const Text(''),
      this.onPressed,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 600),
            opacity: buttonChild == null ? 0.0 : 1.0,
            child: buttonChild),
        onPressed: onPressed,
      ),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
    );
  }
}
