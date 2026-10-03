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

enum Color { red, green, blue }

Color? parseColor(String raw) {
  try {
    return Color.values.byName(raw);
  } on ArgumentError {
    return null;
  }
}

void main() {
  print(parseColor('green'));
  print(parseColor('blue')?.index);
  print(parseColor('purple'));
}


enum Unit<T extends num> {
  meter<int>(1),
  kilometer<int>(1000),
  centimeter<double>(0.01);

  final T factor;
  const Unit(this.factor);

  static Unit<num>? fromSymbol(String s) {
    switch (s) {
      case 'm':
        return Unit.meter;
      case 'km':
        return Unit.kilometer;
      case 'cm':
        return Unit.centimeter;
      default:
        return null;
    }
  }

  static double toMeters(num value, Unit<num> unit) => value * unit.factor;
}

void main() {
  print(Unit.fromSymbol('km'));
  print(Unit.toMeters(5, Unit.kilometer));
  print(Unit.toMeters(250, Unit.centimeter));
  print(Unit.fromSymbol('x'));
}


enum Light {
  red(Duration(seconds: 30)),
  green(Duration(seconds: 25)),
  yellow(Duration(seconds: 5));

  final Duration duration;
  const Light(this.duration);

  Light get next => switch (this) {
        Light.red => Light.green,
        Light.green => Light.yellow,
        Light.yellow => Light.red,
      };
}

void main() {
  Light current = Light.red;
  int total = 0;

  for (int i = 0; i < 6; i++) {
    print('${current.name} for ${current.duration.inSeconds}s');
    total += current.duration.inSeconds;
    current = current.next;
  }

  print('Total: $total');
}


//task 8-----------------------


abstract class Employee {
  final String name;
  final double baseSalary;

  Employee(this.name, this.baseSalary);

  double bonus();

  double totalPay() => baseSalary + bonus();

  void printPay() => print('$name earns ${totalPay()}');
}

class Manager extends Employee {
  Manager(super.name, super.baseSalary);

  @override
  double bonus() => baseSalary * 0.2;
}

class Intern extends Employee {
  Intern(super.name, super.baseSalary);

  @override
  double bonus() => 100;
}

void main() {
  Manager('Ann', 5000).printPay();
  Intern('Bob', 1000).printPay();
}

//shapes.dart->>>
final class Circle {
  final double radius;
  Circle(this.radius);

  double area() => 3.14 * radius * radius;
}

base class Account {
  double balance;
  Account(this.balance);

  void deposit(double amount) {
    balance += amount;
  }
}

//main.dart->>
import 'shapes.dart';

base class Savings extends Account {
  Savings(super.balance);
}

void main() {
  final s = Savings(100);
  s.deposit(50);
  print(s.balance);
  print(Circle(2).area());
}


class Config {
  final String name;
  final int version;

  const Config(this.name, this.version);
}

class Device {
  final Config config;

  const Device(this.config);

  String info() => '${config.name} v${config.version}';
}

class Phone extends Device {
  final int storage;

  const Phone(super.config, this.storage);

  @override
  String info() => '${super.info()}, ${storage}GB';
}

class Smartphone extends Phone {
  final bool has5g;

  const Smartphone(super.config, super.storage, {required this.has5g});

  @override
  String info() => '${super.info()}, 5G: $has5g';
}

void main() {
  const cfg = Config('Nova', 2);
  const p = Smartphone(cfg, 128, has5g: true);

  print(p.info());
  print(identical(p.config, cfg));
}

//task 9-----------------------------


class Animal {
  final String name;
  Animal(this.name);
}

mixin Barker on Animal {
  void bark() => print('$name says woof');
}

class Dog extends Animal with Barker {
  Dog(super.name);
}

void main() {
  Dog('Rex').bark();
}


class Greeter {
  String greet() => 'Hello';
}

class A implements Greeter {
  @override
  String greet() => 'Hi from A';
}

mixin GreeterMixin {
  String greet() => 'Hello';
}

class B with GreeterMixin {}

void main() {
  print(A().greet());
  print(B().greet());
  print(A() is Greeter);
  print(B() is GreeterMixin);
}


mixin Notifier {
  final List<void Function()> _listeners = [];

  void addListener(void Function() l) => _listeners.add(l);

  void notifyListeners() {
    for (final l in _listeners) {
      l();
    }
  }

  void disposeListeners() => _listeners.clear();
}

mixin HistoryTracking<T> on Notifier {
  final List<T> history = [];

  void record(T value) => history.add(value);
}

mixin Loggable on Notifier {
  void log(String msg) => print('[LOG] $msg');
}

class CounterStore with Notifier, HistoryTracking<int>, Loggable {
  int _value = 0;
  int get value => _value;

  void increment(int by) {
    _value += by;
    record(_value);
    log('value is $_value');
    notifyListeners();
  }
}


void main() {
  final store = CounterStore();
  store.addListener(() => print('UI rebuild: ${store.value}'));

  store.increment(5);
  store.increment(3);
  print(store.history);

  store.disposeListeners();
  store.increment(1);
  print(store.history);
}

//task 10------------------------

sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Rectangle extends Shape {
  final double width, height;
  Rectangle(this.width, this.height);
}

class Triangle extends Shape {
  final double base, height;
  Triangle(this.base, this.height);
}

double area(Shape s) => switch (s) {
      Circle(radius: var r) => 3.14 * r * r,
      Rectangle(width: var w, height: var h) => w * h,
      Triangle(base: var b, height: var h) => 0.5 * b * h,
    };

void main() {
  print(area(Circle(2)));
  print(area(Rectangle(3, 4)));
  print(area(Triangle(6, 5)));
}


abstract class DiscountStrategy {
  double apply(double price);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double price) => price;
}

class PercentDiscount implements DiscountStrategy {
  final double percent;
  PercentDiscount(this.percent);

  @override
  double apply(double price) => price * (1 - percent / 100);
}

class FlatDiscount implements DiscountStrategy {
  final double amount;
  FlatDiscount(this.amount);

  @override
  double apply(double price) => price - amount;
}

class Cart {
  DiscountStrategy strategy;
  Cart(this.strategy);

  double checkout(double price) => strategy.apply(price);
}

void main() {
  final cart = Cart(NoDiscount());
  print(cart.checkout(200));

  cart.strategy = PercentDiscount(10);
  print(cart.checkout(200));

  cart.strategy = FlatDiscount(30);
  print(cart.checkout(200));
}


abstract class Plugin {
  String get name;
  bool canHandle(String action);
  void handle(String action, Map<String, dynamic> data);
}

class EmailPlugin implements Plugin {
  @override
  String get name => 'email';

  @override
  bool canHandle(String action) => action == 'send_email';

  @override
  void handle(String action, Map<String, dynamic> data) {
    print('Email to ${data['to']}: ${data['body']}');
  }
}

class LogPlugin implements Plugin {
  @override
  String get name => 'log';

  @override
  bool canHandle(String action) => action == 'log';

  @override
  void handle(String action, Map<String, dynamic> data) {
    print('LOG: ${data['message']}');
  }
}

class PluginManager {
  final List<Plugin> _plugins = [];

  void register(Plugin p) => _plugins.add(p);

  void dispatch(String action, Map<String, dynamic> data) {
    for (final p in _plugins) {
      if (p.canHandle(action)) {
        p.handle(action, data);
        return;
      }
    }
    print('No plugin for "$action"');
  }
}

void main() {
  final manager = PluginManager();
  manager.register(EmailPlugin());
  manager.register(LogPlugin());

  manager.dispatch('send_email', {'to': 'a@mail.com', 'body': 'Hi'});
  manager.dispatch('log', {'message': 'started'});
  manager.dispatch('delete_all', {});
}


//task11-------------------------------

void main() async {
  final source = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5, 6, 6]);

  final result = source
      .map((x) => x * 10)
      .where((x) => x > 20)
      .distinct();

  await for (final v in result) {
    print(v);
  }
}


void main() async {
  final source = Stream.fromIterable([1, 2, 0, 4, 0, 5]);

  final pipeline = source
      .map((x) {
        if (x == 0) throw FormatException('zero not allowed');
        return 10 ~/ x;
      })
      .handleError((e) => print('Error: $e'));

  await for (final v in pipeline) {
    print(v);
  }
}


import 'dart:async';

void main() async {
  final controller = StreamController<String>.broadcast();

  final subA = controller.stream.listen((e) => print('A got: $e'));
  final subB = controller.stream.listen((e) => print('B got: $e'));

  controller.add('update 1');
  controller.add('update 2');
  await Future.delayed(Duration.zero);

  await subA.cancel();
  controller.add('update 3');
  await Future.delayed(Duration.zero);

  await controller.close();
}


//task 12--------------------------------


int divide(int a, int b) => a ~/ b;

void level2(int x) {
  print(divide(10, x));
}

void level1(int x) {
  level2(x);
}

void main() {
  try {
    level1(0);
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:');
    print(stackTrace);
  }
  print('Current position:');
  print(StackTrace.current);
}


void parseAge(String s) {
  try {
    if (s.isEmpty) throw FormatException('bad input');
    print('Age: ${int.parse(s)}');
  } on FormatException {
    print('parseAge: logging the failure');
    rethrow;
  }
}

void main() {
  try {
    parseAge('25');
    parseAge('');
  } catch (e) {
    print('main caught: $e');
  }
}



import 'dart:async';
import 'dart:io';

sealed class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class ServerFailure extends Failure {
  final int code;
  const ServerFailure(super.message, this.code);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class HttpStatusException implements Exception {
  final int code;
  HttpStatusException(this.code);
}

class ApiClient {
  Future<String> _rawRequest(String path) async {
    switch (path) {
      case '/ok':
        return 'data';
      case '/offline':
        throw SocketException('no route to host');
      case '/slow':
        throw TimeoutException('too slow');
      case '/broken':
        throw HttpStatusException(500);
      default:
        throw StateError('unexpected');
    }
  }

  Future<(String?, Failure?)> get(String path) async {
    try {
      final data = await _rawRequest(path);
      return (data, null);
    } on SocketException {
      return (null, const NetworkFailure('No internet'));
    } on TimeoutException {
      return (null, const TimeoutFailure('Request timed out'));
    } on HttpStatusException catch (e) {
      return (null, ServerFailure('Server error ${e.code}', e.code));
    } catch (_) {
      return (null, const UnknownFailure('Unexpected error'));
    }
  }
}

void main() async {
  final client = ApiClient();

  for (final path in ['/ok', '/offline', '/slow', '/broken', '/other']) {
    final (data, failure) = await client.get(path);
    if (failure != null) {
      print('$path -> ${failure.runtimeType}: ${failure.message}');
    } else {
      print('$path -> $data');
    }
  }
}



