import 'package:flutter_test/flutter_test.dart';
import 'package:laurente_project/app.dart';

void main() {
  testWidgets('Home page opens and navigates to Login', (tester) async {
    await tester.pumpWidget(const LaurenteProjectApp());

    expect(find.text('CampusEats'), findsOneWidget);
    expect(find.text('Good food.\nMade easy.'), findsOneWidget);

    await tester.tap(find.text('Log in').first);
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('Login form shows validation for empty fields', (tester) async {
    await tester.pumpWidget(const LaurenteProjectApp());

    await tester.tap(find.text('Log in').first);
    await tester.pumpAndSettle();
    final loginButton = find.text('Log in').last;
    await tester.ensureVisible(loginButton);
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your email.'), findsOneWidget);
    expect(find.text('Please enter your password.'), findsOneWidget);
  });
}
