part of 'machine.dart';

class AccountUser {
  late final String idCard;
  late String name;
  late double accountBalance;
  late final pinCode;
  
  AccountUser(idCard, name, pinCode, [accountBalance = 0]);

  @override
  void operator +(double monay) {
    accountBalance += monay;
  }

  @override 
  void operator -(double monay) {  
    if (accountBalance < monay) {
      print("Нельзя снять сумму большую, чем есть на счете");
      return;
    } else {
      accountBalance -= monay;
    }
  }

  @override
  String toString() => "Состояние счета пользователя $name: $accountBalance";
}