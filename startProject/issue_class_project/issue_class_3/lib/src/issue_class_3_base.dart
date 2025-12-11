import 'package:uuid/uuid.dart';

class SmartDevice {
  late String _id;
  final String name;
  bool isOnline;

  String get id => _id;
  set setID(String number) => this._id = number;

  SmartDevice(this.name, {this.isOnline = false}) {
    var uuid = Uuid().v4.toString();
    _id = uuid;
  }
  
  // SmartDevice.defaultNamed({name}) : this(name, )  
}
