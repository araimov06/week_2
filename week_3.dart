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
