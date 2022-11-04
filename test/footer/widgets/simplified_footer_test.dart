import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:io_photobooth/footer/footer.dart';
import 'package:photobooth_ui/photobooth_ui.dart';

import '../../helpers/helpers.dart';

void main() {
  group('SimplifiedFooter', () {
    testWidgets(
      'render elements on small screen size',
      (WidgetTester tester) async {
        tester.setSmallDisplaySize();
        await tester.pumpApp(SimplifiedFooter());
        expect(find.byType(FlutterIconLink), findsOneWidget);
        expect(find.byType(FirebaseIconLink), findsOneWidget);
        expect(find.byType(TensorflowIconLink), findsOneWidget);
      },
    );

    testWidgets(
      'render elements on large screen size',
      (WidgetTester tester) async {
        tester.setDisplaySize(const Size(PhotoboothBreakpoints.large, 800));
        await tester.pumpApp(SimplifiedFooter());
        expect(find.byType(FlutterIconLink), findsOneWidget);
        expect(find.byType(FirebaseIconLink), findsOneWidget);
        expect(find.byType(TensorflowIconLink), findsOneWidget);
      },
    );
  });
}