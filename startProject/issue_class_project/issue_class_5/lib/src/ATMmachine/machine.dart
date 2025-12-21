import 'dart:io';

part 'states.dart';
part 'user.dart';

/// Заглушка, содержит пользоватей и пин
Map<String, AccountUser> _usersRegistry = {
  "oneCard": AccountUser("oneCard", "oneName", 1234, 1000),
  "twoCard": AccountUser("twoCard", "twoName", 2345, 5000),
  "threeCard": AccountUser("threeCard", "threeName", 3456, 13543),
  "fourCard": AccountUser("fourCard", "fourName", 4567, 23523),
  "fiveCard": AccountUser("fiveCard", "fiveName", 5678, 34242),
  "sixCard": AccountUser("sixCard", "sixName", 6789, 21312)
};

// ----------------------------------------------------------------------------

abstract interface class IATMMachine{
  // TODO: Описать методы, которые будет содержать банкомат
  void setState(StatesATMMachine state);
  bool simulationCardEntry(String cardName, int pinCode);
  void printAccountInfo();
  void startWorking();
}

// ----------------------------------------------------------------------------

class AtmMachine implements IATMMachine {
  // Поля для управления состояниями банкомата
  late State _currentState;
  late AccountUser _currentUser;

  final Map<StatesATMMachine, State> _allStates = {
    StatesATMMachine.rest: RestState(),
    StatesATMMachine.readCard: ReadCardState(),
    StatesATMMachine.mainMenu: MainMenuState(),
    StatesATMMachine.getCheck: GetCheckState()
  };

  // TODO: Дополнить сколько денег в банкомате
  AtmMachine() {
    _currentState = _allStates[StatesATMMachine.rest]!;
  }

  @override
  void setState(StatesATMMachine state) {
    this._currentState = _allStates[state]!;
  }

  @override
  bool simulationCardEntry(String cardName, int pinCode) {
    print('Проверка карты ------');
    if (_usersRegistry.containsKey(cardName)) {
      AccountUser user = _usersRegistry[cardName]!;
      if (pinCode == user.pinCode) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }

  @override
  void printAccountInfo() {
    print(_currentUser.toString());
  }

  void inptuData() {
    return _currentState.inputData(this);
  }

  void insertMonay() {
    return _currentState.insertMonay(this);
  }

  void ejectMonay() {
    return _currentState.ejectMonay(this);
  }

  @override
  void startWorking() {
    _currentState = _allStates[StatesATMMachine.readCard]!;
    _currentState.inputData(this);
  }
}

// ----------------------------------------------------------------------------