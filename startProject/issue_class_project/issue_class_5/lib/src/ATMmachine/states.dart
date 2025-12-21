part of 'machine.dart';

// ----------------------------------------------------------------------------
// Перечень всех состояний, в которых может находиться Банкомат

enum StatesATMMachine {
  rest,
  readCard,
  mainMenu,
  getCheck,
  inputPinCode,
  putMonay,
  getMonay,
}

abstract interface class State {
  void inputData(IATMMachine atmMachine);
  void insertMonay(IATMMachine atmMachine);
  void ejectMonay(IATMMachine atmMachine);
}

// ----------------------------------------------------------------------------
/// Класс состояния, описывающий режим ожидания банкомата

class RestState implements State {
  @override
  void inputData(IATMMachine atmMachine) {
    print("Вставте банковскую карту");
    atmMachine.setState(StatesATMMachine.readCard);
    
  }

  @override
  void insertMonay(IATMMachine atmMachine) {}

  @override
  void ejectMonay(IATMMachine atmMachine) {}
}

// ----------------------------------------------------------------------------
/// Класс состояния, описывающий режим проверки карты пользователя

class ReadCardState implements State {
  @override
  void inputData(IATMMachine atmMachine) {
    print("Имитация ввода карты --------------");
    late final parts;

    do {
      String? inputData = stdin.readLineSync();
      if (inputData != null) {
        parts = inputData.split(" ");
        if (parts != 2) {
          print("Неверно введенные данные");
          continue;
        }
      }
      break;
    } while (true);
    
    var [name, pinCode, ...] = parts;
    int pinCodeInt = int.parse(pinCode);
    
    atmMachine.simulationCardEntry(name, pinCodeInt);
    atmMachine.setState(StatesATMMachine.mainMenu);
  }

  @override
  void insertMonay(IATMMachine atmMachine) {}

  @override
  void ejectMonay(IATMMachine atmMachine) {}
}

// ----------------------------------------------------------------------------
/// Класс состояния, описывающий главное меню

class MainMenuState implements State{
  // Проверка ввода данных пользователем
  bool _checkUserChoise(String? c) {
    if (c != null && ["0", "1" , "2", "q"].contains(c)) {
      return true;
    }  
    return false;
  }

  @override
  void inputData(IATMMachine atmMachine) {
    StringBuffer selectAction = StringBuffer();
    bool userChoise = false;
    String? userChoiseStr;

    do {
      selectAction.write("""Выберете действие, которое хотите совершить:
        enter[0]: Выдать деньги
        enter[1]: Положить деньги
        enter[2]: Информация о состоянии счета
        enter[q]: Выйти из учетной записи
        choise >>"""
      );
      stdout.write(selectAction);
      String? userChoiseStr = stdin.readLineSync();
      userChoise = _checkUserChoise(userChoiseStr);
    } while(!userChoise);
    
    switch (userChoiseStr) {
      case("0"): atmMachine.setState(StatesATMMachine.getMonay); 
      case("1"): atmMachine.setState(StatesATMMachine.putMonay); 
      case("2"): atmMachine.setState(StatesATMMachine.getCheck);
      case("q"): atmMachine.setState(StatesATMMachine.rest);
    }
  }

  @override
  void insertMonay(IATMMachine atmMachine) {}

  @override
  void ejectMonay(IATMMachine atmMachine) {}
}

// ----------------------------------------------------------------------------
/// Класс состояния, описывающий состояния вывода состояния счета на экран

class GetCheckState implements State {
  @override
  void inputData(IATMMachine atmMachine) {}

  @override
  void insertMonay(IATMMachine atmMachine) {
    print("Верну информацию о состоянии счета");
    atmMachine.printAccountInfo();
  }

  @override
  void ejectMonay(IATMMachine atmMachine) {}
}