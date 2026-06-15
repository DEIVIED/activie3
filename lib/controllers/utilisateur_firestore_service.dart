import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/utilisateur.dart';

class UtilisateurFirestoreService {
  UtilisateurFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('utilisateurs');

  Stream<List<Utilisateur>> ecouterUtilisateurs() {
    return _collection
        .orderBy('fullname')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Utilisateur.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> ajouterUtilisateur(Utilisateur utilisateur) {
    return _collection.add(utilisateur.toMap());
  }

  Future<void> modifierUtilisateur(Utilisateur utilisateur) {
    final id = utilisateur.id;
    if (id == null) {
      return Future.value();
    }

    return _collection.doc(id).update(utilisateur.toMap());
  }

  Future<void> supprimerUtilisateur(String id) {
    return _collection.doc(id).delete();
  }
}
