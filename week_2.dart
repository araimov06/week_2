// task 1---------------------------
void main(List <String > arguments ) {
    print('Hello , Dart World!');
    if (arguments.isNotEmpty) {
        print('Command line arguments passed : ${arguments .join(", ")}');
    }
}

void main(){
    print("Adxamjon Raimov");
    print("240422");
    print("Software engineering");
}

void main(List<String> arguments) {
  print('${arguments.length}');
}

void main(List<String> arguments) {
    List<int> numbers = arguments.map(int.parse).toList();
    double t = 0;
    for (int i in numbers){
        t+=i;
    }
    t=t/numbers.length;
    print(t);
}


// task 2---------------------------

void main () {
  var mutableName = 'Alice ';
  final String birthCity = 'Tashkent ';
  const double pi = 3.14159;
  late String lazyDescription ;

  lazyDescription = 'Initialized later!';
  print('$mutableName born in $birthCity . Math constant : $pi. Status :
  $lazyDescription ');
}

void main(){
  int age=20;
  double gpa=3.5;
  String country="Kiribati";
  bool isStudent=false;
}

void main() {
  final now = DateTime.now();   // works
  const year = DateTime.now();  //error
}

void main() {
  String? nickname;
  String name = 'Alice';
  int? score;

  String shown = nickname ?? 'No nickname';
  int total = (score ?? 0) + 10;

  print(shown);
  print(total);
}

void main() {
  dynamic name = 'Alice';
  dynamic age = 20;
  dynamic gpa = 3.8;

  String studentName = name;
  int studentAge = age;
  double studentGpa = gpa;

  print(studentName);
  print(studentAge);
  print(studentGpa);
}


// task 3---------------------------

void main() {
  int n = -4;

  if (n > 0) {
    print('$n is positive');
  } else if (n < 0) {
    print('$n is negative');
  } else {
    print('$n is zero');
  }
}

void main() {
  int n = 5;
  int result = 1;

  for (int i = 1; i <= n; i++) {
    result = result * i;
  }

  print('Factorial (for): $result');
}

void main() {
  int n = 5;
  int result = 1;

  for (int i in List.generate(n, (index) => index + 1)) {
    result = result * i;
  }

  print('Factorial (for-in): $result');
}

void main() {
  int target = 7;
  List<int> guesses = [3, 9, 5, 7, 2];
  int i = 0;

  while (i < guesses.length) {
    int guess = guesses[i];

    if (guess == target) {
      print('Guess $guess: Correct!');
      break;
    } else if (guess < target) {
      print('Guess $guess: too low');
    } else {
      print('Guess $guess: too high');
    }

    i++;
  }
}

void main() {
  outer:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (i * j == 4) {
        print('Found i=$i, j=$j, stopping everything');
        break outer;
      }
      print('i=$i, j=$j');
    }
  }
  print('Done');
}

void main() {
  outer:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        continue outer;
      }
      print('i=$i, j=$j');
    }
  }
}

// task 4 ---------------------------

bool isEven(int n) => n % 2 == 0;

void main() {
  print(isEven(4));
  print(isEven(7));
}

String decorate(String word, [String prefix = '', String suffix = '']) {
  return '$prefix$word$suffix';
}

void main() {
  print(decorate('cat'));
  print(decorate('cat', 'big '));
  print(decorate('cat', 'big ', '!'));
}

List<int> transformAll(List<int> numbers, int Function(int) transformer) {
  List<int> result = [];
  for (int n in numbers) {
    result.add(transformer(n));
  }
  return result;
}

void main() {
  List<int> nums = [1, 2, 3, 4];

  print(transformAll(nums, (x) => x * 2));
  print(transformAll(nums, (x) => x + 10));
}

int fib(int n) {
  if (n <= 1) return n;
  return fib(n - 1) + fib(n - 2);
}

void main() {
  print(fib(5));
}

//task 5-----------------------------

void main() {
  // Average of three test scores
  int a = 80;
  int b = 90;
  int c = 70;

  /* Formula: average = (a + b + c) / 3
     Step 1: 80 + 90 + 70 = 240
     Step 2: 240 / 3 = 80 */
  double average = (a + b + c) / 3;

  print(average);   // 80.0
}

/// Utility methods for checking user input.
class Validator {
  /// Checks whether [age] is between 0 and 120.
  ///
  /// Returns `true` if [age] is in range, otherwise `false`.
  bool isValidAge(int age) => age >= 0 && age <= 120;

  /// Converts [text] to a percentage from 0 to 100.
  ///
  /// Returns the number as an [int].
  ///
  /// Throws a [FormatException] if [text] is not a number.
  /// Throws an [ArgumentError] if the number is outside 0 to 100.
  int parsePercent(String text) {
    int value = int.parse(text);
    if (value < 0 || value > 100) {
      throw ArgumentError('Percent must be 0-100, got $value');
    }
    return value;
  }
}

/// Calculates the **total price** after a discount.
///
/// Rules:
/// * The discount is a fraction, like `0.25` for 25%.
/// * The price must be positive.
///
/// Example:
/// ```dart
/// double p = finalPrice(100, 0.25);
/// print(p);   // 75.0
/// ```
double finalPrice(double price, double discount) => price * (1 - discount);

class Animal {
  /// Returns the sound the animal makes.
  String speak() => '...';

  /// Old way to get the sound.
  ///
  /// Use [speak] instead.
  @deprecated
  String makeSound() => speak();
}

class Dog extends Animal {
  /// Dogs bark instead of using the generic sound.
  @override
  String speak() => 'Woof';
}

void main() {
  print(Animal().speak());   // ...
  print(Dog().speak());      // Woof
}

//task 6----------------------

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  Person p = Person('Adxam', 20);
  print('${p.name} is ${p.age}');
}

class Person {
  final String name;
  final int age;

  Person(String name, int age)
      : assert(age >= 0 && age <= 120, 'Age must be 0-120'),
        name = name.trim(),
        age = age;
}

void main() {
  Person a = Person('  Ali ', 25);
  print('${a.name}, ${a.age}');

  Person b = Person('Vali', 200);
}

class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  void log(String msg) => print('LOG: $msg');
}

void main() {
  Logger a = Logger();
  Logger b = Logger();

  print(identical(a, b));
  a.log('Hello');
}

class Account {
  double _balance = 0;

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      throw ArgumentError('Balance cannot be negative');
    }
    _balance = value;
  }
}

void main() {
  Account acc = Account();

  acc.balance = 100;
  print(acc.balance);

  acc.balance = -50;
}

//task 7------------------------

enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main() {
  for (Day d in Day.values) {
    print('${d.index}: ${d.name}');
  }
}

enum Status { loading, success, error }

String statusText(Status s) {
  return switch (s) {
    Status.loading => 'Please wait...',
    Status.success => 'Done!',
    Status.error => 'Something went wrong',
  };
}

void main() {
  print(statusText(Status.loading));
  print(statusText(Status.error));
}

abstract class Shape {
  double area();
}

enum Square implements Shape {
  small(2),
  medium(4),
  large(6);

  final double side;
  const Square(this.side);

  @override
  double area() => side * side;

  double get perimeter => 4 * side;
}

void main() {
  for (Square s in Square.values) {
    print('${s.name}: area ${s.area()}, perimeter ${s.perimeter}');
  }
}

enum Level { low, medium, high }

Level? parseLevel(String raw) {
  try {
    return Level.values.byName(raw);
  } on ArgumentError {
    return null;
  }
}

void main() {
  print(parseLevel('high'));
  print(parseLevel('extreme'));
  print(parseLevel('High'));
}

//task 8--------------------------

class Animal {
  void makeSound() => print('Some generic sound');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof');
}

void main() {
  Animal a = Animal();
  Dog d = Dog();

  a.makeSound();
  d.makeSound();
}

class Vehicle {
  final String brand;
  Vehicle(this.brand);

  void start() => print('$brand starting...');
}

class ElectricCar extends Vehicle {
  final int batteryCapacity;
  ElectricCar(super.brand, this.batteryCapacity);
}

void main() {
  ElectricCar car = ElectricCar('Tesla', 75);
  car.start();
  print(car.batteryCapacity);
}

class Shape {
  String name;
  Shape(this.name);

  void describe() => print('I am a $name');
}

class Polygon extends Shape {
  int sides;
  Polygon(super.name, this.sides);

  void showSides() => print('$name has $sides sides');
}

class Triangle extends Polygon {
  double base;
  double height;
  Triangle(this.base, this.height) : super('Triangle', 3);

  double get area => 0.5 * base * height;
}

void main() {
  Triangle t = Triangle(4, 3);
  t.describe();
  t.showSides();
  print(t.area);
}

abstract class Employee {
  String name;
  Employee(this.name);

  double monthlyPay();

  void printPay() => print('$name earns ${monthlyPay()}');
}

class FullTime extends Employee {
  double salary;
  FullTime(super.name, this.salary);

  @override
  double monthlyPay() => salary;
}

class PartTime extends Employee {
  double hours;
  double rate;
  PartTime(super.name, this.hours, this.rate);

  @override
  double monthlyPay() => hours * rate;
}

void main() {
  FullTime a = FullTime('Ali', 3000);
  PartTime b = PartTime('Vali', 20, 15);

  a.printPay();
  b.printPay();
}

//task 9--------------------------

abstract class DBConnector {
  void connect(String host);
  String query(String sql);
}

class MySQLConnector implements DBConnector {
  @override
  void connect(String host) => print('MySQL connected to $host');

  @override
  String query(String sql) => 'MySQL ran: $sql';
}

void main() {
  DBConnector db = MySQLConnector();
  db.connect('localhost');
  print(db.query('SELECT 1'));
}

mixin Flyable {
  int altitude = 0;

  void fly() {
    altitude += 100;
    print('Flying at $altitude m');
  }
}

class Bird with Flyable {}

void main() {
  Bird b = Bird();
  b.fly();
  b.fly();
}

mixin Walker {
  void walk() => print('Walking');
}

mixin Swimmer {
  void swim() => print('Swimming');
}

mixin Flyable {
  void fly() => print('Flying');
}

class Duck with Walker, Swimmer, Flyable {}

void main() {
  Duck d = Duck();
  d.walk();
  d.swim();
  d.fly();
}

class Animal {
  String name;
  Animal(this.name);
}

mixin Barker on Animal {
  void bark() => print('$name says Woof');
}

class Dog extends Animal with Barker {
  Dog(super.name);
}

void main() {
  Dog d = Dog('Rex');
  d.bark();
}

//task 10--------------------------

abstract class Shape {
  double area();
}

class Circle implements Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

class Rectangle implements Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

void main() {
  List<Shape> shapes = [Circle(2), Rectangle(3, 4)];

  for (Shape s in shapes) {
    print(s.area());
  }
}

void main() {
  Object x = 42;

  if (x is int) {
    print('int, doubled: ${x * 2}');
  }

  if (x is! String) {
    print('not a String');
  }

  Object text = 'hello';
  String s = text as String;
  print(s.length);

  try {
    String bad = x as String;
    print(bad);
  } catch (e) {
    print('Cast failed');
  }
}

class Repository<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);

  T get(int index) => _items[index];

  int get count => _items.length;
}

void main() {
  Repository<String> names = Repository<String>();
  names.add('Ali');
  names.add('Vali');

  Repository<int> scores = Repository<int>();
  scores.add(80);

  print(names.get(1));
  print(scores.get(0) + 5);
  print(names.count);
}

sealed class Shape {}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
}

class Square extends Shape {
  double side;
  Square(this.side);
}

class Triangle extends Shape {
  double base;
  double height;
  Triangle(this.base, this.height);
}

double area(Shape s) {
  return switch (s) {
    Circle c => 3.14 * c.radius * c.radius,
    Square q => q.side * q.side,
    Triangle t => 0.5 * t.base * t.height,
  };
}

void main() {
  print(area(Circle(2)));
  print(area(Square(3)));
  print(area(Triangle(4, 3)));
}

//task 11--------------------------

Future<Map<String, dynamic>> fetchUser(int id) async {
  await Future.delayed(const Duration(seconds: 2));
  return {'id': id, 'name': 'Ali', 'age': 20};
}

void main() async {
  print('Looking up user...');
  Map<String, dynamic> user = await fetchUser(1024);
  print(user);
}

Future<int> task(int n, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return n * 10;
}

void main() async {
  List<int> results = await Future.wait([
    task(1, 3),
    task(2, 1),
    task(3, 2),
  ]);

  int total = results.fold(0, (sum, x) => sum + x);

  print(results);
  print(total);
}

import 'dart:async';

void main() {
  int count = 0;
  late StreamSubscription<int> sub;

  Stream<int> ticks = Stream.periodic(
    const Duration(seconds: 1),
    (i) => i + 1,
  );

  sub = ticks.listen((value) {
    print('Tick $value');
    count++;

    if (count == 5) {
      sub.cancel();
      print('Cancelled');
    }
  });
}

void main() async {
  Stream<int> source = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5, 6]);

  Stream<int> result = source
      .where((n) => n.isEven)
      .map((n) => n * 10)
      .distinct();

  await for (int v in result) {
    print(v);
  }
}

//task 12-------------------------

void divide(int a, int b) {
  try {
    int result = a ~/ b;
    print('$a / $b = $result');
  } on UnsupportedError {
    print('Cannot divide $a by zero');
  }
}

void main() {
  divide(10, 2);
  divide(10, 0);
}

void greet(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('name cannot be empty or null');
  }
  print('Hello, $name');
}

void main() {
  greet('Ali');

  try {
    greet('');
  } on ArgumentError catch (e) {
    print('Caught: ${e.message}');
  }

  try {
    greet(null);
  } on ArgumentError catch (e) {
    print('Caught: ${e.message}');
  }
}

void risky(int n) {
  if (n == 1) throw FormatException('bad format');
  if (n == 2) throw ArgumentError('bad argument');
  if (n == 3) throw StateError('bad state');
}

void main() {
  for (int i = 1; i <= 4; i++) {
    try {
      risky(i);
      print('$i: ok');
    } on FormatException {
      print('$i: format problem');
    } on ArgumentError catch (e) {
      print('$i: argument problem: ${e.message}');
    } catch (e) {
      print('$i: something else: $e');
    }
  }
}

void level2() => throw StateError('something broke');

void level1() => level2();

void main() {
  try {
    level1();
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:');
    print(stackTrace);
  }
}

