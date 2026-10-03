//task 1----------------------------

void main(List<String> arguments) {
  if (arguments.length != 2) {
    print('Usage: dart run main.dart <arg1> <arg2>');
    return;
  }
  print('Received: ${arguments[0]} and ${arguments[1]}');
}


import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('No arguments provided');
    exitCode = 1;
    return;
  }
  print('Arguments: ${arguments.join(", ")}');
  exitCode = 0;
}


void main(List<String> arguments) {
  final flags = <String, String>{};

  for (final arg in arguments) {
    if (arg.startsWith('--') && arg.contains('=')) {
      final body = arg.substring(2);
      final index = body.indexOf('=');
      final key = body.substring(0, index);
      final value = body.substring(index + 1);
      flags[key] = value;
    }
  }

  flags.forEach((key, value) => print('$key -> $value'));
}

//task 2-------------------------

void main() {
  Object value = 42;
  if (value is int) {
    print(value + 8);
  }

  dynamic data = 'hello';
  if (data is String) {
    print(data.length);
  }
}


void main() {
  (double, double, double) point = (1.5, 2.0, 3.5);

  print(point.$1);
  print(point.$2);
  print(point.$3);
  print(point.$1 + point.$2 + point.$3);
}


typedef UserProfile = Map<String, dynamic>;
typedef UserDirectory = Map<String, UserProfile>;

void main() {
  UserDirectory users = {
    'u1': {
      'name': 'Alice',
      'age': 20,
      'tags': ['dart', 'flutter'],
    },
    'u2': {
      'name': 'Bob',
      'age': 22,
      'tags': ['sql'],
    },
  };
  

  users.forEach((id, profile) {
    print('$id: ${profile['name']}, age ${profile['age']}');
  });

  print(users['u1']!['tags']);
}

//task 3-------------------------

void main() {
  outer:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) continue outer;
      if (i == 3) break outer;
      print('i=$i j=$j');
    }
  }
}


void describe(Map<String, dynamic> json) {
  switch (json) {
    case {'type': 'circle', 'radius': num r}:
      print('Circle area: ${3.14 * r * r}');
    case {'type': 'rect', 'w': num w, 'h': num h}:
      print('Rect area: ${w * h}');
    case {'type': String t}:
      print('Unknown shape: $t');
    default:
      print('Invalid input');
  }
}


void main() {
  describe({'type': 'circle', 'radius': 2});
  describe({'type': 'rect', 'w': 3, 'h': 4});
  describe({'type': 'triangle'});
  describe({'name': 'x'});
}


enum AppState { created, started, resumed, paused, stopped, destroyed }

const transitions = {
  AppState.created: AppState.started,
  AppState.started: AppState.resumed,
  AppState.resumed: AppState.paused,
  AppState.paused: AppState.stopped,
  AppState.stopped: AppState.destroyed,
};

class Lifecycle extends Iterable<AppState> {
  @override
  Iterator<AppState> get iterator => _walk().iterator;

  Iterable<AppState> _walk() sync* {
    AppState? current = AppState.created;
    while (current != null) {
      yield current;
      current = transitions[current];
    }
  }
}

void main() {
  for (final state in Lifecycle()) {
    print(state.name);
  }
}

//task 4----------------------------

int fib(int n) {
  if (n <= 1) return n;
  return fib(n - 1) + fib(n - 2);
}

void main() {
  for (int i = 0; i <= 7; i++) {
    print('fib($i) = ${fib(i)}');
  }
}


Function makeCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

void main() {
  final counterA = makeCounter();
  final counterB = makeCounter();

  print(counterA());
  print(counterA());
  print(counterA());
  print(counterB());
}


T maxOf<T extends Comparable<T>>(T a, T b) {
  return a.compareTo(b) >= 0 ? a : b;
}

void main() {
  print(maxOf(3, 7));
  print(maxOf(2.5, 1.5));
  print(maxOf('apple', 'banana'));
}


//task 5--------------------------


/// A basic shape that can report its area.
abstract class Shape {
  /// Returns the area of this shape.
  double area();

  /// Returns the area of this shape.
  ///
  /// Deprecated: use [area] instead.
  @deprecated
  double getArea() => area();
}

/// A circle defined by its [radius].
class Circle extends Shape {
  /// The radius of the circle.
  final double radius;

  /// Creates a circle with the given [radius].
  Circle(this.radius);

  /// Computes the area as pi * radius * radius.
  @override
  double area() => 3.14159 * radius * radius;
}

void main() {
  final c = Circle(2);
  print(c.area());
}


/// A tiny in-memory storage API.
library;

/// A key-value store that keeps string values in memory.
///
/// Example:
/// ```dart
/// final store = KeyValueStore();
/// store.put('port', '8080');
/// print(store.get('port'));
/// ```
class KeyValueStore {
  final Map<String, String> _data = {};

  /// Stores [value] under [key], replacing any existing value.
  void put(String key, String value) {
    _data[key] = value;
  }

  /// Returns the value for [key], or `null` if [key] is not present.
  String? get(String key) => _data[key];

  /// Removes [key] and returns `true` if it existed, otherwise `false`.
  bool remove(String key) => _data.remove(key) != null;

  /// The number of entries currently stored.
  int get length => _data.length;
}


include: package:lints/recommended.yaml

analyzer:
  errors:
    public_member_api_docs: error
    slash_for_doc_comments: error
    comment_references: warning
    provide_deprecation_message: error

linter:
  rules:
    - public_member_api_docs
    - slash_for_doc_comments
    - comment_references
    - provide_deprecation_message


//task 6----------------------------



class Temperature {
  double _celsius;

  Temperature(this._celsius);

  double get celsius => _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      throw ArgumentError('Below absolute zero');
    }
    _celsius = value;
  }

  double get fahrenheit => _celsius * 9 / 5 + 32;
}

void main() {
  final t = Temperature(25);
  print(t.celsius);
  print(t.fahrenheit);

  t.celsius = 100;
  print(t.fahrenheit);

  try {
    t.celsius = -300;
  } catch (e) {
    print(e);
  }
}


class UserDto {
  final String name;
  final int age;
  final String email;

  const UserDto({
    required this.name,
    required this.age,
    required this.email,
  });
}

void main() {
  const a = UserDto(name: 'Alice', age: 20, email: 'a@mail.com');
  const b = UserDto(name: 'Alice', age: 20, email: 'a@mail.com');

  print(a.name);
  print(identical(a, b));
}


class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  Rectangle.square(double side) : this(side, side);

  Rectangle.fromArea(double area) : this.square(_sqrt(area));

  static double _sqrt(double v) {
    double x = v;
    for (int i = 0; i < 30; i++) {
      x = (x + v / x) / 2;
    }
    return x;
  }

  double get area => width * height;
}

void main() {
  final r1 = Rectangle(3, 4);
  final r2 = Rectangle.square(5);
  final r3 = Rectangle.fromArea(16);

  print(r1.area);
  print(r2.area);
  print(r3.width);
}


//task 7----------------------------

