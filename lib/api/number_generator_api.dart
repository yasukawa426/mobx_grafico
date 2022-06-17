import 'dart:convert';
import 'dart:math';

// import 'package:http/http.dart' as http;

class NumberGenerator {
  static generateNumbers(int lenght) {
    List<int> numbers = List.generate(
      20,
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
