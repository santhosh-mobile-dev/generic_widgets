import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/wallet_datasource.dart';
import 'package:genericwidgetapp/time_difference.dart';
import 'package:genericwidgetapp/ui/screen/wallet/view_all_transactions.dart';
import 'package:genericwidgetapp/ui/widgets/custom_flat_button.dart';
import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/wallet/wallet_model.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  WalletDataSource walletDataSource = WalletDataSource();
  var date = DateTime.now();

  @override
  void initState() {
    walletDataSource.addListener(dataSourceDidChange);
    walletDataSource.fetchWallet();
    walletDataSource.getUserCurrentBalance();
    walletDataSource.getWalletOverview();
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

  Widget getWalletDetails() {
    return Container(
      color: Colors.deepPurple,
      height: MediaQuery.of(context).size.height / 4.2,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text("Wallet", style: TextStyle(color: Colors.white, fontSize: 24.0)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                "Wallet is a single place to check all your transactions, rewards, withdrawals, next payout, contributions and coins available.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14.0)),
          ),
          SizedBox(height: 10),
          Text("Coins",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24.0)),
          SizedBox(height: 10),
          Center(
            child: Container(
              child: Text(
                walletDataSource.userAccountBalances != null
                    ? "${token(walletDataSource.userAccountBalances, 18, fractionDecimal: 1)}"
                    : "",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
          CustomFlatButton(
            text: "Buy Coins",
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            bgColor: Colors.white,
            onClick: () {},
          )
        ],
      ),
    );
  }

  Widget overviewRewards() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 4.0,
          bottom: MediaQuery.of(context).size.height / 2.26,
          left: 80.0,
          right: 80.0),
      child: Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text("Overview", style: TextStyle(fontSize: 24.0)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("${walletDataSource.rewords}",
                          style: TextStyle(fontSize: 24.0)),
                      Text("Your Score")
                    ],
                  ),
                  SizedBox(width: 60),
                  Column(
                    children: <Widget>[
                      Text("${walletDataSource.score}",
                          style: TextStyle(fontSize: 24.0)),
                      Text("Rewards")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentViewTransaction() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: MediaQuery.of(context).size.height / 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Recent Transaction',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
          InkWell(
            child: Text('View All',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAllTransactions()));
            },
          ),
        ],
      ),
    );
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          getWalletDetails(),
          overviewRewards(),
          recentViewTransaction(),
          Container(
            margin: EdgeInsets.only(top: 400.0),
            child: ListView.builder(
              itemCount: walletDataSource.wallets.length,
              itemBuilder: buildItem,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
