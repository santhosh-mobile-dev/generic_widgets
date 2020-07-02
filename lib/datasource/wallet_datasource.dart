import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genericwidgetapp/constants/api.dart';
import 'package:genericwidgetapp/models/wallet/purchase_coins_rate.dart';
import 'package:genericwidgetapp/models/wallet/wallet_overview.dart';
import 'package:http/http.dart' as http;

import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/wallet/user_account_balance.dart';
import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/wallet/wallet_model.dart';

class WalletDataSource extends ChangeNotifier {
  List<WalletModel> wallets = [];
  String userAccountBalances;
  String rewords;
  int score;
  String rate;

  void fetchWallet() async {
    final response = await http.get(
      Api.wallet_url,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
//    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['transactions']) {
      WalletModel wallet = WalletModel.fromJSON(json);
      wallets.add(wallet);
      notifyListeners();
    }
  }

  WalletModel objectAtIndexPath(int indexPath) {
    if (indexPath < wallets.length) {
      return wallets.elementAt(indexPath);
    }
    return null;
  }

  void getUserCurrentBalance() async {
    final response = await http.get(
      Api.user_balance_url,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
//    print(response.body);
    Map<String, dynamic> respJson = json.decode(response.body);
    UserAccountBalance userBalance = UserAccountBalance.fromJSON(respJson);
    userAccountBalances = userBalance.balance;
    notifyListeners();
  }

  void getWalletOverview() async {
    final response = await http.get(
      Api.contribution_overview,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
//    print(response.body);
    Map<String, dynamic> respJson = json.decode(response.body);
    WalletScoreOverview userOverview = WalletScoreOverview.fromJson(respJson);
    rewords = userOverview.currentReward;
    score = userOverview.yourShare;
    notifyListeners();
  }

  void getPredefinedTokenValue() async {
    final response = await http.get(
      Api.buy_coins_url,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
    print(response.body);
    Map<String, dynamic> respJson = json.decode(response.body);
    CoinsRate coinsRate = CoinsRate.fromJson(respJson);
    rate = coinsRate.rate as String;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
