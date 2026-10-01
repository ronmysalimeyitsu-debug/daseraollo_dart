import 'package:pin_pon/dificultad.dart';
import 'package:pin_pon/entities.dart';

class IAPingPong {
  final Dificultad dificultad;

  IAPingPong(this.dificultad);

  void moverPaleta(Paleta paleta, Pelota pelota) {
    // La paleta intenta seguir la posición vertical de la pelota
    if (pelota.y < paleta.y) {
      paleta.moverArriba();
    } else if (pelota.y > paleta.y + paleta.alto) {
      paleta.moverAbajo(30); // Ajusta según el alto de tu campo
    }
  }
}
