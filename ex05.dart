import 'dart:io';

class CadastroNotas {
  Map<String, double> alunos = {};

  void adicionarAluno(String nome, double media) {
    alunos[nome] = media;
    print("Aluno $nome adicionado com média $media.");
  }

  void atualizarAluno(String nome, double novaMedia) {
    if (alunos.containsKey(nome)) {
      alunos[nome] = novaMedia;
      print("Aluno $nome atualizado com nova média $novaMedia.");
    } else {
      print("Aluno $nome não encontrado.");
    }
  }

  void removerAluno(String nome) {
    if (alunos.containsKey(nome)) {
      alunos.remove(nome);
      print("Aluno $nome removido.");
    } else {
      print("Aluno $nome não encontrado.");
    }
  }

  Map<String, double> obterAprovados() {
    Map<String, double> aprovados = {};
    alunos.forEach((nome, media) {
      if (media >= 6) {
        aprovados[nome] = media;
      }
    });
    return aprovados;
  }

  Map<String, double> obterReprovados() {
    Map<String, double> reprovados = {};
    alunos.forEach((nome, media) {
      if (media < 6) {
        reprovados[nome] = media;
      }
    });
    return reprovados;
  }
}

class AplicativoCadastroNotas {
  void iniciar() {
    final CadastroNotas cadastroNotas = CadastroNotas();
    while (true) {
      _mostrarMenu();
      String? opcao = stdin.readLineSync();
      switch (opcao) {
        case "1":
          stdout.write('Insira o nome do aluno: ');
          cadastroNotas.adicionarAluno(_lerNome(), _lerNota());
          break;
        case "2":
          _atualizarAluno(cadastroNotas);
          break;
        case "3":
          _removerAluno(cadastroNotas);
          break;
        case "4":
          _listarAlunos("Aprovados", cadastroNotas.obterAprovados());
          break;
        case "5":
          _listarAlunos("Reprovados", cadastroNotas.obterReprovados());
          break;
        case "0":
          print("Até mais!");
          return;
        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }

  void _atualizarAluno(CadastroNotas cadastroNotas) {
    stdout.write("Digite o nome do aluno a ser atualizado: ");
    String nome = _lerNome();
    double novaMedia = _lerNota();
    cadastroNotas.atualizarAluno(nome, novaMedia);
  }

  void _removerAluno(CadastroNotas cadastroNotas) {
    stdout.write("Digite o nome do aluno a ser removido: ");
    String nome = _lerNome();
    cadastroNotas.removerAluno(nome);
  }

  void _listarAlunos(String titulo, Map<String, double> lista) {
    print("=========================");
    print("Lista dos alunos $titulo:");
    if (lista.isEmpty) {
      print("Nenhum aluno nesta categoria.");
    } else {
      lista.forEach((nome, media) {
        print("Aluno: $nome - Média: $media");
      });
    }
    print("=========================");
  }

  String _lerNome() {
    for (;;) {
      String? nome = stdin.readLineSync();
      if (nome == null || nome.isEmpty) {
        print("Nenhum nome foi digitado. Tente novamente.");
        continue;
      }
      return nome;
    }
  }

  double _lerNota() {
    for (;;) {
      stdout.write('Insira a nota do aluno: ');
      String? notaDigitado = stdin.readLineSync();
      if (notaDigitado == null || notaDigitado.isEmpty) {
        print("Nenhuma nota foi digitada. Tente novamente.");
        continue;
      }
      double? nota = double.tryParse(notaDigitado);
      if (nota == null) {
        print("Nota inválida. Tente novamente.");
        continue;
      }
      return nota;
    }
  }

  void _mostrarMenu() {
    print("\n=======================");
    print("Opções:");
    print("1 - Adicionar aluno e Nota;");
    print("2 - Atualizar aluno;");
    print("3 - Remover aluno;");
    print("4 - Lista dos aprovados;");
    print("5 - Lista dos reprovados;");
    print("0 - Sair.");
    print("=======================");
    stdout.write("Escolha uma opção: ");
  }
}

void main() {
  AplicativoCadastroNotas app = AplicativoCadastroNotas();
  app.iniciar();
}
