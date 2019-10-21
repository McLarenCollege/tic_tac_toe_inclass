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
      return Colors.yellow.withOpacity(0.6);
    }
    else {
      return Colors.white24;
    }
  }

  Widget createExpandedCell(int row, int col) {
    return Expanded(
      child: OneBox(
        buttonChild: createIconFromToken(board[row][col]),
        backgroundColor: createColorFromBool(colorBoard[row][col]),
        onPressed: () {
          updateBox(row, col);
          setState(() {});
        },
      ),
    );
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
                child: createStatusWidget(),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  children: <Widget>[
                    createExandedRow(0),
                    createExandedRow(1),
                    createExandedRow(2),
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

  Widget createStatusWidget() {
    Text text = Text(
                getCurrentStatus(),
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: 'Quicksand'),
              );
    if (winnerCheck(board)) {
      return BouncingText(text);
    }
    else {
      return text;
    }
  }

  void updateBox(int r, int c) {
    if (legitMove(board[r][c])) {
      board[r][c] = currentPlayer;
      changePlayerIfGameIsNotOver();
    }
  }

  Widget createExandedRow(int row) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          createExpandedCell(row, 0),
          createExpandedCell(row, 1),
          createExpandedCell(row, 2),
        ],
      ),
    );

  }
}

class BouncingText extends StatefulWidget {

  final Text text;

  BouncingText(this.text);

  @override
  _BouncingTextState createState() => _BouncingTextState();
}

class _BouncingTextState extends State<BouncingText> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(child: widget.text, alignment: Alignment.topCenter,
      scale: Tween(begin: 1.0, end: 1.4).animate(CurvedAnimation(parent: _controller, curve:Curves.easeInOut)),);
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: buttonChild == null ? 0.0 : 1.0,
            child: buttonChild),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    );
  }
}
