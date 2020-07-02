class UserAccountBalance {
  final String balance;
  final String boostCap;

  UserAccountBalance({this.balance, this.boostCap});

  factory UserAccountBalance.fromJSON(Map<String, dynamic> json) {
    return UserAccountBalance(
      balance: json['balance'],
      boostCap: json['boostCap'],
    );
  }
}
