// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NumberController on NumberControllerBase, Store {
  late final _$modelListAtom =
      Atom(name: 'NumberControllerBase.modelList', context: context);

  @override
  ObservableList<List<NumberModel>> get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(ObservableList<List<NumberModel>> value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$showSeriesAtom =
      Atom(name: 'NumberControllerBase.showSeries', context: context);

  @override
  bool get showSeries {
    _$showSeriesAtom.reportRead();
    return super.showSeries;
  }

  @override
  set showSeries(bool value) {
    _$showSeriesAtom.reportWrite(value, super.showSeries, () {
      super.showSeries = value;
    });
  }

  late final _$NumberControllerBaseActionController =
      ActionController(name: 'NumberControllerBase', context: context);

  @override
  dynamic changeShowSeries(bool value) {
    final _$actionInfo = _$NumberControllerBaseActionController.startAction(
        name: 'NumberControllerBase.changeShowSeries');
    try {
      return super.changeShowSeries(value);
    } finally {
      _$NumberControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void generateNumbers({dynamic amount = 20, dynamic modelQty = 3}) {
    final _$actionInfo = _$NumberControllerBaseActionController.startAction(
        name: 'NumberControllerBase.generateNumbers');
    try {
      return super.generateNumbers(amount: amount, modelQty: modelQty);
    } finally {
      _$NumberControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
modelList: ${modelList},
showSeries: ${showSeries}
    ''';
  }
}
