import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/number_generator_api.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
part 'number_controller.g.dart';

///Junção de NumberControllerBase com _$NumberController (number_controller.g.dart).
class NumberController = NumberControllerBase with _$NumberController;

///Essa classe faz o controlle dos valores que aparecem no gráfico e no relatório.
abstract class NumberControllerBase with Store {
  ///Lista Observavel de [NumberModel], utilizada para preencher o gráfico e relatorio. Começa vazia, depois é preenchida com o método [generateNumbers].
  @observable
  ObservableList<List<NumberModel>> modelList = ObservableList<List<NumberModel>>.of([[NumberModel(0,0)]]);

  // ObservableList<NumberModel> modelList =
  //     ObservableList<NumberModel>.of([NumberModel(0, 0)]);

  ///Define se o gráfico irá mostrar multiplas séries.\
  ///true: sim. false: não.
  @observable
  bool showSeries = false;

  ///Muda o valor de [showSeries] para true ou false.
  @action
  changeShowSeries(bool value) {
    showSeries = value;
  }

  ///Chama a API [NumberGenerator] para gerar um par de lista de números, então, popula a lista [modelList] com várias instâncias de [NumberModel].\
  ///[amount] se trata da quantidade de números em cada lista, com valor padrão de 20.
  @action
  void generateNumbers({amount = 20, modelQty = 3}) {
    ///esvazia a lista
    modelList.clear();
    for (int i = 0; i < modelQty; i++) {
      List<int> randomNumbers = NumberGenerator.generateNumbers(amount);
      List<int> randomYears =
          NumberGenerator.generateNumbers(amount, min: 2000, max: 2030);

      ///ordena a lista de anos
      randomYears.sort();

      List<NumberModel> iModelList = [];

      ///preenche a lista
      for (int i = 0; i < amount; i++) {
        iModelList.add(NumberModel(randomNumbers[i], randomYears[i]));
      }
      modelList.add(iModelList);
    }
  }
}
