import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/number_controller.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:data_table_2/data_table_2.dart';

///Chama [MyHomePage]
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

///Tela principal da aplicação.
///
///Mostra um gráfico e um relatório, com a opção de gerar números aleátorios para preenche-los. No gráfico também
///é possível escolher entre mostrar multiplas séries ou não.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///Instância de controller. Utilizado para chamar todas as operações dos dados.
  NumberController controller = NumberController();

  ///Quantidade de séries, atualizada no [TextField] e utilizado com [controller].
  int seriesQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráfico")),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 5),
          const Center(
              child: Text(
                  "Clique no botão para gerar o seu primeiro conjunto de números. Clique novamente para gerar um novo conjunto.")),
          const SizedBox(height: 5),
          ElevatedButton(

              ///Gera os números para preencher os gráficos.
              onPressed: () {
                // setState(() {
                //   controller.generateNumbers();
                // });
                controller.generateNumbers(modelQty: seriesQty);
              },
              child: const Text("Gerar números")),
          StaggeredGrid.count(
            crossAxisCount: 1,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                    elevation: 5,
                    child: Observer(
                      builder: (context) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: TextField(
                                controller: TextEditingController()..text = '1',
                                onChanged: (text) {
                                  if (text != "" && text != "0") {
                                    seriesQty = int.parse(text);
                                  }
                                },
                                decoration: const InputDecoration(
                                    labelText: "Digite o numero de séries"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                            SfCartesianChart(
                                //primaryXAxis: Axis,
                                title: ChartTitle(text: 'Número por Ano'),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <LineSeries>[
                                  ...getLineSeries(controller.modelList)
                                ])
                          ],
                        );
                      },
                    )),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 3,
                child: Card(
                    elevation: 5,
                    child: Observer(
                      builder: (context) {
                        return StaggeredGrid.count(
                          crossAxisCount: 1,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: [
                            DropdownButton<String>(
                                value: controller.dropdownValue.toString(),
                                hint: const Text(
                                    "Selecione qual lista deseja vizualizar."),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                items: controller.dropDownOptions,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller.dropdownValue = newValue;
                                  });
                                }),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 4,
                              child: DataTable2(
                                columnSpacing: 1,
                                horizontalMargin: 4,
                                minWidth: MediaQuery.of(context).size.width / 2,
                                columns: const [
                                  DataColumn(
                                    label: Text('Valor'),
                                    // size: ColumnSize.L,
                                    numeric: true,
                                  ),
                                  DataColumn(label: Text('Ano'), numeric: true),
                                ],
                                rows: List<DataRow>.generate(
                                  controller.modelList[int.parse(controller.dropdownValue ?? "0") - 1].length,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                            "${controller.modelList[int.parse(controller.dropdownValue ?? "0") - 1][index].number}"),
                                      ),
                                      DataCell(
                                        Text(
                                            "${controller.modelList[int.parse(controller.dropdownValue ?? "0") - 1][index].year}"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  ///Pega a matriz [modelList] e cria uma [LineSeries] para cada lista de [NumberModel] dentro dela. Retorna uma lista de [LineSeries]
  List<LineSeries> getLineSeries(List<List<NumberModel>> modelList) {
    List<LineSeries> list = [];

    for (List<NumberModel> temp in modelList) {
      list.add(LineSeries<NumberModel, int>(
          dataSource: temp,
          xValueMapper: (NumberModel valor, _) => valor.year,
          yValueMapper: (NumberModel valor, _) => valor.number));
    }
    return list;
  }
}
