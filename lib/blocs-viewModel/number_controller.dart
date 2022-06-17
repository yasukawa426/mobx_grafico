import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/number_generator_api.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
part 'number_controller.g.dart';

///Junção de NumberControllerBase com _$NumberController (number_controller.g.dart).
class NumberController = NumberControllerBase with _$NumberController;

///Essa classe faz o controlle dos valores que aparecem no gráfico e no relatório.
abstract class NumberControllerBase with Store {
  ///Instância da model criada com uma lista de números vazia.
  @observable
  NumberModel model = NumberModel(List.empty(), List.empty());

  ///Chama a API [NumberGenerator] para gerar um par de lista de números, então, popula a instância da model com ela.\
  ///[amount] se trata da quantidade de números em cada lista, com valor padrão de 20.
  @action
  void generateNumbers({amount=20}) {
    List<int> randomNumbers = NumberGenerator.generateNumbers(amount);
    List<int> randomYears = NumberGenerator.generateNumbers(amount, min: 2000, max: 30);
    ///é necessario criar uma nova instancia do objeto para o mobx notificar a interface
    model = NumberModel(randomNumbers, randomYears);
  }
}
