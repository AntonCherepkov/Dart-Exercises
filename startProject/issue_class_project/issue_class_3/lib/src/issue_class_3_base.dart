import 'package:uuid/uuid.dart';

typedef Json = Map<String, dynamic>;

// ------------------------------------------------------------------------------------------------
// Базовый класс

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
          case ("thermostat"):
            return SmartThermostat.defaultNamed(
              name: name, isOnline: isOnline, temperature: 20.0, ecoMode: true);
          case ("cam") :
            return SmartCamera.named(
              name: name, isOnline: isOnline, storageMb: 512, isRecording: true);
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

  void turnOn() => isOnline = true;
  void turnOff() => isOnline = false;
  void reboot() {
    print("Перезагрузка: ");
    turnOff();
    print("Выключено");
    turnOn();
    print("Включено");
  }
}

// ------------------------------------------------------------------------------------------------
// Дочерний класс Лампы

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

  @override
  void reboot() {
    brightness = brightness < 20 ? 20 : brightness;
    super.reboot();
  }
}

// ------------------------------------------------------------------------------------------------
// Дочерний класс Термостата 

class SmartThermostat extends SmartDevice {
  late double? temperature;
  bool ecoMode;

  SmartThermostat(
    name,
    isOnline,
    this.temperature,
    this.ecoMode
  ): super(name, isOnline);

  SmartThermostat.defaultNamed({
    required super.name,
    required super.isOnline,
    temperature,
    ecoMode
  }): this.temperature = temperature,
      this.ecoMode = ecoMode,
      super.defaultNamed();

  @override
  void turnOn() {
    ecoMode = false;
    super.turnOn();
  } 
}

// ------------------------------------------------------------------------------------------------
class SmartCamera extends SmartDevice {
  late bool isRecording;
  late final int storageMb;
  
  SmartCamera(
    super.name,
    super.isOnline,
    this.storageMb,
    {isRecording = false}
  );

  SmartCamera.named({
    name, isOnline, storageMb, isRecording
  }): this(name, isOnline, storageMb, isRecording: false);

  factory SmartCamera.fromStorage(name, isOnline, storageMb) {
    if (storageMb < 511) {
      return SmartMiniCamera.limitedStorage(
        name: name, isOnline: isOnline, storageMb: storageMb);
    } else {
      return SmartCamera(name, isOnline, storageMb);
    }
  }

  @override
  void turnOff() {
    isRecording = false;
    super.turnOff();
  }
}

// ------------------------------------------------------------------------------------------------
// Дочерний от дочернего класса 

class SmartMiniCamera extends SmartCamera {  

  // ограничение по объему памяти для Mini камеры
  static int storageLimit(storage) => storage = storage <= 256 ? storage : 256;

  SmartMiniCamera.limitedStorage({
    name, isOnline, storageMb
  }): super.named(name: name, isOnline: isOnline, storageMb: storageLimit(storageMb));
}

// ------------------------------------------------------------------------------------------------

typedef SmartHome = List<SmartDevice>;

class DeviceGroup {
  SmartHome devices = [];

  SmartDevice operator[](int index) {
    if (index < 0 || index > devices.length) {
      throw IndexError.withLength(
        index, devices.length, message: "Индекс за границами диапазона");
    } 
    return devices[index];
  }

  void add(SmartDevice device) => devices.add(device);
  void addAll(List<SmartDevice> devices) => devices.addAll(devices);
  void clear() => devices.clear();
  Map asMap() => devices.asMap();
  bool removeAt(int index) {
    int len = devices.length;
    devices = [
      ...devices.sublist(0, index),
      ...devices.sublist(index + 1)
    ];
    
    return len != devices.length;
  }

  bool remove(String name) {
    final int index_remove = devices.indexWhere((device) => device.name == name);
    if (index_remove < 0) {
      return false;
    }
    return removeAt(index_remove);
  }

  String toString() {
    StringBuffer buffer = StringBuffer();
    for (SmartDevice device in devices) {
      buffer.write("ID: ${device.id}\tDevice: ${device.name}\tOnline: ${device.isOnline}\n");
    }
    return buffer.toString();
  }

  DeviceGroup(var add_devices){
    if (add_devices is SmartDevice) {
      devices.add(add_devices);
    } else if (add_devices is List<SmartDevice>) {
      devices.addAll(add_devices);
    }
  }
}