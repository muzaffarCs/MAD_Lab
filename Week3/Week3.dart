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
  part3();
  part4();
  part5();
  await part6();
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

// Part 3

void part3() {
  print('--- Part 3 ---');

  final titles = books.map((book) => book['title'] as String).toList();

  print('Titles: $titles');

  final available = books
      .where((book) => (book['copies'] as int) >= 1)
      .map((book) => book['title'] as String)
      .toList();

  print('Available: $available');

  final totalCopies = books.fold<int>(
    0,
    (sum, book) => sum + (book['copies'] as int),
  );

  print('Total copies: $totalCopies');

  final years = books.map((book) => book['year'] as int).toList();

  final oldestYear = years.reduce((a, b) => a < b ? a : b);

  print('Oldest year: $oldestYear');

  final sortedBooks = [...books];

  sortedBooks.sort((a, b) => (a['year'] as int).compareTo(b['year'] as int));

  final byYear = sortedBooks.map((book) => book['title'] as String).toList();

  print('By year: $byYear');

  final stock = buildStock();

  print('Stock: $stock');

  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });

  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');

  final allTags = <String>{
    for (final book in books) ...(book['tags'] as List<String>),
  };

  print('All tags: $allTags');

  final a = {'Dart in Action', 'Clean Code', 'Flutter Basics'};

  final b = {'Clean Code', 'Flutter Basics', 'Algorithms'};

  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}

Map<String, int> buildStock() {
  return {
    for (final book in books) book['title'] as String: book['copies'] as int,
  };
}

// Part 4

void part4() {
  print('--- Part 4 ---');

  final intBox = Box<int>(5);
  final strBox = Box<String>('dart');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${strBox.value}');

  print(firstOr(['Dart in Action', 'Clean Code'], 'none'));

  print(firstOr<String>([], 'z'));

  print(Pair('Dart in Action', 3));
}

class Box<T> {
  T value;

  Box(this.value);
}

T firstOr<T>(List<T> items, T fallback) {
  return items.isEmpty ? fallback : items.first;
}

class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return '($first, $second)';
  }
}

// Part 5

void part5() {
  print('--- Part 5 ---');

  final stock = buildStock();

  for (final title in ['Dart in Action', 'Flutter Basics', 'Unknown Book']) {
    try {
      checkOut(stock, title);

      print('Checked out: $title');
    } on BookNotAvailableException catch (e) {
      print('Sorry: "${e.title}" has no copies left');
    } on BookNotFoundException catch (e) {
      print('Not found: "${e.title}"');
    } finally {
      print('Transaction logged.');
    }
  }

  print(
    'Copies left of Dart in Action: '
    '${stock['Dart in Action']}',
  );

  try {
    findBook('Missing');
  } on StateError {
    print('Search failed: no such book');
  }
}

class BookNotFoundException implements Exception {
  final String title;

  BookNotFoundException(this.title);
}

class BookNotAvailableException implements Exception {
  final String title;

  BookNotAvailableException(this.title);
}

void checkOut(Map<String, int> stock, String title) {
  if (!stock.containsKey(title)) {
    throw BookNotFoundException(title);
  }

  if (stock[title]! <= 0) {
    throw BookNotAvailableException(title);
  }

  stock[title] = stock[title]! - 1;
}

Map<String, dynamic> findBook(String title) {
  return books.firstWhere((book) => book['title'] == title);
}

// Part 6

Future<void> part6() async {
  print('--- Part 6 ---');

  print('Fetching...');

  final result = await fetchBookOfTheDay();

  print('Book of the day: $result');

  try {
    final broken = await fetchBroken();

    print(broken);
  } catch (e) {
    print('Fetch failed: $e');
  }
}

Future<String> fetchBookOfTheDay() async {
  await Future.delayed(const Duration(seconds: 1));

  return 'Dart in Action';
}

Future<String> fetchBroken() async {
  await Future.delayed(const Duration(milliseconds: 500));

  throw Exception('Server down');
}

/*
Reflection
1. When would you choose fold over reduce?

I would use fold when I already have a starting value that I want to use in the calculation. In this lab, I used fold to calculate the total number of book copies, starting from 0. I think fold is also safer when the list might be empty because it does not need the first element to start the calculation. reduce uses the first element as the starting value.

2. What does it mean that a closure "captures" a variable? Which variable was captured in makeCounter?

A closure can remember and use a variable from the function where it was created, even after that function has finished. In makeCounter, the variable count is captured by the returned function. Every time I call desk1(), it remembers the previous value of count and increases it by 1. This is why the output is 1, 2, 3.

3. Why must on BookNotAvailableException come before a general catch (e)?

The specific exception should be handled before a general exception because the general catch can handle many types of errors. In my code, BookNotAvailableException has its own message, so I put its on block first to handle that particular situation properly. If there was a general catch before it, the specific exception could be handled by the general block instead.

4. Why does forgetting await still compile, but give the wrong result?

I understood that an async function returns a Future, not the final value immediately. await tells the program to wait for that Future to finish and then give me the actual result. If I forget await, the code can still compile because a Future is a valid return value, but I may get the Future instead of the actual book name. In this lab, await is needed so that Book of the day: Dart in Action is printed after the result is received.
*/
