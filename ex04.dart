import 'dart:io';

class ProdutoPares {
  int calcular(int n) {
    int produto = 1;
    for (int i = 1; i <= n; i++) {
      if (i % 2 == 0) {
        produto *= i;
      }
    }
    return produto;
  }
}

class AplicativoProdutoPares {
  void iniciar() {
    final ProdutoPares _produtopares = ProdutoPares();
    for (;;) {
      _mostrarMenu();
      String? opcao = stdin.readLineSync();
      switch (opcao) {
        case "1":
          print("Soma dos ímpares: ${_produtopares.calcular(_lerNumero())}");
          break;
        case "0":
          print("Até mais!");
          return;
        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }

  int _lerNumero() {
    for (;;) {
      stdout.write('Insira o maior número a se considerar:');
      String? numeroDigitado = stdin.readLineSync();
      if (numeroDigitado == null || numeroDigitado.isEmpty) {
        print("Nenhum número foi digitado. Tente novamente.");
        continue;
      }
      int? numero = int.tryParse(numeroDigitado);
      if (numero == null) {
        print('Número inválido. Tente novamente.');
        continue;
      }
      return numero;
    }
  }

  void _mostrarMenu() {
    print("=======================");
    print("Opções:");
    print('1 - Calcular Produto dos pares;');
    print('0 - Sair.');
    print("=======================");
    stdout.write('Escolha uma opção: ');
  }
}

void main() {
  AplicativoProdutoPares app = AplicativoProdutoPares();
  app.iniciar();
}
