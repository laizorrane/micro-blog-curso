import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  final Function() clique;
  const MenuItem({Key key, this.icon, this.title, String value, this.clique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clique,
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.cyan, size: 30),
            SizedBox(width: 20),
            Text(title, style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Colors.blue
            ),)

          ],
        ),
      ),
    );
  }
}
