import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class elvbtn extends StatefulWidget {
  const elvbtn({super.key, required this.txt, required this.ontap, required int height, required int width});
  final String txt;
  final VoidCallback ontap;

  @override
  State<elvbtn> createState() => _elvbtnState();
}

class _elvbtnState extends State<elvbtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.ontap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              //color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 2,
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          child: Center(
              child: Text(
            widget.txt!,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          )),
        ));
  }
}
