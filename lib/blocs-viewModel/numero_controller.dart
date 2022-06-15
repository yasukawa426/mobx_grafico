import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_grafico/api/gerador_numero_api.dart';
import 'package:mobx_exemplo_grafico/model/numero_model.dart';
part 'numero_controller.g.dart';

class NumeroController = NumeroControllerBase with _$NumeroController;

abstract class NumeroControllerBase with Store {
  @observable
  late NumeroModel model;

  gerarNumeros() {
    GeradorNumero.gerarNumero();
  }
}
