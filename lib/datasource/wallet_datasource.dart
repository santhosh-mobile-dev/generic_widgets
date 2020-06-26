import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genericwidgetapp/constants/api.dart';
import 'package:genericwidgetapp/models/wallet_model.dart';
import 'package:http/http.dart' as http;

class WalletDataSource extends ChangeNotifier {
  List<WalletModel> wallet = [];

  void fetchWalletDetails() async {
    final response = await http.get(
      Api.userTrsndsctions,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['transactions']) {
      WalletModel walletModel = WalletModel.fromJSON(json);
      wallet.add(walletModel);
      notifyListeners();
    }
  }

  WalletModel objectAtIndexPath(int indexPath) {
    if (indexPath < wallet.length) {
      return wallet.elementAt(indexPath);
    }
    return null;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
