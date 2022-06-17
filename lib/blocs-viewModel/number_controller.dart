import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/number_generator_api.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
part 'number_controller.g.dart';

class NumberController = NumberControllerBase with _$NumberController;

abstract class NumberControllerBase with Store {
  @observable
  late NumberModel model;

  generateNumbers() {
    var numero = NumberGenerator.generateNumbers(20);
    print("Numero: $numero");
  }
}
