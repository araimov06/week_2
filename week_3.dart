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

