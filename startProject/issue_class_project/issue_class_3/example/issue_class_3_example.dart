import 'package:issue_class_3/issue_class_3.dart';

void main() {
  DeviceGroup MyHome = DeviceGroup([
    SmartDevice.create(name: "light_toilet", isOnline: true, json: {"type": "light"}),
    SmartDevice.create(name: "liv_room_ligt", isOnline: true, json: {"type": "light"}),
    SmartDevice.create(name: "street_therm", isOnline: true, json: {"type": "thermostat"}),
    SmartDevice.create(name: "street_cam", isOnline: true, json: {"type": "cam"})
  ]);

  print(MyHome.toString());
}
