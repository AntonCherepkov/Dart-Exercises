part of 'monay.dart';

class Rub extends Monay with ExchangeRate {
  Rub(value): super(value, "RUB");
  Rub.inputType(value, {required name}): super(value, name);


  // factory Rub.paperMonay(int nominal_value) {
  //   case(nominal_value) {
  //     10 => ...;
  //     50 => ...;
  //     100 => ...;
  //     200 => ...;
  //     500 => ...;
  //     1000 => ...;
  //     2000 => ...;
  //     5000 => ...;
  //   }
  // }


  // TODO: в перегрузки операторов надо поместить вариант, при котором мы складываем валюту 
  // в долларах

  Monay operator +(Object other) {
    if (other is double) {
      return Rub(value + other);
    } else if (other is Rub) {
      return Rub(value + other.value);
    } else if (other is Usd) {
      
    }
    throw UnimplementedError();
  }

  Monay operator -(Object other) {
    if (other is int) {
      return Rub(value - other);
    } else if (other is Rub) {
      return Rub(value - other.value);
    }
    throw UnimplementedError();
  }
}