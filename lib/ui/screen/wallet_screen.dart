import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/wallet_datasource.dart';
import 'package:genericwidgetapp/models/wallet_model.dart';
import 'package:genericwidgetapp/ui/widgets/transaction_items.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  WalletDataSource walletDataSource = WalletDataSource();

  @override
  void initState() {
    walletDataSource.addListener(dataSourceDidChange);
    walletDataSource.fetchWalletDetails();
    super.initState();
  }

  void dataSourceDidChange() {
    setState(() {});
  }

  Widget buildItem(BuildContext context, int indexPath) {
    final WalletModel walletModel = walletDataSource.objectAtIndexPath(indexPath);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${walletModel.amount}"),
            Text("Contribution"),
          ],
        ),
        title: Icon(Icons.refresh),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Contributes"),
            Text("Contributes"),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    print(walletDataSource.wallet.length);
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: walletDataSource.wallet.length > 5 ? 5
              : walletDataSource.wallet.length == 0 ? 1
              : walletDataSource.wallet.length,
          itemBuilder: buildItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
