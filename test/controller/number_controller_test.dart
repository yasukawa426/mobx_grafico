import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_exemplo_grafico/viewModel/number_controller.dart';
// import 'package:mobx_exemplo_grafico/model/number_model.dart';

void main() {
  //Esse grupo de testes testa a variavel [showSeries] e o método [changeShowSeries()]
  // group("showSeries", () {
  //   NumberController controller = NumberController();

  //   test("valor deveria começar em 'false'", () {
  //     expect(controller.showSeries, false);
  //   });

  //   test("mudando valor para true", () {
  //     //muda pra true
  //     controller.changeShowSeries(true);
  //     expect(controller.showSeries, true);
  //   });

  //   test("mudando para false", () {
  //     //muda pra false dnv
  //     controller.changeShowSeries(false);
  //     expect(controller.showSeries, false);
  //   });
  // });

  //Testa o gerador de numeros.

  group(
    'Gerador ',
    () {
      NumberController controller = NumberController();
      Random rng = Random();

      test(
        "quantidade de números",
        () {
          //gera uma lista de 20 numeros e testa pra ver se tem 20
          int length = 20;
          controller.generateNumbers();
          expect(controller.modelList[0].length, length);

          //testa com uma quantidade de números aleátoria de até 100, 10 vezes
          for (int i = 0; i < 10; i++) {
            length = rng.nextInt(100);
            controller.generateNumbers(amount: length);
            expect(controller.modelList[0].length, length);
          }
        },
      );

      test(
        'quantidade de séries',
        () {
          int length;

          //o valor padrão é 3
          controller.generateNumbers();
          expect(controller.modelList.length, 3);

          //testa com uma quantidade de números aleátoria de até 100, 10 vezes
          for (int i = 0; i < 10; i++) {
            length = rng.nextInt(100);
            controller.generateNumbers(modelQty: length);
            expect(controller.modelList.length, length);
          }
        },
      );
    },
  );
}
