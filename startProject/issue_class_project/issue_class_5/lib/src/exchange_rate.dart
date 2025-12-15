// TODO: Потом можно переделать в enum-ы

part of 'monay.dart';

// Курс валют
interface class ExchangeRate {
  int priceRub = 10000;
  double euro = 0.85;
  const int usd = 1;
  
  Monay convertToCurrency(Monay monay) {
    return Monay(usd);
  }
}