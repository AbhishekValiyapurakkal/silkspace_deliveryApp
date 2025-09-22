import 'package:flutter/material.dart';

class Elvbtn extends StatefulWidget {
  const Elvbtn(
      {super.key,
      required this.txt,
      required this.ontap,
      required int height,
      required int width});
  final String txt;
  final VoidCallback ontap;

  @override
  State<Elvbtn> createState() => _ElvbtnState();
}

class _ElvbtnState extends State<Elvbtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.ontap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.blue, Colors.green]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 2,
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          child: Center(
              child: Text(
            widget.txt,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          )),
        ));
  }
}
