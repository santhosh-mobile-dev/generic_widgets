import 'dart:math';
import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/wallet_datasource.dart';
import 'package:genericwidgetapp/ui/screen/wallet/purchase_coin.dart';
import 'package:genericwidgetapp/ui/screen/wallet/view_all_transactions.dart';
import 'package:genericwidgetapp/ui/widgets/custom_flat_button.dart';

import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/wallet/wallet_model.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  WalletDataSource walletDataSource = WalletDataSource();

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
      height: MediaQuery.of(context).size.height / 2.6,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text("Wallet", style: TextStyle(color: Colors.white, fontSize: 16.0)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                "Wallet is a single place to check all your transactions, rewards, withdrawals, next payout, contributions and coins available.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ),
          SizedBox(height: 10),
          Text("Coins",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
          SizedBox(height: 10),
          Center(
            child: Container(
              child: Text(
                walletDataSource.userAccountBalances != null
                    ? "${token(walletDataSource.userAccountBalances, 18, fractionDecimal: 1)}"
                    : "",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          CustomFlatButton(
            text: "Buy Coins",
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            bgColor: Colors.white,
            onClick: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PurchaseCoin()));
            },
          )
        ],
      ),
    );
  }

  Widget overviewRewards() {
    return Container(
      margin: EdgeInsets.only(top: 200.0),
      child: Column(
        children: <Widget>[
          Text("Overview", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("${walletDataSource.rewords}",
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  Text("Your Score", style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(width: 60),
              Column(
                children: <Widget>[
                  Text("${walletDataSource.score}",
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  Text("Rewards", style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget recentViewTransaction() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: MediaQuery.of(context).size.height / 0.32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Recent Transaction',
              style: TextStyle(color: Colors.deepPurple)),
          InkWell(
            child: Text('View All', style: TextStyle(color: Colors.deepPurple)),
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
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("+ ${token(walletModel.amount, 18, fractionDecimal: 2)}"),
          ],
        ),
        title: Icon(Icons.refresh),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(""),
          ],
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
            margin: EdgeInsets.only(top: 320),
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
