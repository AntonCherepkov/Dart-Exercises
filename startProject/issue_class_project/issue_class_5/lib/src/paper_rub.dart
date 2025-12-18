part of 'monay.dart';

class PaperRub extends Rub {
  List<double> _nominal = <double>[
    10.0, 50.0, 100.0, 500.0, 1000.0, 2000.0, 5000.0
  ];

  PaperRub(value, {name = "paperRub"})
      : super.inputType(value, name: name) {
    if (!_nominal.contains(value)){
      throw TypeError();
    }
  }
}