import 'dart:io';

class Triangulo {
  double _base;
  double _altura;

  Triangulo(this._base, this._altura);

  double calcularArea() {
    return (_base * _altura) / 2;
  }

  void setTriangulo(double base, double altura) {
    _base = base;
    _altura = altura;
  }

  double get getBase => _base;
  double get getAltura => _altura;
}

class AplicativoTriangulo {
  void iniciar() {
    final Triangulo _triangulo = Triangulo(
      _lerTamanho("Base"),
      _lerTamanho("Altura"),
    );
    for (;;) {
      _mostrarMenu();
      String? opcao = stdin.readLineSync();
      switch (opcao) {
        case "1":
          _triangulo.setTriangulo(_lerTamanho("Base"), _lerTamanho("Altura"));
          break;
        case "2":
          print("Área do triângulo: ${_triangulo.calcularArea()}");
          break;
        case "0":
          print("Até mais!");
          return;
        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }

  double _lerTamanho(String tipo) {
    stdout.write('Insira o ${tipo} do triângulo:');
    for (;;) {
      String? tamanhoDigitado = stdin.readLineSync();
      if (tamanhoDigitado == null || tamanhoDigitado.isEmpty) {
        print("Nenhum ${tipo} foi digitado. Tente novamente.");
        continue;
      }
      double? tamanho = double.tryParse(tamanhoDigitado);
      if (tamanho == null) {
        print('${tipo} inválido. Tente novamente.');
        continue;
      }
      return tamanho;
    }
  }

  void _mostrarMenu() {
    print("=======================");
    print("Opções:");
    print('1 - Redefinir a base e a altura do triângulo;');
    print('2 - Calcular a área do triângulo;');
    print('0 - Sair.');
    print("=======================");
    stdout.write('Escolha uma opção: ');
  }
}

void main() {
  AplicativoTriangulo app = AplicativoTriangulo();
  app.iniciar();
}