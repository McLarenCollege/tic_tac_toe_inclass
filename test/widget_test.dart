import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:tic_tac_toe_starter/gamelogic.dart';

void main() {
  List<String> names = ['Hello', null, 'Goodbye'];


  test("test fullBoard", () {
    List<List<Token>> board = [
      [null, null, null],
      [null, null, null],
      [null, null, null]
    ];

    board[2][2] = Token.x;

    expect(fullBoard(board), false);

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