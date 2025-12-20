import 'dart:io';

part 'states.dart';

/// Заглушка, содержит пользоватей и пин
Map<String, int> _usersRegistry = {
  "oneCard": 1234,
  "twoCard": 2345,
  "threeCard": 3256,
  "fourCard": 4567,
  "fiveCard": 5678,
  "sixCard": 6789
};

// ----------------------------------------------------------------------------

abstract interface class IATMMachine{
  // TODO: Описать методы, которые будет содержать банкомат
  void setState(StatesATMMachine state);
  void simulationCardEntry();
  bool _userConfirmation();
  void printAccountInfo();
}

// ----------------------------------------------------------------------------

class AtmMachine implements IATMMachine {
  // Поля для управления состояниями банкомата
  late State _currentState;

  final Map<StatesATMMachine, State> _allStates = {
    StatesATMMachine.rest: RestState(),
    StatesATMMachine.readCard: ReadCardState(),
    StatesATMMachine.mainMenu: MainMenuState(),
    StatesATMMachine.getCheck: GetCheckState()
  };

  @override
  void setState(StatesATMMachine state) {
    _currentState = _allStates[state];
  }

}

// ----------------------------------------------------------------------------