part of 'monay.dart';

class Usd extends Monay {
  late final int _cent;

  Usd(value):super(value, "USD");

  void set cent(cent) => _cent = cent;
  int get cent => _cent;

  @override
  Monay operator +(Object other) {
    if (other is Usd) { 
      return Usd(other.value + value);
    } else if (other is double){
      return Usd(other + value);
    }
    throw UnimplementedError();
  }

  @override
  Monay operator -(Object other) {
    double? result;
    if (other is Usd) {
      result = value - other.value;
    } else if (other is double) {
      result = value - other;
    }
    if (result != null && result < 0) {
      throw ArgumentError("Банкрот");
    } else {
      return Usd(result);
    }
  }

  @override 
  String toString() => "${name}: ${value.toInt()}\$ ${smallMonay}cents";
}