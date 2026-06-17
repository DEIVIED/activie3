// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:activite3/main.dart';

void main() {
  testWidgets('Affiche la page magazine', (WidgetTester tester) async {
    await tester.pumpWidget(const MonAppli());

    expect(find.text('Magazine Infos'), findsWidgets);
    expect(find.text('Ajouter'), findsOneWidget);
    expect(find.text('Firestore'), findsOneWidget);
  });
}
