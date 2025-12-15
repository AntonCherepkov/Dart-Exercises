part of 'monay.dart';

class Usd extends Monay {
  late final int _cent;

  void set cent(cent) => _cent = cent;
  int get cent => _cent;

  @override
  Monay operator +(Object other) {
    // TODO: implement +
    throw UnimplementedError();
  }

  @override
  Monay operator -(Object other) {
    // TODO: implement -
    throw UnimplementedError();
  }

  
}