void main(List<String> arguments) {
  List<Map<String, dynamic>> clients = [
  {
    'name': 'Anton',
    'orders': [1200, 800, 300]
  },
  {
    'name': 'Maks',
    'orders': [150, 200]
  },
  {
    'name': 'Olga',
    'orders': []
  },
  {
    'name': 'Dina',
    'orders': [999, 1500, 2000, 50]
  },
];

  for (var client in clients) {
    for (var MapEntry(key: k, value: v) in client.entries) {
      if (k == 'name') {
        print('\nИмя: $v');
      }
      else if (k == 'orders' && v is List) {
        for (var i = 0; i < v.length; i++) {
          print('Число $i: ${v[i]}');
        }
        int sum = 0;
        for (int v in v) {
          sum += v;
        }
        print("Сумма: $sum");
      }
    }
  } 

  print('\n');

  int count = 0;
  int maxValue = 0;
  while (count < clients.length) {
    var {'name': name, 'orders': [...order]} = clients[count];
    order.map((val) => maxValue = maxValue < val ? val : maxValue).toList();
    print("Максимальная затрата для $name: $maxValue");
    count++;  
    maxValue = 0;
  }

  int withOrder = 0;
  int withoutOrder = 0;
  do {
    for (var {"name": name, "orders": List order1} in clients){
      if (order1.length == 0) {
        withoutOrder++;
      } else {
        withOrder++;
      }
    }
  } while (withoutOrder + withOrder < clients.length);

  print("С заказами: $withOrder");
  print("Без заказов: $withoutOrder");
}
