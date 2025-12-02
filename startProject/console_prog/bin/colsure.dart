int Function() makeLimitedCounter(int? limit, {int start=0, int step=1}) {
  int current = start;
  return () {
    int returnValue = current;
    current += step;

    if (limit == null) {
      return returnValue; 
    }
    else if (current > limit) {
      current = start;
    }
    return returnValue;
  };
}

void main(List<String> params) {
  int Function() counter({int value = 1}) {
    return () => value++; // Если поменять постфикс на префикс, вернет сразу на 1 больше
  }
  print('Работа первого счетчика');
  var countOne = counter();
  print(countOne()); //1
  print(countOne()); //2
  print(countOne()); //3

  print('Работа второго счетчика');
  var countTwo = counter(value: 5);
  print(countTwo()); //5
  print(countTwo()); //6
  print(countTwo()); //7

  print('Работа третьего счетчика');
  var perfCounterOne = makeLimitedCounter(5, start: 0, step: 1);
  print(perfCounterOne());
  print(perfCounterOne());
  print(perfCounterOne());
  print(perfCounterOne());
  print(perfCounterOne());
  print(perfCounterOne());

  print('Работа безконечного счетчика');
  var perfCounterTwo = makeLimitedCounter(null, start: 3, step: 2);
  print(perfCounterTwo());
  print(perfCounterTwo());
  print(perfCounterTwo());
  print(perfCounterTwo());
  print(perfCounterTwo());
  print(perfCounterTwo());
}