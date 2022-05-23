import 'dart:ffi';

import 'components/transaction_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTestes'),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('teste card'),
                  elevation: 5,
                ),
              ),
              TransactionUser(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Button 1'),
                    onPressed: () => _toast("Olá, você pressionou o botão 1"),
                    splashColor: Colors.blueGrey,
                    textColor: Colors.white,
                    color: Colors.blue,
                  ),
                  RaisedButton(
                    child: Text('Button 2'),
                    onPressed: () => _exibeDialogo(context),
                  ),
                  RaisedButton(
                    child: Text('Button 3'),
                    onPressed: null,
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}

void _toast(String toast) {
  Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void _exibeDialogo(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Você pressionou o Botão 2?"),
        content: new Text(
            "Precisamos da confirmação se você pressionou mesmo o botão 2"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Cancelar"),
            textColor: Color.fromRGBO(255, 0, 0, 1),
            onPressed: () => Navigator.pop(context),
          ),
          new FlatButton(
              child: new Text("Não"),
              onPressed: () => {
                    _toast("Mentira"),
                    Navigator.pop(context),
                  }),
          new FlatButton(
            child: new Text("Sim"),
            onPressed: () => {
              _toast("Verdade"),
              Navigator.pop(context),
            },
          ),
        ],
      );
    },
  );
}
