// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobx_exemplo_grafico/view/android/android_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  group("Teste da tela", () {
    testWidgets('text field', (WidgetTester tester) async {
      await tester.pumpWidget(const AndroidApp());
      //procura o switch pelo tipo, o esperado é achar apenas 1
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('gráfico', (WidgetTester tester) async {
      await tester.pumpWidget(const AndroidApp());
      //procura o chart pelo tipo, o esperado é achar apenas 1
      expect(find.byType(SfCartesianChart), findsOneWidget);
    });

    testWidgets('relatório', (WidgetTester tester) async {
      await tester.pumpWidget(const AndroidApp());
      //procura o datatable2 pelo tipo, o esperado é achar apenas 1
      expect(find.byType(DataTable2), findsOneWidget);
    });
  });
}
