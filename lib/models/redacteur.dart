class Redacteur {
  const Redacteur({this.id, required this.nom, required this.specialite});

  final String? id;
  final String nom;
  final String specialite;

  Map<String, dynamic> toMap() {
    return {'nom': nom, 'specialite': specialite};
  }

  factory Redacteur.fromMap(String id, Map<String, dynamic> map) {
    return Redacteur(
      id: id,
      nom: map['nom'] as String? ?? '',
      specialite: map['specialite'] as String? ?? '',
    );
  }
}
