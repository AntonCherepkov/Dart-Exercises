part of 'monay.dart';

class Rub extends Monay {
  late final int _copekc;

  int get copekc => _copekc;
  void set copec(int value) => _copekc = value;  

  Rub(int copeck): _copekc = copeck;
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

  @override
  Monay operator +(Object other) {
    if (other is int) {
      return Rub(copekc + other);
    } else if (other is Rub) {
      return Rub(copekc + other.copekc);
    } else if (other is Usd) {
      
    }
    throw UnimplementedError();
  }

  @override
  Monay operator -(Object other) {
    if (other is int) {
      return Rub(copekc - other);
    } else if (other is Rub) {
      return Rub(copekc - other.copekc);
    }
    throw UnimplementedError();
  }
}