import 'dart:io';

class Numeros {
  List<int> _numeros;

  Numeros(this._numeros) {
    if (_numeros.length != 5) {
      throw Exception("A lista deve conter exatamente 5 números.");
    }
  }

  int somarPares() {
    int soma = 0;
    for (int num in _numeros) {
      if (num % 2 == 0) {
        soma += num;
      }
    }
    return soma;
  }

  int somarImpares() {
    int soma = 0;
    for (int num in _numeros) {
      if (num % 2 != 0) {
        soma += num;
      }
    }
    return soma;
  }

  void setNumeros(List<int> numeros) {
    if (numeros.length != 5) {
      throw Exception("A lista deve conter exatamente 5 números.");
    }
    _numeros = numeros;
  }
}

class AplicativoNumero {
  void iniciar() {
    final Numeros _numeros = Numeros(_lerNumero());
    for (;;) {
      _mostrarMenu();
      String? opcao = stdin.readLineSync();
      switch (opcao) {
        case "1":
          _numeros.setNumeros(_lerNumero());
          break;
        case "2":
          print("Soma dos pares: ${_numeros.somarPares()}");
          print("Soma dos ímpares: ${_numeros.somarImpares()}");
          break;
        case "0":
          print("Até mais!");
          return;
        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }

  List<int> _lerNumero() {
    List<int> numeros = [];
    int i = 1;
    for (; i <= 5;) {
      stdout.write('Insira o ${i}º número:');
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
      numeros.add(numero);
      i++;
    }
    return numeros;
  }

  void _mostrarMenu() {
    print("=======================");
    print("Opções:");
    print('1 - Redefinir número;');
    print('2 - Somar pares e ímpares;');
    print('0 - Sair.');
    print("=======================");
    stdout.write('Escolha uma opção: ');
  }
}

void main() {
  AplicativoNumero app = AplicativoNumero();
  app.iniciar();
}