import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/number_controller.dart';

void main() {
  group("showSeries", () {
    NumberController controller = NumberController();

    test("valor deveria começar em 'false'", () {
      expect(controller.showSeries, false);
    });

    test("mudando valor para true", () {
      //muda pra true
      controller.changeShowSeries(true);
      expect(controller.showSeries, true);
    });

    test("mudando para false", () {
      //muda pra false dnv
      controller.changeShowSeries(false);
      expect(controller.showSeries, false);
    });
  });
}
