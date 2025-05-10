import 'dart:io';

class Funcionario {
  double _salario;

  Funcionario(this._salario);

  void reajustarSalario() {
    _salario = double.parse((_salario * 1.25).toStringAsFixed(2));
  }

  void novoSalario(double novoSalario) {
    _salario = double.parse(novoSalario.toStringAsFixed(2));
  }

  double get getSalario => _salario;
}

class AplicativoSalario {
  void iniciar() {
    stdout.write('Insira o salário inicial do funcionário: R\$');
    final Funcionario _funcionario = Funcionario(_lerSalario());
    for (;;) {
      _mostrarMenu();
      String? opcao = stdin.readLineSync();
      switch (opcao) {
        case "1":
          stdout.write('Insira o novo salário do funcionário: R\$');
          _funcionario.novoSalario(_lerSalario());
          break;
        case "2":
          print("Salário antes do reajuste: R\$${_funcionario.getSalario}");
          _funcionario.reajustarSalario();
          print("Salário após o reajuste: R\$${_funcionario.getSalario}");
          break;
        case "0":
          print("Até mais!");
          return;
        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }

  double _lerSalario() {
    for (;;) {
      String? salarioDigitado = stdin.readLineSync();
      if (salarioDigitado == null || salarioDigitado.isEmpty) {
        print("Nenhum salário foi digitado. Tente novamente.");
        continue;
      }
      double? salario = double.tryParse(salarioDigitado);
      if (salario == null) {
        print('Salário inválido. Tente novamente.');
        continue;
      }
      return salario;
    }
  }

  void _mostrarMenu() {
    print("=======================");
    print("Opções:");
    print('1 - Trocar salário atual;');
    print('2 - Reajustar salário;');
    print('0 - Sair.');
    print("=======================");
    stdout.write('Escolha uma opção: ');
  }
}

void main() {
  AplicativoSalario app = AplicativoSalario();
  app.iniciar();
}
