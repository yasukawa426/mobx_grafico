import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobx_exemplo_grafico/blocs-viewModel/number_controller.dart';
import 'package:mobx_exemplo_grafico/model/number_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:data_table_2/data_table_2.dart';

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
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 5),
          const Center(
              child: Text(
                  "Clique no botão para gerar o seu primeiro conjunto de números. Clique novamente para gerar um novo conjunto.")),
          const SizedBox(height: 5),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.generateNumbers();
                });
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
                            SfCartesianChart(
                                //primaryXAxis: Axis,
                                title: ChartTitle(text: 'Número por Ano'),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <LineSeries>[
                                  LineSeries<NumberModel, int>(
                                      dataSource: controller.modelList,
                                      xValueMapper: (NumberModel valor, _) =>
                                          valor.year,
                                      yValueMapper: (NumberModel valor, _) =>
                                          valor.number),
                                ]),
                            Text("${controller.modelList[0].number}")
                          ],
                        );
                      },
                    )),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                    elevation: 5,
                    child: Observer(
                      builder: (context) {
                        return DataTable2(
                          columnSpacing: 5,
                          horizontalMargin: 5,
                          minWidth: MediaQuery.of(context).size.width,
                          columns: const [
                            DataColumn2(
                              label: Text('Valor'),
                              // size: ColumnSize.L,
                              numeric: true,
                            ),
                            DataColumn(label: Text('Ano'), numeric: true),
                          ],
                          rows: List<DataRow>.generate(
                              controller.modelList.length,
                              (index) => DataRow(cells: [
                                    DataCell(Text(
                                        "${controller.modelList[index].number}")),
                                    DataCell(Text(
                                        "${controller.modelList[index].year}")),
                                  ])),
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
}
