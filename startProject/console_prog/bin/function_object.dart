


void main(List<String> arguments) {
  Map<String, Function> ops = Map();
  ops['+'] = (a, b) {return a + b;};
  ops['-'] = (a, b) {return a - b;};
  ops['*'] = (a, b) {return a * b;};
  
  int calculate(String? opsV, int aV, int bV) {
    if (opsV == null && !['*', '-', '+'].contains(opsV)) {
      throw TypeError();
    }
    var func = ops[opsV];
    return func!(aV, bV);
  }

  print(calculate('+', 4, 4));
  print(calculate('-', 5, 3));
  print(calculate('*', 3, 3));
}