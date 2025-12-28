import 'dart:io';

part 'board.dart';
part 'cell_type.dart';
part 'states.dart';
part 'player.dart';

class Game {
  late SharedState _currentState;
  late Player _currentPlayer;
  Map <GameStates, SharedState> mapStates = {
    GameStates.movePlayer: movePlayer(),
    GameStates.draw: Drow(),
    GameStates.crossWin: CrossWin(),
    GameStates.noughtWin: NoughtWin(),
    GameStates.quit: Quit()
  };

  void set setState(SharedState state) => _currentState = state;
  void set setPlayer(Player player) => _currentPlayer = player;
  void transitionProgress() => _currentState.transitionProgress();
  void exitGame() => _currentState.exitGame();

  void processGames() {

  }
}