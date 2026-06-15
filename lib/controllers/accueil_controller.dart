import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/magazine.dart';
import '../models/utilisateur.dart';
import 'utilisateur_firestore_service.dart';

enum PageActive { accueil, ajoutUtilisateur, listeUtilisateurs }

class AccueilController extends ChangeNotifier {
  AccueilController({UtilisateurFirestoreService? utilisateurService})
    : _utilisateurService =
          utilisateurService ?? UtilisateurFirestoreService() {
    _subscription = _utilisateurService.ecouterUtilisateurs().listen((
      utilisateurs,
    ) {
      _utilisateurs = utilisateurs;
      notifyListeners();
    });
  }

  Magazine get magazine => const Magazine(
    titre: 'Magazine Infos',
    imagePath: 'assets/images/magazineInfo.png',
    boutonTexte: 'Click',
  );

  final UtilisateurFirestoreService _utilisateurService;
  late final StreamSubscription<List<Utilisateur>> _subscription;

  List<Utilisateur> _utilisateurs = [];
  PageActive _pageActive = PageActive.accueil;
  Utilisateur? _utilisateurEnModification;

  List<Utilisateur> get utilisateurs => List.unmodifiable(_utilisateurs);
  PageActive get pageActive => _pageActive;
  Utilisateur? get utilisateurEnModification => _utilisateurEnModification;

  void afficherAccueil() {
    _pageActive = PageActive.accueil;
    _utilisateurEnModification = null;
    notifyListeners();
  }

  void afficherFormulaireAjout() {
    _pageActive = PageActive.ajoutUtilisateur;
    _utilisateurEnModification = null;
    notifyListeners();
  }

  void afficherListeUtilisateurs() {
    _pageActive = PageActive.listeUtilisateurs;
    _utilisateurEnModification = null;
    notifyListeners();
  }

  Future<void> ajouterUtilisateur({
    required String fullname,
    required String email,
  }) async {
    await _utilisateurService.ajouterUtilisateur(
      Utilisateur(fullname: fullname, email: email),
    );
    afficherListeUtilisateurs();
  }

  void preparerModification(Utilisateur utilisateur) {
    _utilisateurEnModification = utilisateur;
    _pageActive = PageActive.ajoutUtilisateur;
    notifyListeners();
  }

  Future<void> modifierUtilisateur({
    required String id,
    required String fullname,
    required String email,
  }) async {
    await _utilisateurService.modifierUtilisateur(
      Utilisateur(id: id, fullname: fullname, email: email),
    );
    afficherListeUtilisateurs();
  }

  Future<void> supprimerUtilisateur(String id) async {
    await _utilisateurService.supprimerUtilisateur(id);
  }

  void rechercher() {
    // Action recherche a completer.
  }

  void cliquerBouton() {
    // Action du bouton flottant a completer.
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
