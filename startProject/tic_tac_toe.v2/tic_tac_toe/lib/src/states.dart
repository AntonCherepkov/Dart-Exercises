part of 'game.dart';

enum GameStates {
  movePlayer,
  draw, 
  crossWin,
  noughtWin,
  quit
}

abstract interface class SharedState {
  void moveTransition(Game game);
  bool exitGame(Game game);
}

// ----------------------------------------------------------------------------
// Класс состояния игры, в котором игрок ходит
class movePlayer implements SharedState {
  @override
  void moveTransition(Game game) {
    while(true) {
      stdout.write("Введите координаты клетки через пробел: ");
      String? inputCellStr = stdin.readLineSync();
      if (inputCellStr == null) {
        print("Вы забыли ввести координаты!");
        continue;
      } else {
        List<int?> inputCellInt = List
            .from(inputCellStr
            .split(' ')
            .map((e) => int.tryParse(e)));
        if (inputCellInt.every((e) => e is! int)) {
          print('Введенное значение должно быть числом');
          continue;
        } else {
          var x = inputCellInt[0];
          var y = inputCellInt[1];
          bool resultState = game.gameBoard.setSymbol(
            x!, y!, game.currentPlayer.cellType);
          if (resultState) {
            break;
          } else {
            print('Неизвестная ошибка установки клетки');
            continue;
          }
        }
      }
    }
    return;
  }

  @override
  bool exitGame(Game game) => throw StateError('Invalid action for current state');
}

// ----------------------------------------------------------------------------
class Drow implements SharedState {
  @override
  void moveTransition(Game game) => throw StateError('Invalid action for current state');
  @override
  bool exitGame(Game game) => true;
}

// ----------------------------------------------------------------------------
class CrossWin implements SharedState {
  @override
  void moveTransition(Game game) => throw StateError('Invalid action for current state');
  @override
  bool exitGame(Game game) => true; 
}

// ----------------------------------------------------------------------------
class NoughtWin implements SharedState {
  @override
  void moveTransition(Game game) => throw StateError('Invalid action for current state');
  @override
  bool exitGame(Game game) => true;
}

// ----------------------------------------------------------------------------
class Quit implements SharedState {
  @override
  void moveTransition(Game game) => throw StateError('Invalid action for current state');
  @override
  bool exitGame(Game game) => true; 
}