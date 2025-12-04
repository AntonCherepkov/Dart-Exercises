import 'dart:ffi';

Iterable<int> evens(int start, int end) sync* {
  for (int i = start; i <= end; i++) {
    yield i;
  }
}

Iterable<String> chars(String str) sync* {
  List<String> strList= str.split('');
  for (var s in strList) {
    yield s;
  }
}

Iterable<int> expendList(List<dynamic> inList) sync* {
  for (var struct in inList) {
    if (struct.runtimeType == int) {
      yield struct;
    } else {
      yield* expendList(struct);
    }
  }
}

Iterable<List<dynamic>> listWindow(int k, List inList) sync* {
  for (int i = 0; i + k <= inList.length; i++) {
    yield inList.sublist(i, i + k);
  }
}

void main(List<String> parameters) {
  List<int> myList= List.from(evens(2, 7));
  print(myList);
  print(evens(2, 7).toList());

  for (var ch in chars('dart')) {
    print(ch);
  }

  List<dynamic> listDynamic = [2, [3, 4], [[5], 6], 7, [8, [9]]];
  print(expendList(listDynamic).toList());

  for (var l in listWindow(3, [1,2,3,4,5])) {
    print(l);
  }

  print('29 + 3 + 3 - 3 / 2'.split(".[+-/]."));
}