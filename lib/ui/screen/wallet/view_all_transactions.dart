import 'dart:math';
import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/wallet_datasource.dart';
import 'package:genericwidgetapp/time_difference.dart';
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
    String time = TimeDifference.time(walletModel.timeStamp);
    String date = TimeDifference.date(walletModel.timeStamp);
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "+ ${token(walletModel.amount, 18, fractionDecimal: 2)}",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(height: 8.0),
              Text(
                "${walletModel.contract.toUpperCase().replaceRange(0, 9, "")}",
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          title: Icon(Icons.refresh),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                date,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
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
