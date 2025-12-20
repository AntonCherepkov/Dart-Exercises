import 'dart:math';

part "usd.dart";
part "euro.dart";
part "rub.dart";
part "paper_rub.dart";
part "digit_rub.dart";

abstract class Monay {
  late final String name;
  late double _value;
  late int _smallMonay;

  double get value => _value;
  int get smallMonay => _smallMonay;
  
  void set value(double value) => _value = value;
  void set smallMonay(int value) => _smallMonay = (value ~/ 100).toInt();

  Monay(value, this.name)
    : _value = value {
      smallMonay = (value ~/ 100).toInt();
    }

  Monay operator+(Object other);
  Monay operator-(Object other);
}