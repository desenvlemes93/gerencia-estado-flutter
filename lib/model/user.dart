class User {
  final int id;
  final String nome;
  final String email;
  User({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        User(
          id: id,
          nome: name,
          email: email,
        ),
      _ => throw ArgumentError('invalid Json'),
    };
  }

  @override
  String toString() => 'User(id: $id, nome: $nome, email: $email)';
}
