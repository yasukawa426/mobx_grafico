import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/number_generator_api.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
part 'number_controller.g.dart';

///Junção de NumberControllerBase com _$NumberController (number_controller.g.dart).
class NumberController = NumberControllerBase with _$NumberController;

///Essa classe faz o controlle dos valores que aparecem no gráfico e no relatório.
abstract class NumberControllerBase with Store {
  ///Lista Observavel de uma lista de [NumberModel], utilizada para preencher o gráfico e relatorio. Começa vazia, depois é preenchida com o método [generateNumbers].
  @observable
  ObservableList<List<NumberModel>> modelList =
      ObservableList<List<NumberModel>>.of([
    [NumberModel(0, 0)]
  ]);

  ///Representa o valor selecionado do menu dropdown.
  String? dropdownValue = "1";

  ///Representa todas os opções do dropdown. Preenchida dentro de [generateNumbers] com os índices da lista dentro da matriz.
  @observable
  ObservableList<DropdownMenuItem<String>> dropDownOptions =
      ObservableList<DropdownMenuItem<String>>.of([]);

  ///Chama a API [NumberGenerator] para gerar um par de lista de números, então, popula a lista [iModelList] com várias instâncias de [NumberModel].
  ///Em seguida, popula a lista [modelList] com a lista [iModelList]. \
  ///[amount] se trata da quantidade de números em cada lista, com valor padrão de 20.\
  ///[modelQty] se trata da quantidade de listas (ou séries) dentro de [modelList].
  @action
  void generateNumbers({amount = 20, modelQty = 3}) {
    ///esvazia a lista
    modelList.clear();
    dropDownOptions.clear();

    ///Reseta o valor para 1
    dropdownValue = "1";

    ///Lista temporaria que vai receber os índices das listas dentro da matriz
    List<String> tempList = [];

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
      tempList.add((i + 1).toString());
    }

    ///Transforma em uma lista de [DropdownMenuItem] e salva em [dropDownOptions]
    dropDownOptions = ObservableList<DropdownMenuItem<String>>.of(
        tempList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList());
  }
}
