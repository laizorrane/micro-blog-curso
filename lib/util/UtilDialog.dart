import 'package:flutter/material.dart';
import 'package:microblog/util/BotaoPadrao.dart';

class UtilDialog {
  static void exibirInformacao(BuildContext context,
      {String titulo, String mensagem}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$titulo",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text("$mensagem"),
                  SizedBox(
                    height: 16,
                  ),
                  BotaoPadrao(
                    value: "Ok, entendido",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

