part of 'game.dart';

// расширение для значения размера поля 
extension type SizeBoard(int size) {
  bool get isValidSize {
    if (size < 0 && size > 9) {
      return false;
    } else {
      return true;
    }
  }
}

// класс игрового поля
class Board {
  late final int sizeBoard;
  late List<List<CellType>> board;
  int defaultSize = 3;

  Board(int inputSize) {
    if (SizeBoard(inputSize).isValidSize) {
      sizeBoard = inputSize;
    } else {
      print('Введено число выходящее за диапазон, установили дефолтное');
      sizeBoard = defaultSize;
    }  
    // генерация списка - списков с пустыми значениями
    board = List.generate(
      sizeBoard, 
      (_) => List.filled(
        sizeBoard, CellType.empty));
  }

  // отрисовка игрового поля в консоли
  void printBoard() {
    stdout.write('  ');
    for (int i = 0; i < sizeBoard; i ++) {
      stdout.write('${i + 2} ');
    }
    stdout.write('\n');
    for (int j = 0; j < sizeBoard; j++) {
      stdout.write('${j + 1} ');
      for (int q = 0; q < sizeBoard; q++) {
        switch(board[j][q]) {
          case (CellType.empty):
            stdout.write('. ');
          case (CellType.cross):
            stdout.write('X ');
          case (CellType.nought): 
            stdout.write('O ');
        }
      }
      stdout.write('\n');
    }
  }

  // проверка на то, является ли клетка пустой
  bool _makeMove(int x, int y) {
    return board[x][y] == CellType.empty;
  }

  // установка символа в клетку
  bool setSymbol(int x, int y, CellType cellType) {
    if (_makeMove(x, y)) {
      board[x][y] = cellType; 
      return true;
    }
    return false;
  }

  bool checkWin(CellType player) {
    for (int i = 0; i < sizeBoard; i++) {
      if (board[i].every((cell) => cell == player)) return true;
      if (board.every((row) => row[i] == player)) return true;
      if (List.generate(sizeBoard, (i) => board[i][i])
          .every((cell) => cell == player)) {
        return true;
      }
      if (List.generate(sizeBoard, (i) => board[i][sizeBoard - i - 1])
          .every((cell) => cell == player)) {
        return true;
      }
    }
    return false;
  }

  bool checkDrow() {
    return board.every((row) => row.every(
      (cell) => cell != CellType.empty));
  }
}