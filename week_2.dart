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

