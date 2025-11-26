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

  while (statusGame == gameContinue) {
    StringBuffer messageByGamer = StringBuffer();
    messageByGamer.write(
      "Ходит -> ${gameSigns[currentPlayer]}, введите координаты (x, y) или [q] для выхода: "
    );

    bool isValidInput = true;
    while (isValidInput) {
      String? input = stdin.readLineSync();
      
      if (input == null) {
        print('Неудачная попытка ввода!');
        continue;
      } else if (input == 'q') {
        print('Выход из программы');
        return;
      }

      final [x_, y_, ...] = input.split(' ');
      int? x = int.tryParse(x_);
      int? y = int.tryParse(y_);

      if (x == null || y == null) {
        print('Неудачная попытка ввода!');
        continue;
      } else {
        x--; y--;
      }
      
      if (x < 1 || x >= boardSize || y < 1 || y >= boardSize ) {
        print('Введенные числа выходят за рамки индекса');
        continue;
      } else if (board[x][y] != empty) {
        print('Клетка уже занята');
      } else if (board[x][y] == empty) {
        isValidInput = false;
        board[x][y] = currentPlayer;

        // Проверки всех выигрышных комбинаций
      }
      
    }
  currentPlayer = currentPlayer == cross ? zero : cross;
  }
}
