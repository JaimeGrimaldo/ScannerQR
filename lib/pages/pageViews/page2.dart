import 'package:flutter/material.dart';
import 'package:prueba_aplicacion/widgets/bottom_camera.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => Pages2();
}

class Pages2 extends State<Page2> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: BottomCamera(),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.red : Colors.blue,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
          ),
      ),
    );
  }
}