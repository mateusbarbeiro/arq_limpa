class Atividade {
  int? id;
  String nome;
  int maximoHoras;
  int equivalencia; // porcentagem

  Atividade({
    this.id,
    required this.nome,
    required this.maximoHoras,
    required this.equivalencia,
  });

  void validarNome() {
    nome.length <= 3
        ? throw Exception('Nome não pode conter menos que 3 caracteres')
        : null;
  }

  void validarMaximoHoras() {
    maximoHoras == 0
        ? throw Exception('Deve ser informado quantidade máxima de horas')
        : null;

    maximoHoras < 0
        ? throw Exception('Quantidade máxima de horas não podem ser negativas')
        : null;
  }

  void validarEquivalencia() {
    equivalencia == 0
        ? throw Exception('Deve ser informado equivalencia')
        : null;

    equivalencia < 0
        ? throw Exception('Equivalencia não pode ser negativa')
        : null;

    equivalencia > 100
        ? throw Exception('Equivalencia não pode ser maior que 100')
        : null;
  }
}
