void main() {
  final json = {
    "value": 10,
  };
  final rs = Test(value: json['value'] as double?);

}

class Test {
  double? value;

  Test({this.value});
}
