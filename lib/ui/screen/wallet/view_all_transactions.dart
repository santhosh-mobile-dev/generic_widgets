import 'dart:math';

import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/wallet_datasource.dart';

import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/wallet/wallet_model.dart';

class ViewAllTransactions extends StatefulWidget {
  @override
  _ViewAllTransactionsState createState() => _ViewAllTransactionsState();
}

class _ViewAllTransactionsState extends State<ViewAllTransactions> {
  WalletDataSource walletDataSource = WalletDataSource();

  @override
  void initState() {
    walletDataSource.addListener(dataSourceDidChange);
    walletDataSource.fetchWallet();
    super.initState();
  }

  void dataSourceDidChange() {
    setState(() {});
  }

  token(token, decimal, {fractionDecimal}) {
    if (fractionDecimal == null) fractionDecimal = 3;
    return (double.parse(token) / pow(10, decimal))
        .toStringAsFixed(fractionDecimal);
  }

  Widget buildItem(BuildContext context, int indexPath) {
    WalletModel walletModel = walletDataSource.objectAtIndexPath(indexPath);

    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("+ ${token(walletModel.amount, 18, fractionDecimal: 2)}"),
//            Text("Contribution"),
          ],
        ),
        title: Icon(Icons.refresh),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Text("Contributes"),
//            Text("Contributes"),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    print(walletDataSource.wallets.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: walletDataSource.wallets.length,
          itemBuilder: buildItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
