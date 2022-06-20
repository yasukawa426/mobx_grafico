import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/number_controller.dart';

void main() {
  NumberController controller = NumberController();
  test("Testando changeShowSeries", () {
    //o valor esperado padrão é false
    expect(controller.showSeries, false);

    //muda pra true
    controller.changeShowSeries(true);
    expect(controller.showSeries, true);

    //muda pra false dnv
    controller.changeShowSeries(false);
    expect(controller.showSeries, false);
  });
}
