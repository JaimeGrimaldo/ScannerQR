import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:prueba_aplicacion/providers/ui_provider.dart';
import 'package:prueba_aplicacion/widgets/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
      child: MaterialApp(
        title: 'Provider',
        initialRoute: 'home',
        routes: {
          'home': (_) => Resultado(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
