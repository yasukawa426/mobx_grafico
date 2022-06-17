import 'dart:convert';
import 'dart:math';

// import 'package:http/http.dart' as http;

///Geradora de números aleatórios
///
///Essa classe é responsável por gerar números aleátorios
class NumberGenerator {
  ///Método estático que gera uma lista populada com números aleátorios. 
  ///[amount] é a quantidade de números à serem gerados.
  static List<int> generateNumbers(int amount) {
    List<int> numbers = List.generate(
      amount,
      growable: false,
      (index) {
        var random = Random();
        return random.nextInt(100);
      },
    );

    // var url = "https://csrng.net/csrng/csrng.php?max=100";
    // var uri = Uri.parse(url);
    // //faz a requisição
    // var resposta = await http.get(uri);
    // //transforma em json
    // var json = jsonDecode(resposta.body);
    // var numeroAleatorio = json[0]["random"];
    // print("random: $numeroAleatorio");
    return numbers;
  }
}
