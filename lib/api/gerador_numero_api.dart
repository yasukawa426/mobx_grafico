import 'dart:convert';

import 'package:http/http.dart' as http;

class GeradorNumero {
  static gerarNumero() async {
    var url = "https://csrng.net/csrng/csrng.php?min=1&max=100";
    var uri = Uri.parse(url);

    //faz a requisição
    var resposta = await http.get(uri);
    //transforma em json
    var json = jsonDecode(resposta.body);
    print(json["random"]);
  }
}
