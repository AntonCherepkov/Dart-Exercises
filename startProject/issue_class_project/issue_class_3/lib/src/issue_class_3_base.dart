import 'package:uuid/uuid.dart';

typedef Json = Map<String, dynamic>;

class SmartDevice {
  late String _id;
  final String name;
  bool isOnline;

  String get id => _id;
  // set setID(String number) => this._id = number;

  /** Базовый конструктор базового класса. 
   * ID генерится при инициации экз-ра */
  SmartDevice(this.name, {this.isOnline = false}) {
    var uuid = Uuid().v4.toString();
    _id = uuid;
  }
  
  /** Именной конструктор базового класса.
   * Использует базовый конструктор для ген. ID */
  SmartDevice.defaultNamed({name, isOnline = true}) 
    : this(name, isOnline: isOnline);

  /** Фабричный конструктор базового класса.
   * Использует разные сценарии для создания экз. дочерних классов */
  factory SmartDevice.create(Json json) {
    for (var MapEntry(:key, :value) in json.entries) {
      if (key == "type") {
        switch (value) {
          case ("light"):
            return 
        }
      }
    }
  }
}

class SmartLight extends SmartDevice {}
class SmartThermostat extends SmartDevice {}
class SmartCamera extends SmartDevice {}