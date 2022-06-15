import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

///Faz o controle de nome e sobrenome.
///
///Esse é um exemplo de um paragrafo que deverá ser gerado pelo
///dartdoc. Estou escrevendo qualquer coisa só pra ver como ficar mesmo.
///Com o dartdoc da pra vc mencionar variaveis ([nome]), métodos ([mudarNome]) e tipos ([Controller]).
///Também é possível adicionar código:
/// ```dart
/// print("hello world");
/// ```
/// Utilizar **markdown.**
///* E
///* Fazer
///* Isso
///
///Essa classe fara o controle do nome e sobrenome, com eles sendo observables.
///Também tem uma ação "mudarNome" e "mudarSobrenome" que permite mudar o valor desses observables.
abstract class ControllerBase with Store {
  @observable
  String nome = "";

  @observable
  String sobrenome = "";

  ///Junção do nome com o sobrenome já como observable.
  @computed
  String get nomeCompleto => "$nome $sobrenome";

  ///Uma breve descrição do método.
  @action
  mudarNome(String novoNome) {
    nome = novoNome;
  }

  @action
  mudarSobrenome(String novoSobrenome) {
    sobrenome = novoSobrenome;
  }
}
