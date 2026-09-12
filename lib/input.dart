import 'dart:io';

void configurarTeclado(Function(String) onTecla) {
  try {
    // Desactiva el modo de línea y el eco en pantalla de forma segura para Windows
    stdin.lineMode = false;
    stdin.echoMode = false;
  } catch (e) {
    // Evita que colapse en terminales incompatibles
  }

  stdin.listen((List<int> codigos) {
    for (var code in codigos) {
      final char = String.fromCharCode(code).toLowerCase();
      onTecla(char);
    }
  });
}
