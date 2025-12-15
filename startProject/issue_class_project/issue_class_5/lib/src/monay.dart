part "usd.dart";
part "euro.dart";
part "rub.dart";
part "paper_rub.dart";
part "digit_rub.dart";
part "exchange_rate.dart";

abstract class Monay {
  late final String name;

  Monay operator+(Object other);
  Monay operator-(Object other);
} 