// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NumberController on NumberControllerBase, Store {
  late final _$modelAtom =
      Atom(name: 'NumberControllerBase.model', context: context);

  @override
  NumberModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(NumberModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
