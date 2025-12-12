import 'package:uuid/uuid.dart';

typedef Json = Map<String, dynamic>;

/// -----------------------------------------------------------------------------------------------
class SmartDevice {
  late String _id;
  final String name;
  bool? isOnline;

  String get id => _id;

  // Базовый конструктор базового класса. 
  // ID генерится при инициации экз-ра 
  // Если isOnline не указан, то делаем его false
  SmartDevice(this.name, [this.isOnline]) {
    var uuid = Uuid().v4();
    _id = uuid;
    isOnline = isOnline ?? false;
  }
  
  // Именной конструктор базового класса.
  // Использует базовый конструктор для ген. ID */
  SmartDevice.defaultNamed({
    required name, 
    required isOnline
  }) : this(name, isOnline);

  // Фабричный конструктор базового класса.
  // Использует разные сценарии для создания экз. дочерних классов
  factory SmartDevice.create({name, isOnline, json}) {
    for (var MapEntry(:key, :value) in json.entries) {
      if (key == "type") {
        switch (value) {
          case ("light"):
            return SmartLight.whiteDefault(name: name, isOnline: isOnline);
          // case ("thermostat"):
          //   return SmartThermostat();
          // case ("cam") :
          //   return SmartCamera();
          case _:
            throw ArgumentError("Не известный аргумент: ${value}");
        }
      } else {
        throw ArgumentError("Не известный аргумент: ${key}");
      }
    }
    print('Не смогли создать дочернего класса по предоставленным данным!');
    return SmartDevice(name, isOnline);
  }
}

/// -----------------------------------------------------------------------------------------------
class SmartLight extends SmartDevice {
  late int _brightness;
  late String _color;

  int get brightness => _brightness;
  String get colore => _color;
  set brightness(int value) => _brightness = value;
  set color(String value) => _color = value; 

  SmartLight(
    super.name, 
    super.isOnline,
    _brightenss, 
    _colore, 
    );

  SmartLight.whiteDefault({
    required super.name,
    required super.isOnline,
    brightness = 100, 
    color = "white"
  }): _brightness = brightness, 
      _color = color,
      super.defaultNamed();
}

/// -----------------------------------------------------------------------------------------------

// class SmartThermostat extends SmartDevice {
//   SmartThermostat(super.name);
// }
// class SmartCamera extends SmartDevice {}