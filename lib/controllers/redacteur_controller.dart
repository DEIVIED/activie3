import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/redacteur.dart';

class RedacteurController {
  RedacteurController({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('redacteurs');

  Stream<List<Redacteur>> listerRedacteurs() {
    return _collection
        .orderBy('nom')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Redacteur.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> ajouterRedacteur({
    required String nom,
    required String specialite,
  }) {
    return _collection.add(Redacteur(nom: nom, specialite: specialite).toMap());
  }

  Future<void> modifierRedacteur(Redacteur redacteur) {
    final id = redacteur.id;
    if (id == null) {
      return Future.value();
    }

    return _collection.doc(id).update(redacteur.toMap());
  }

  Future<void> supprimerRedacteur(String id) {
    return _collection.doc(id).delete();
  }
}
