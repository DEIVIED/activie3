import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/magazine.dart';
import '../widgets/menu_navigation.dart';
import '../widgets/magazine_image.dart';
import '../widgets/section_icone.dart';
import '../widgets/section_service.dart';
import '../widgets/section_texte.dart';
import '../widgets/section_titre.dart';
import 'ajout_redacteur_page.dart';
import 'redacteur_info_page.dart';

enum PageActive { accueil, ajoutRedacteur, listeRedacteurs }

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final RedacteurController _redacteurController = RedacteurController();
  PageActive _pageActive = PageActive.accueil;

  Magazine get _magazine => const Magazine(
    titre: 'Magazine Infos',
    imagePath: 'assets/images/magazineInfo.png',
    boutonTexte: 'Ajouter',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titrePage())),
      drawer: MenuNavigation(
        onAccueilSelected: () => _changerPage(PageActive.accueil),
        onAjoutRedacteurSelected: () => _changerPage(PageActive.ajoutRedacteur),
        onListeRedacteursSelected: () =>
            _changerPage(PageActive.listeRedacteurs),
      ),
      body: _contenuPage(),
      floatingActionButton: _pageActive == PageActive.accueil
          ? FloatingActionButton.extended(
              onPressed: () => _changerPage(PageActive.ajoutRedacteur),
              icon: const Icon(Icons.person_add),
              label: Text(_magazine.boutonTexte),
            )
          : null,
    );
  }

  String _titrePage() {
    return switch (_pageActive) {
      PageActive.accueil => _magazine.titre,
      PageActive.ajoutRedacteur => 'Ajouter un redacteur',
      PageActive.listeRedacteurs => 'Liste des redacteurs',
    };
  }

  Widget _contenuPage() {
    return switch (_pageActive) {
      PageActive.accueil => _accueil(),
      PageActive.ajoutRedacteur => AjoutRedacteurPage(
        controller: _redacteurController,
        onEnregistre: () => _changerPage(PageActive.listeRedacteurs),
      ),
      PageActive.listeRedacteurs => RedacteurInfoPage(
        controller: _redacteurController,
      ),
    };
  }

  Widget _accueil() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitre(titre: _magazine.titre),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MagazineImage(imagePath: _magazine.imagePath),
          ),
          const SizedBox(height: 16),
          const SectionTexte(
            texte:
                'Application mobile de gestion des informations du magazine et des redacteurs, avec synchronisation en temps reel dans Firebase Firestore.',
          ),
          const SizedBox(height: 20),
          const SectionIcone(
            icone: Icons.cloud_sync,
            titre: 'Firestore',
            sousTitre: 'Les donnees des redacteurs sont stockees en ligne.',
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: SectionService(
                  icone: Icons.person_add,
                  titre: 'Ajouter',
                  description: 'Creer un redacteur.',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SectionService(
                  icone: Icons.people,
                  titre: 'Consulter',
                  description: 'Afficher la liste.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changerPage(PageActive page) {
    setState(() {
      _pageActive = page;
    });
  }
}
