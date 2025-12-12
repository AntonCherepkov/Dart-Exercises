import 'package:issue_class_3/issue_class_3.dart';

void main() {
  var device = SmartDevice.create(name: "bulb", json: {"type": "light"});
  print('device_id: ${device.id}\nname: ${device.name}\nstatus: ${device.isOnline}');
}
