import 'dart:io';

String pedirNombre() {
  stdout.writeln('Hola soy la calculadora de dart ¿Cuál es tu nombre?');
  String? nombre = stdin.readLineSync();

  if (nombre == null || nombre.trim().isEmpty) {
    return 'Usuario';
  }

  return nombre.trim();
}
