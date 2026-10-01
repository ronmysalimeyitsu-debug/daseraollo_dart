import 'dart:async';
import 'dart:io';

import 'package:pin_pon/dificultad.dart';
import 'package:pin_pon/entities.dart';
import 'package:pin_pon/game_config.dart';
import 'package:pin_pon/iapingpong.dart';
import 'package:pin_pon/input.dart';
import 'package:pin_pon/render.dart';

int mostrarMenuPrincipal() {
  print('=================================');
  print('      JUEGO DE PIN PON - ITSU    ');
  print('=================================');
  print('1. Modo Single (Contra la Computadora)');
  print('2. Modo Versus (Jugador 1 vs Jugador 2)');
  stdout.write('Elige una opción (1 o 2): ');

  String? entrada = stdin.readLineSync();
  int opcion = int.tryParse(entrada ?? '') ?? 1;

  return (opcion == 2) ? 2 : 1;
}

void main() {
  int modoDeJuego = mostrarMenuPrincipal();

  stdout.write(saludo());
  stdout.write('\x1B[?25l'); // Ocultar cursor

  final ia = IAPingPong(Dificultad.facil);

  final pelota = Pelota(x: GameConfig.ancho ~/ 2, y: GameConfig.alto ~/ 2);

  final j1 = Paleta(x: 2, y: 8, alto: GameConfig.tamanoPaleta);
  final j2 = Paleta(
    x: GameConfig.ancho - 3,
    y: 8,
    alto: GameConfig.tamanoPaleta,
  );

  int puntajeJ1 = 0;
  int puntajeJ2 = 0;

  configurarTeclado((tecla) {
    if (tecla == 'w') j1.moverArriba();
    if (tecla == 's') j1.moverAbajo(GameConfig.alto);

    if (modoDeJuego == 2) {
      if (tecla == 'i') j2.moverArriba();
      if (tecla == 'k') j2.moverAbajo(GameConfig.alto);
    }

    if (tecla == 'q') {
      restaurarTerminal();
      exit(0);
    }
  });

  Timer.periodic(GameConfig.frameRate, (timer) {
    pelota.mover();

    if (modoDeJuego == 1) {
      ia.moverPaleta(j2, pelota);
    }

    if (pelota.y <= 0 || pelota.y >= GameConfig.alto - 1) {
      pelota.rebotarY();
    }

    if (pelota.x == j1.x + 1 &&
        (pelota.y >= j1.y && pelota.y < j1.y + j1.alto)) {
      pelota.rebotarX();
    }

    if (pelota.x == j2.x - 1 &&
        (pelota.y >= j2.y && pelota.y < j2.y + j2.alto)) {
      pelota.rebotarX();
    }

    if (pelota.x <= 0) {
      puntajeJ2++;
      pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
    } else if (pelota.x >= GameConfig.ancho - 1) {
      puntajeJ1++;
      pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
    }

    Renderer.dibujar(pelota, j1, j2, puntajeJ1, puntajeJ2);
  });

  ProcessSignal.sigint.watch().listen((_) {
    restaurarTerminal();
    exit(0);
  });
}

void restaurarTerminal() {
  stdout.write('\x1B[?25h'); // Mostrar cursor
  stdin.lineMode = true;
  stdin.echoMode = true;
}

String saludo() {
  return "Hola, este es un juego basico de pin pon en dart, realizado como ejemplo para los estudiantes de programación del ITSU! \n";
}
