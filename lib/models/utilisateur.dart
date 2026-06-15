class Utilisateur {
  const Utilisateur({this.id, required this.fullname, required this.email});

  final String? id;
  final String fullname;
  final String email;

  Map<String, dynamic> toMap() {
    return {'fullname': fullname, 'email': email};
  }

  factory Utilisateur.fromMap(String id, Map<String, dynamic> map) {
    return Utilisateur(
      id: id,
      fullname: map['fullname'] as String? ?? '',
      email: map['email'] as String? ?? '',
    );
  }
}
