import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemplo_grafico/controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //   Card(child: SfCartesianChart(
                //     primaryXAxis: CategoryAxis(),
                //     series: <LineSeries<int, String>>[
                //       LineSeries<int, String>(
                //         dataSource: <int>[
                //           4,5,6,10,78,2,55,64,32,86,10
                //         ],
                //         xValueMapper: (um, dois) => "$um indice",
                //         yValueMapper: (um, dois) => um
                //       )
                //     ],
                //   )),
                //   Card(child: SfCircularChart ()),
                //   ],)
           TextField(
            decoration: InputDecoration(labelText: 'Nome'),
           ),
           SizedBox(height: 20,),
           TextField(
            decoration: InputDecoration(labelText: 'Sobrenome'),
           ),
           SizedBox(height: 20),
           Text('Nome Completo'),
          ],
        ),
      ),
    );
  }
}
