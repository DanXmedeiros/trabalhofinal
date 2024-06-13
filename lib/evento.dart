class Evento {
  int? id;
  String titulo;
  String descricao;
  DateTime data;

  Evento({this.id, required this.titulo, required this.descricao, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data': data.toIso8601String(),
    };
  }

  factory Evento.fromMap(Map<String, dynamic> map) {
    return Evento(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      data: DateTime.parse(map['data']),
    );
  }
}
