import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _infoText = "Casa Vazia!";

  void _changePessoas(int pessoa) {
    setState(() {
      if ((_pessoas == 0 && pessoa > 0 || _pessoas == 10 && pessoa < 0)) {
        _pessoas += pessoa;
      } else if (_pessoas > 0 && _pessoas < 10) {
        _pessoas += pessoa;
        _infoText = "Pode Entrar";
      } else if (_pessoas == 0) {
        _infoText = "Casa Vazia!";
      } else {
        _infoText = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/show.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePessoas(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePessoas(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            )
          ],
        )
      ],
    );
  }
}
