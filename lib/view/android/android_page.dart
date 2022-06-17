import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/controller.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/number_controller.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumberController controller = NumberController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráfico")),
      body: Column(children: [
        const SizedBox(height: 5),
        const Center(
            child: Text(
                "Clique no botão para gerar o seu primeiro conjunto de números. Clique novamente para gerar um novo conjunto.")),
        const SizedBox(height: 5),
        ElevatedButton(
            onPressed: () {
              controller.generateNumbers();
            },
            child: const Text("Gerar números")),
        Row(
          children: [
            Card(
                child: Container(
              height: 20,
            )),
            Card(
                child: Container(
              height: 20,
            )),
          ],
        )
      ]),
    );
  }
}
