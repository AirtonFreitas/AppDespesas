import 'dart:math';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 182.99,
      date: DateTime.parse('2021-09-27'),
    ),
    Transaction(
      id: 't2',
      title: 'Conta Luz',
      value: 359.12,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta Agua',
      value: 80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Internet',
      value: 105.12,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Compras',
      value: 650.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Faculdade',
      value: 120.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Aluguel',
      value: 800,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
