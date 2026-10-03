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


