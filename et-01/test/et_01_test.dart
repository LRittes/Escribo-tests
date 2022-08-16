import '../bin/et_01.dart';
import 'package:test/test.dart';

void main() {
  List<int> numbers = [3, 5, 10, 11];
  List<int> expected = [0, 3, 23, 33];
  for (var idx = 0; idx < numbers.length; idx++) {
    test('Deve retornar ${expected[idx]} com entrada de dado ${numbers[idx]}\n',
        () {
      expect(calculate(numbers[idx]), equals(expected[idx]));
    });
  }
}
