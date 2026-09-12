import 'dart:io';

String pedirNombre() {
  stdout.writeln('Hola soy la calculadora de dart ¿Cuál es tu nombre?');
  String? nombre = stdin.readLineSync();

  if (nombre == null || nombre.trim().isEmpty) {
    return 'Usuario';
  }
  return nombre.trim();
}

void mostrarCalculadoraAscii() {
  print(r'''
   _______________________
  |  ___________________  |
  | |       ITSU      0.| |
  | |___________________| |
  |  ___ ___ ___ ___ ___  |
  | | 7 | 8 | 9 | + | √ | |
  | |___|___|___|___|___| |
  | | 4 | 5 | 6 | - | ^ | |
  | |___|___|___|___|___| |
  | | 1 | 2 | 3 | * | % | |
  | |___|___|___|___|___| |
  | | . | 0 | = | / | C | |
  | |___|___|___|___|___| |
  |_______________________|
  ''');

  print('=================================');
  print('      CALCULADORA AVANZADA       ');
  print('=================================');
  print('Operadores disponibles:');
  print('  [+] Suma         [-] Resta');
  print('  [*] Multiplicar  [/] Dividir');
  print('  [^] Potencia     [√] Raíz Cuadrada');
  print('  [%] Módulo (Resto)');
  print('=================================');
}
