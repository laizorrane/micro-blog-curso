import 'package:flutter/material.dart';

class TextFieldPadrao extends StatelessWidget {
  final Function(String text) onChanged;
  final String titulo;
  final bool obscureText;
  const TextFieldPadrao(
      {Key key, this.onChanged, this.titulo, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: titulo?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("$titulo"),
            )),
        Container(
          height: 45,
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                fillColor: Colors.white70),
          ),
        ),
      ],
    );
  }
}
