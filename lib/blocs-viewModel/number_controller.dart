import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/number_generator_api.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
part 'number_controller.g.dart';

///Junção de NumberControllerBase com _$NumberController (number_controller.g.dart).
class NumberController = NumberControllerBase with _$NumberController;

///Essa classe faz o controlle dos valores que aparece no gráfico e no relatório.
abstract class NumberControllerBase with Store {
  ///Instância da model
  @observable
  late NumberModel model;

  ///Chama a API [NumberGenerator] para gerar uma lista de números, então, popula a instância da model com a lista
  @action
  generateNumbers() {
    var numbers = NumberGenerator.generateNumbers(20);
    model = NumberModel(numbers);
    
  }
}
