import 'package:dart_calculadora/dart_calculadora.dart' as dart_calculadora;
import 'package:dart_calculadora/dart_io.dart' as entrada;
import 'package:dart_calculadora/dart_sintaxis.dart' as dart_sintaxis;

void main(List<String> arguments) {
  final nombre = entrada.pedirNombre();

  print(dart_sintaxis.generarmensaje(nombre));
  print('Suma: ${dart_calculadora.sum(6, 5)}!');
  print('Resta: ${dart_calculadora.subtract(6, 8)}!');
  print('Multiplicación: ${dart_calculadora.multiply(6, 9)}!');
  print('División: ${dart_calculadora.divide(6, 6)}!');
}
