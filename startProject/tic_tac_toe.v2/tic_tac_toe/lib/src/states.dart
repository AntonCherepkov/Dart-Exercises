part of 'game.dart';

enum GameStates {
  movePlayer,
  draw, 
  crossWin,
  noughtWin,
  quit
}

interface class SharedState {
  void transitionProgress() {}
  void exitGame() {}
}

// TODO: Реализовать классы состояний
class movePlayer implements SharedState {
  @override
  void transitionProgress() {}

  @override
  void exitGame() {}
}

class Drow implements SharedState {
  @override
  void transitionProgress() {}

  @override
  void exitGame() {}
}

class CrossWin implements SharedState {
  @override
  void transitionProgress() {}

  @override
  void exitGame() {}
}

class NoughtWin implements SharedState {
  @override
  void transitionProgress() {}

  @override
  void exitGame() {}
}

class Quit implements SharedState {
  @override
  void transitionProgress() {}

  @override
  void exitGame() {}
}