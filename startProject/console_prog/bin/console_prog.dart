
void main(List<String> arguments) {
  double a = 3.3;
  print('Первая переменная: $a');

  List<int> listNumbers = [1, 2];
  print('Список целочисленных элементов: $listNumbers');

  print('Работа со списками:');

  var unknowList = <int>[];
  print('Список int элементов но пустой: $unknowList');
  unknowList.addAll([1, 3, 4, 4]);
  print('Тот же список но дополненный: $unknowList');
  
  var copyList = [...unknowList];
  List<int> copy2List = List.from(unknowList);

  copyList.addAll([5, 6]);
  copy2List += [7, 8];

  print('Исходный список: $unknowList');
  print('Скопированный список: $copyList');
  print('Скопированный список: $copy2List');

  (int, double, {int i, String k}) MyRecord = (3, 3.3, i: 4, k: '4');
  print('Это новая Record: $MyRecord');
  print('Раскладываем по элементам: ${MyRecord.$1} ${MyRecord.$2} ${MyRecord.i} ${MyRecord.k}');

  var mySet1 = {1, 3, 4, 5, 6};
  var mySet2 = {3, 6, 7, 8, 9};

  print('Работа с множествами:\n1-ое множесво: ${mySet1}\n2-ое множество: ${mySet2}');
  print('Пересечение множеств: ${mySet1.intersection(mySet2)}');
  print('Объединение множеств: ${mySet1.union(mySet2)}');
  print('Разница множеств: ${mySet1.difference(mySet2)}');

  print('Работа с мапами:');
  List<int> keys = [1, 2, 3];
  List<String> values = ['1', '2', '3'];
  var myMap = Map<int, String>.fromIterables(keys, values);

  print('Делаем мапку из списков:\nkeys: ${keys}\nvalues:${values}\nмапка: ${myMap}');
  myMap.addAll({6:'6', 7:'7'});
  print('Добавляем элементов: ${myMap}');

  myMap.removeWhere((key, value) => int.parse(value) % 2 == 0);
  print('Удалили пары, с четными значениями: ${myMap}');

}
