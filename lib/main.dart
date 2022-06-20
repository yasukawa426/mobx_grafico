
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx_exemplo_grafico/view/android/android_page.dart';
import 'package:mobx_exemplo_grafico/view/ios/ios_page.dart';
///Checa a plataforma e redireciona para a tela correta.
void main() {
  Platform.isIOS ? runApp(const IosApp()) : runApp(const AndroidApp());
  // runApp(const AndroidApp());
}


