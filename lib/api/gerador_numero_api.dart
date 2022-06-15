import 'dart:convert';

import 'package:http/http.dart' as http;

class GeradorNumero {
  static gerarNumero() async {
    var url = "https://csrng.net/csrng/csrng.php?max=100";
    var uri = Uri.parse(url);

    //faz a requisição
    var resposta = await http.get(uri);
    //transforma em json
    var json = jsonDecode(resposta.body);
    var numeroAleatorio = json[0]["random"];
    return numeroAleatorio;
  }
}
