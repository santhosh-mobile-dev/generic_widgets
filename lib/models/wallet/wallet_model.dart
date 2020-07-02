import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/notification/User.dart';

class WalletModel {
  final int userguid;
  final User user;
  final String walletAddress;
  final String tx;
  final String amount;
  final bool failed;
  final int timeStamp;
  final String contract;
  final User receiver;
  final String guid;

  WalletModel({
    this.userguid,
    this.user,
    this.tx,
    this.walletAddress,
    this.amount,
    this.failed,
    this.timeStamp,
    this.contract,
    this.receiver,
    this.guid,
  });

  factory WalletModel.fromJSON(Map<String, dynamic> json) {
    return WalletModel(
      userguid: json['user_guid'],
      user: User.fromJSON(json['user']),
      walletAddress: json['wallet_address'],
      tx: json['tx'],
      amount: json['amount'],
      failed: json['failed'],
      timeStamp: json['timestamp'],
      contract: json['contract'],
      receiver: User.fromJSON(json['receiver']),
      guid: json['guid'],
    );
  }
}
