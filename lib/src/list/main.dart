import 'package:equatable/equatable.dart';

void main() {
  List<Cat> test = [Cat(name: 'dog'), Cat(name: 'cai'), Cat(name: 'lon')];
  List<int> test2 = [1, 2, 3, 4];
  List<int> test3 = [1, 2, 3, 4];
  List<dynamic> testMix = [1, 2, 3, 4, Cat(name: 'dog'), Cat(name: 'cai'),Cat(name: 'cai')];

  List<Cat> listOf = List.of(test);
  List<Cat> listFrom = List.from(test);
  test.add(Cat(name: 'bo'));
  print(listOf[0] == listFrom[1]);
  // print(listEquals(listOf, listFrom));
  print(testMix.toSet().toList());
  print(10.0 as int);
}

class Cat extends Equatable {
  final String? name;
  final String? color;

  const Cat({this.name, this.color});

  @override
  List<Object?> get props => [name, color];

  @override
  String toString() {
    return 'Cat{name: $name, color: $color}';
  }
}
