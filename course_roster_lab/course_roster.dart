/// Prints the application welcome message.
void printWelcome(String appName) {
  print('=== $appName ===');
}

void main() {
  printWelcome('Course Roster Manager');

  // Part 2: Course & Roster Data
  const int maxCapacity = 4;
  final DateTime createdAt = DateTime.now();

  String courseTitle = 'CS201: Mobile App Development';
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;

  List<String> enrolledStudents = ['Aiden', 'Maria', 'Jamal'];

  Set<String> waitlist = {'Priya', 'Noah'};

  Map<String, int> attendanceCount = {'Aiden': 3, 'Maria': 4, 'Jamal': 2};

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );

  // Part 3: Null-Safe Instructor Info
  String? instructorEmail;

  print(instructorEmail ?? 'TBA');

  late String enrollmentCode;

  enrollmentCode = courseTitle.substring(0, 2).toUpperCase() + '101';

  print('Enrollment code: $enrollmentCode');

  // Part 4: Formatting Strings
  String rawNames = ' Aiden , maria ,JAMAL , Priya ';

  List<String> cleanNames = [];

  for (var name in rawNames.split(',')) {
    cleanNames.add(name.trim());
  }

  print(cleanNames);

  String courseDescription = '''
This course introduces students to
mobile application development using Dart and Flutter.
''';

  print(courseDescription);

  print('Seats left: ${capacity - enrolledStudents.length}');

  // Part 5: Operators
  int fullGroups = enrolledStudents.length ~/ 3;
  int leftover = enrolledStudents.length % 3;

  print('Full groups of 3: $fullGroups, leftover: $leftover');

  Object formInput = 'twenty-two';

  if (formInput is String) {
    print('This is text!');
  }

  if (formInput is! int) {
    print('This is not an integer!');
  }

  final report = StringBuffer()
    ..write('Report: ')
    ..write(courseTitle)
    ..write(' | Cap: $capacity | Roster: ${enrolledStudents.length}');

  print(report.toString());

  List<String>? extraNotes;

  extraNotes?..add('Room change pending');

  print('Extra notes: $extraNotes');

  int? bonusSeats;

  bonusSeats ??= 0;

  print('Bonus seats: $bonusSeats');

  // Part 6: Enrollment Logic
  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in! Welcome aboard.");
  } else {
    print('Enrollment is currently closed.');
  }

  int enrollmentStatusCode = 200;

  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;

    case 404:
      print('Course not found');
      break;

    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';

  print(statusTag);

  // Part 7: Reports & Loops
  for (var student in enrolledStudents) {
    print(student);
  }

  attendanceCount.forEach((key, value) {
    print('$key: $value');
  });

  List<String> announcements = [
    'Welcome to $courseTitle',

    if (!isOpen) 'Course is FULL — waitlist open',

    for (var student in waitlist)
      'Reminder: $student, please confirm attendance',
  ];

  for (var announcement in announcements) {
    print(announcement);
  }
}
