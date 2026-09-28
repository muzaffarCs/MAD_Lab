// Week3.dart - Library Desk Assistant
// Name: Muzaffar Ali Roll no: 04072313007

final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming'],
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile'],
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design'],
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math'],
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile'],
  },
];

void main() async {
  part1();
  part2();
  // part3();
  // part4();
  // part5();
  // await part6();
}

// Part 1

void part1() {
  print('--- Part 1 ---');

  print('Late fee: ${lateFee(5, 0.5)}');

  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));

  print(makeBook(title: 'Clean Code', author: 'Martin'));

  print(makeBook(title: 'Algorithms', author: 'Knuth', year: 1968));

  print(isClassic(1968));
  print(isClassic(2021));
}

double lateFee(int daysLate, double ratePerDay) {
  return daysLate * ratePerDay;
}

String formatTitle(String title, [String? author]) {
  return author == null ? title : '$title by $author';
}

Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {'title': title, 'author': author, 'year': year, 'copies': copies};
}

bool isClassic(int year) {
  return year < 2000;
}

// Part 2

void part2() {
  print('--- Part 2 ---');

  final items = ['Dart in Action', 'Clean Code'];

  print(transformAll(items, (item) => item.toUpperCase()));

  print(transformAll(items, (item) => '$item!'));

  final desk1 = makeCounter();
  final desk2 = makeCounter();

  print(desk1());
  print(desk1());
  print(desk1());

  print(desk2());

  final studentFee = makeFeeCalculator(0.25);
  final staffFee = makeFeeCalculator(0.10);

  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');

  print('Sum of digits: ${sumDigits(125)}');
}

List<String> transformAll(List<String> items, String Function(String) fn) {
  return items.map(fn).toList();
}

int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}

int sumDigits(int n) {
  if (n < 10) {
    return n;
  }

  return (n % 10) + sumDigits(n ~/ 10);
}

