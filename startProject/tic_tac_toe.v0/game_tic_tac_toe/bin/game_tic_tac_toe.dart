import 'dart:io';

Map<int, String> statusGame = {
  0: 'Игра продолжается',
  1: 'Победа ноликов',
  2: 'Победа крестиков', 
  3: 'Ничья'
};

Map<int, String> gameSigns = {
  0: '.',
  1: 'X',
  2: '0'
};

// эквивалент фигурок
const int empty = 0;
const int cross = 1;
const int zero = 2;

// статусы игры
const int gameContinue = 0; // Продолжение игры
const int vinCross = 1;     // Крестики выиграли
const int vinZero = 2;      // Нолики выиграли
const int draw = 3;         // Ничья


void main(List<String> arguments) {
  late List<List<int>> board;
  int boardSize = 3;

  int currentState = gameContinue;
  int currentPlayer = cross;

  while(true) {
    stdout.write('Введите размерность клеток: ');
    var size = int.tryParse(stdin.readLineSync() ?? '') ?? boardSize;
    boardSize = (size > boardSize) ? size : boardSize;

    if (size < 3 || size > 9) {
      print('Размерность поля от 3 до 9');
      boardSize = 3;
      continue;
    }

    board = List.generate(
      size,
      (_) => List.filled(boardSize, empty));
    break;
  }

  while (currentState == gameContinue) {
    // Отрисовка в начале каждого цикла
    stdout.write('  ');
    for (int i = 0; i < boardSize; i++) {
      stdout.write('${i + 1} ');
    }
    stdout.write('\n');
    for (int j = 0; j < boardSize; j++) {
      stdout.write('${j + 1} ');
      for (int q = 0; q < boardSize; q++) {
        stdout.write('${gameSigns[board[j][q]]} ');
      }
      stdout.write('\n');
    }
    break;
  }

    // stdout.write('Введите координаты для установки -> ${gameSigns[currentPlayer]}: ');
    // List<int> coord = stdin.readLineSync()!.split(' ');
}
