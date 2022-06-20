
import 'dart:math';

// import 'package:http/http.dart' as http;

///Geradora de números aleatórios.
///
///Essa classe é responsável por gerar números aleátorios.
class NumberGenerator {
  ///Método estático que gera uma lista populada com números aleátorios.
  ///[amount] é a quantidade de números à serem gerados.\
  ///[min] se refere ao valor minimo dos números gerados, com valor padrão de "0" (Apenas positivo. Inclusivo).\
  ///[max] se refere ao valor máximo do numero gerado, com valor padrão de "100".
  static List<int> generateNumbers(int amount, {int min = 0, int max = 100}) {
    List<int> numbers = List.generate(
      amount,
      growable: false,
      (index) {
        Random random = Random();
        return min + random.nextInt(max - min);
      },
    );
    return numbers;



    // var url = "https://csrng.net/csrng/csrng.php?max=100";
    // var uri = Uri.parse(url);
    // //faz a requisição
    // var resposta = await http.get(uri);
    // //transforma em json
    // var json = jsonDecode(resposta.body);
    // var numeroAleatorio = json[0]["random"];
    // print("random: $numeroAleatorio");
  }
}
