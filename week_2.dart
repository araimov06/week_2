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
