part of 'monay.dart';

class Rub extends Monay {
  String name = "RUB";

  Rub(value, [percent = 14]): super(value, "RUB");
  Rub.inputType(value, {required name, percent =14}): super(value, name);

  factory Rub.paperRub(double nominal_value) {
    if ([10, 50, 100, 500, 1000, 2000, 5000]
          .contains(nominal_value)){
      return PaperRub(nominal_value);
    } else {
      throw TypeError();
    }
  }

  @override
  Monay operator +(Object other) {
    if (other is double) {
      return Rub(value + other);
    } else if (other is Rub) {
      return Rub(value + other.value);
    // } else if (other is Usd) {
      
    }
    throw UnimplementedError();
  }

  @override
  Monay operator -(Object other) {
    if (other is int) {
      return Rub(value - other);
    } else if (other is Rub) {
      return Rub(value - other.value);
    }
    throw UnimplementedError();
  }

  @override
  String toString() => "${name}: ${value.toInt()}р. ${smallMonay} коп.";
}
