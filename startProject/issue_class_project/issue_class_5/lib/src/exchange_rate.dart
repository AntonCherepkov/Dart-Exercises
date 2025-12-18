part of 'monay.dart';

// Курс валют
mixin ExchangeRate on Monay {
  Map<String, double> _exchange = {
    "RUB": 1
  }

  Monay convertToCurrency(Monay currency) {
    switch (name) {
      case ('RUB'): 
        return Rub(currency.value);
      case ('USD'):
        return Usd();
    }
  }

  static int _getExchange(String firstRate, String secondRate) {
    String key = "${firstRate} in ${secondRate}";
    switch (key) {
      "RUB in USD" => return 78;
      "RUB in EURO" => return 98;
      "USD in RUB" => return 
    }
  }
}