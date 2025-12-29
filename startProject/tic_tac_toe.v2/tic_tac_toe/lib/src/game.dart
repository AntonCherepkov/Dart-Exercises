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
  
  List<Player> _players = [
    Player(CellType.cross), 
    Player(CellType.nought)
  ];
  
  Map<GameStates, SharedState> mapStates = {
    GameStates.movePlayer: movePlayer(),
    GameStates.draw: Drow(),
    GameStates.crossWin: CrossWin(),
    GameStates.noughtWin: NoughtWin(),
    GameStates.quit: Quit()
  };

  Player get _getRandomPlayer {
    return _players[Random().nextInt(_players.length)];
  } 


  void set setState(SharedState state) => _currentState = state;
  void set setPlayer(Player player) => _currentPlayer = player;
  void moveTransition() => _currentState.moveTransition(this);
  void exitGame() => _currentState.exitGame(this);

  Game(){
    // инициализация текущего пользователя
    _currentPlayer = _getRandomPlayer;

    // установка состояния
    var state = mapStates[GameStates.movePlayer];
    if (state == null) {
      throw StateError('Ошибка установки состояния');
    }
    setState = mapStates[state]!;

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

  void processGames() {

  }
}