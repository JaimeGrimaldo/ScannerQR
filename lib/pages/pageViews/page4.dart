import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page4 extends StatefulWidget {
  Page4({Key? key}) : super(key: key);

  @override
  Pages4 createState() => Pages4();
 }

class Pages4 extends State<Page4> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.camera), 
           onPressed: () async{
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131', 'Cancelar', false, ScanMode.QR,);
              setState(() {
                data = barcodeScanRes;
              });
            
          },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body :Container(
          child:Center(
            child:Text(data)
          ),
      ),
       
    );
  }
}