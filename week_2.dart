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

