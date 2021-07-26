import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.camera), 
           onPressed: () async{
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131', 'Cancelar', false, ScanMode.QR,);
              launchURL(barcodeScanRes);      
          },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,    
    );
  }

  void launchURL(String url) async =>
    await canLaunch(url)
        ? await launch(url)
        : throw 'error $url';
}