typedef NumberOp = double Function(double arg);
typedef Validator = bool Function(double arg);

double proccessNumber(
  double value, 
  List<NumberOp> operations, 
  List<Validator> validators) {
    late var result;
    if (validators.every((validator) => validator(value))) {
      result = operations.fold<double>(value, (value, operation) => operation(value));
    }
    else {
      throw ArgumentError('Invalid number');
    }
    return result!;
  }

void main(List<String> arguments) {

  List<NumberOp> operations = [
    (double a) => a * 3,
    (double a) => a / 2,
    (double a) => a + 1
  ];
  List<Validator> validators = [
    (double a) => a > 0,
    (double a) => a < 10
  ];
  
  print(proccessNumber(2.2, operations, validators));
}