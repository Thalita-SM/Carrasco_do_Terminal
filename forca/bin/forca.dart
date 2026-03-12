import 'dart:io';
import 'dart:math';

void main() {
  // Lista de palavras
  List<String> palavras = ["banana", "abacaxi", "morango", "laranja", "uva"];

  // Sorteio da palavra
  Random random = Random();
  String palavraSecreta = palavras[random.nextInt(palavras.length)].toUpperCase();

  // Estado inicial
  List<String> letrasDescobertas = List.filled(palavraSecreta.length, "_");
  List<String> erros = [];
  int vidas = 6;

  // Loop do jogo
  while (vidas > 0 && letrasDescobertas.contains("_")) {
    print("\nPalavra: ${letrasDescobertas.join(" ")}");
    print("Erros: $erros");
    print("Tentativas restantes: $vidas");

    stdout.write("Digite uma letra: ");
    String? entrada = stdin.readLineSync();

    // Validação da entrada
    if (entrada == null || entrada.length != 1) {
      print("Digite apenas uma letra!");
      continue;
    }

    String letra = entrada.toUpperCase();

    if (palavraSecreta.contains(letra)) {
      for (int i = 0; i < palavraSecreta.length; i++) {
        if (palavraSecreta[i] == letra) {
          letrasDescobertas[i] = letra;
        }
      }
      print("Boa! Você acertou uma letra.");
    } else {
      if (!erros.contains(letra)) {
        erros.add(letra);
        vidas--;
        print("Ops! A letra não está na palavra.");
      } else {
        print("Você já tentou essa letra.");
      }
    }
  }

  // Resultado final
  if (!letrasDescobertas.contains("_")) {
    print("\n🎉 Parabéns! Você venceu! A palavra era: $palavraSecreta");
  } else {
    print("\n💀 Você perdeu! A palavra era: $palavraSecreta");
  }
}

