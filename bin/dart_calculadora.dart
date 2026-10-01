// bin/dart_calculadora.dart
import 'package:dart_calculadora/dart_calculadora.dart' as dart_calculadora;
import 'package:dart_calculadora/dart_io.dart' as entrada;
import 'package:dart_calculadora/dart_sintaxis.dart' as dart_sintaxis;

void main(List<String> arguments) {
  // 1. PRIMERO MOSTRAMOS LA CALCULADORA ASCII
  entrada.mostrarCalculadoraAscii();

  // 2. LUEGO PEDIMOS EL NOMBRE
  final nombre = entrada.pedirNombre();

  // 3. MOSTRAMOS EL MENSAJE
  print(dart_sintaxis.generarmensaje(nombre));

  // 4. EJECUTAMOS LAS OPERACIONES
  print('Suma: ${dart_calculadora.sum(6, 5)}!');
  print('Resta: ${dart_calculadora.subtract(6, 8)}!');
  print('Multiplicación: ${dart_calculadora.multiply(6, 9)}!');
  print('División: ${dart_calculadora.divide(6, 6)}!');

  // 5. NUEVAS FUNCIONES AVANZADAS:
  print('Potencia (2^3): ${dart_calculadora.power(2, 3)}!');
}
