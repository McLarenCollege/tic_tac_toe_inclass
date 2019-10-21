import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:tic_tac_toe_starter/gamelogic.dart';

void main() {




  test("test fullBoard", () {

    board[2][2] = Token.x;

    expect(fullBoard(board), false);

  });


  test('Test changePlayerIfGameIsNotOver is correct if empty', (){

    expect(currentPlayer, Token.x);

    changePlayerIfGameIsNotOver();

    expect(currentPlayer, Token.o);

  });


  test('Test changePlayerIfGameIsNotOver does nothing if board is draw', ()
  {

    currentPlayer = Token.x;
    board = [
      [Token.x, Token.x, Token.o],
      [Token.o, Token.x, Token.x],
      [Token.x, Token.o, Token.o]
    ];
    changePlayerIfGameIsNotOver();
    expect(currentPlayer, Token.x);
  });


  test('Test changePlayerIfGameIsNotOver does nothing if o is winner', ()
  {
    currentPlayer = Token.x;
    board = [
      [Token.x, Token.x, Token.o],
      [Token.o, Token.x, Token.x],
      [Token.x, Token.o, Token.x]
    ];
    changePlayerIfGameIsNotOver();
    expect(currentPlayer, Token.x);
  });



}


bool containsNull(List<String> names) {
  for (int i = 0; i < names.length; i++) {
    if (names[i] == null) {
      return true;
    }
  }
  return false;
}