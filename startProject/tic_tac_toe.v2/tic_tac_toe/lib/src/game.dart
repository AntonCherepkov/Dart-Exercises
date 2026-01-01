import 'dart:io';
import 'dart:math';

part 'board.dart';
part 'cell_type.dart';
part 'states.dart';
part 'player.dart';

class Game {
  late SharedState _currentState;
  late Player _currentPlayer;
  late Board gameBoard;
  
  final List<Player> _players = [
    Player(CellType.cross), 
    Player(CellType.nought)
  ];
  
  final mapStates = <GameStates, SharedState>{
    GameStates.movePlayer: movePlayer(),
    GameStates.draw: Drow(),
    GameStates.crossWin: CrossWin(),
    GameStates.noughtWin: NoughtWin(),
    GameStates.quit: Quit()
  };

  Player get currentPlayer => _currentPlayer;
  Player get _getRandomPlayer => _players[Random().nextInt(_players.length)];
  SharedState get currentState => _currentState;

  set setState(SharedState state) => _currentState = state;
  set setPlayer(Player player) => _currentPlayer = player;
  void moveTransition() => _currentState.moveTransition(this);
  bool exitGame() => _currentState.exitGame(this);

  Game() {
    // инициализация текущего пользователя
    _currentPlayer = _getRandomPlayer;

    // установка состояния
    var state = mapStates[GameStates.movePlayer];
    if (state == null) {
      throw StateError('Ошибка установки состояния');
    }
    setState = state;

    // инициализация игрового поля
    var sizeInt;
    while (true) {
      stdout.write('Введите размер игрового поля: ');
      String? inputSize = stdin.readLineSync();
      if (inputSize == null) {
        print('Вы должны ввести значение!');
        continue;
      } else {
        sizeInt = int.tryParse(inputSize);
        if (sizeInt is int) {
          break;
        } else {
          print('Необходимо ввести числовое значение!');
          continue;
        }
      }
    }
    gameBoard = Board(sizeInt);
  }

  /**
   * Основной метод игрового процесса должен быть максимально абстракным для 
   * большей гибкости. В ходе выполнения проверяются результаты действий
   * игроков и меняюстя состояния игрового процесса
   */
  void processGames() {
    // 1) Отображение поля перед ходом игрока
    gameBoard.printBoard();
    
    // Игровой цикл
    while(_currentState is movePlayer) {
      // 2) Ход игрока
      moveTransition();
      // 3) Проверка завершения игры
      if (gameBoard.checkWin(currentPlayer.cellType)) {
        // 4) Победа крестиков
        if (currentPlayer.cellType == CellType.cross) {
          setState = mapStates[GameStates.crossWin]!;
          break;
        // 5) Победа ноликов
        } else if (currentPlayer.cellType == CellType.nought) {
          setState = mapStates[GameStates.noughtWin]!;
          break;
        }
      }
      // 6) Ничья
      if (gameBoard.checkDrow()) {
        setState = mapStates[GameStates.draw]!;
        break;
      }
      gameBoard.printBoard();
      currentPlayer.nextPlayer();
    }
    if (exitGame()) {
      gameBoard.printBoard;
      print('Игра завершена');
      if (gameBoard.winner != null && gameBoard.winner != CellType.empty) {
        print("Победа игрока: ${currentPlayer.symbol}");
      }
    }
  }
}