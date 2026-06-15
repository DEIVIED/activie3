import 'package:flutter/material.dart';

import '../controllers/accueil_controller.dart';
import '../models/utilisateur.dart';
import '../widgets/menu_navigation.dart';
import '../widgets/magazine_image.dart';
import '../widgets/magazine_floating_button.dart';
import '../widgets/utilisateur_formulaire.dart';
import '../widgets/utilisateurs_liste.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final AccueilController controller = AccueilController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final magazine = controller.magazine;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_titrePage(magazine.titre)),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: controller.rechercher,
              ),
            ],
          ),
          drawer: MenuNavigation(
            onAccueilSelected: controller.afficherAccueil,
            onAjoutUtilisateurSelected: controller.afficherFormulaireAjout,
            onListeUtilisateursSelected: controller.afficherListeUtilisateurs,
          ),
          body: _contenuPage(),
          floatingActionButton: controller.pageActive == PageActive.accueil
              ? MagazineFloatingButton(
                  label: magazine.boutonTexte,
                  onPressed: controller.cliquerBouton,
                )
              : null,
        );
      },
    );
  }

  String _titrePage(String titreAccueil) {
    return switch (controller.pageActive) {
      PageActive.accueil => titreAccueil,
      PageActive.ajoutUtilisateur =>
        controller.utilisateurEnModification == null
            ? 'Ajouter un utilisateur'
            : 'Modifier un utilisateur',
      PageActive.listeUtilisateurs => 'Liste des utilisateurs',
    };
  }

  Widget _contenuPage() {
    return switch (controller.pageActive) {
      PageActive.accueil => Center(
        child: MagazineImage(imagePath: controller.magazine.imagePath),
      ),
      PageActive.ajoutUtilisateur => UtilisateurFormulaire(
        utilisateur: controller.utilisateurEnModification,
        onEnregistrer: _enregistrerUtilisateur,
      ),
      PageActive.listeUtilisateurs => UtilisateursListe(
        utilisateurs: controller.utilisateurs,
        onModifier: controller.preparerModification,
        onSupprimer: controller.supprimerUtilisateur,
      ),
    };
  }

  void _enregistrerUtilisateur({
    Utilisateur? utilisateur,
    required String fullname,
    required String email,
  }) {
    if (utilisateur == null) {
      controller.ajouterUtilisateur(fullname: fullname, email: email);
      return;
    }

    final id = utilisateur.id;
    if (id == null) {
      return;
    }

    controller.modifierUtilisateur(id: id, fullname: fullname, email: email);
  }
}
