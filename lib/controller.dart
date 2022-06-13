import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//Store permite usar o gerador de codigo
abstract class ControllerBase with Store {
  @observable
  String nome = "";

  @observable
  String sobrenome = "";

  @computed
  String get nomeCompleto => "$nome $sobrenome";

  @action
  mudarNome(String novoNome) {
    nome = novoNome;
  }

  @action
  mudarSobrenome(String novoSobrenome) {
    sobrenome = novoSobrenome;
  }
}
