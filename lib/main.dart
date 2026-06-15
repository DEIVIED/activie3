import 'package:flutter/material.dart';

void main() {
  runApp(MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine Infos'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // action menu
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // action recherche
            },
          ),
        ],
      ),
      body: Center(child: Image.asset('images/magazineInfo.png')),

      floatingActionButton: FloatingActionButton(
        // Arrondir le boutton
        shape: CircleBorder(),
        backgroundColor: Colors.pink, // couleur conforme à la figure
        onPressed: () {
          print('Tu as cliqué dessus');
        },
        child: Text('Click', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
