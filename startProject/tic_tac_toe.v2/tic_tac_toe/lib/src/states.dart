part of 'game.dart';

enum GameStates {
  movePlayer,
  draw, 
  crossWin,
  noughtWin,
  quit
}

abstract interface class SharedState {
  void moveTransition(Game game) {}
  void exitGame(Game game) {}
}

// TODO: Реализовать классы состояний
class movePlayer implements SharedState {
  late final GameStates stateType;
  movePlayer(this.stateType);

  @override
  void moveTransition(Game game) {
    game._currentPlayer.nextPlayer();
  }

  @override
  void exitGame(Game game) {}
}

class Drow implements SharedState {
  @override
  void moveTransition(Game game) {}

  @override
  void exitGame(Game game) {}
}

class CrossWin implements SharedState {
  @override
  void moveTransition(Game game) {}

  @override
  void exitGame(Game game) {}
}

class NoughtWin implements SharedState {
  @override
  void moveTransition(Game game) {}

  @override
  void exitGame(Game game) {}
}

class Quit implements SharedState {
  @override
  void moveTransition(Game game) {}

  @override
  void exitGame(Game game) {}
}