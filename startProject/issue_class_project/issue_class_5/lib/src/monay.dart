import 'dart:js_interop';

part "usd.dart";
part "euro.dart";
part "rub.dart";
part "paper_rub.dart";
part "digit_rub.dart";
part "exchange_rate.dart";

abstract class Monay {
  late final String name;
  late double _value;
  late int _smallMonay;

  double get value => _value;
  int get smallMonay => _smallMonay;
  
  void set value(double value) => _value = value;
  void set smallMonay(int value) => value ~/ 100;



  Monay(value, this.name): _value = value;

  // чисто абстрактные методы
  Monay operator+(Object other);
  Monay operator-(Object other);
}