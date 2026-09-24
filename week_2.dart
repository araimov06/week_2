// task 1
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


//task 2

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
