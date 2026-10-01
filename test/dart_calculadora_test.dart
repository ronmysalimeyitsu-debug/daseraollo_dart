import 'package:pin_pon/dart_calculadora.dart';
import 'package:test/test.dart';

void main() {
  test('calculadora básica', () {
    expect(sum(6, 7), 13);
    expect(subtract(6, 7), -1);
    expect(multiply(6, 7), 42);
    expect(divide(14, 7), 2);
  });
}
