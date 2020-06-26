import 'package:genericwidgetapp/models/User.dart';

class WalletModel {

  int userGuid;
  User user;
  String walletAddress;
  String tx;
  String amount;
  bool failed;
  int timestamp;
  String contract;
  String guid;

  WalletModel({
    this.userGuid,
    this.amount,
    this.user,
    this.walletAddress,
    this.tx,
    this.failed,
    this.timestamp,
    this.contract,
    this.guid,
  });

  factory WalletModel.fromJSON(Map<String, dynamic> json) {
    return WalletModel(
        userGuid: json['user_guid'],
        user: User.fromJSON(json['user']),
        walletAddress: json['wallet_address'],
        tx: json['tx'],
        amount: json['amount'],
        failed: json['failed'],
        timestamp: json['timestamp'],
        contract: json['contract'],
        guid: json['guid'],
    );
  }
//  final String contract;
//  final Transactions transactions;
//
//  WalletModel({this.contract, this.transactions});
//
//  factory WalletModel.fromJSON(Map<String, dynamic> json) {
//    return WalletModel(
//      contract: json['contract'],
//      transactions: Transactions.fromJSON(json['transactions']),
//    );
//  }
}
