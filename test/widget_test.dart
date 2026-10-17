import 'package:flutter_test/flutter_test.dart';
import 'package:movie_explorer/main.dart';

void main() {
  testWidgets('shows the Movie Explorer list', (tester) async {
    await tester.pumpWidget(const MovieExplorerApp());

    expect(find.text('Movie Explorer'), findsOneWidget);
    expect(find.text('Midnight Orbit'), findsOneWidget);
    expect(find.text('Add movie'), findsOneWidget);
  });
}
